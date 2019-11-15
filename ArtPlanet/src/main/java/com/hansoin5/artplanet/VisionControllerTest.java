package com.hansoin5.artplanet;

import com.google.api.gax.longrunning.OperationFuture;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.Storage.BlobListOption;
import com.google.cloud.storage.StorageOptions;
import com.google.cloud.vision.v1.AnnotateFileResponse;
import com.google.cloud.vision.v1.AnnotateFileResponse.Builder;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.AsyncAnnotateFileRequest;
import com.google.cloud.vision.v1.AsyncAnnotateFileResponse;
import com.google.cloud.vision.v1.AsyncBatchAnnotateFilesResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Block;
import com.google.cloud.vision.v1.ColorInfo;
import com.google.cloud.vision.v1.CropHint;
import com.google.cloud.vision.v1.CropHintsAnnotation;
import com.google.cloud.vision.v1.DominantColorsAnnotation;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.FaceAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.GcsDestination;
import com.google.cloud.vision.v1.GcsSource;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageContext;
import com.google.cloud.vision.v1.ImageSource;
import com.google.cloud.vision.v1.InputConfig;
import com.google.cloud.vision.v1.LocalizedObjectAnnotation;
import com.google.cloud.vision.v1.LocationInfo;
import com.google.cloud.vision.v1.OperationMetadata;
import com.google.cloud.vision.v1.OutputConfig;
import com.google.cloud.vision.v1.Page;
import com.google.cloud.vision.v1.Paragraph;
import com.google.cloud.vision.v1.SafeSearchAnnotation;
import com.google.cloud.vision.v1.Symbol;
import com.google.cloud.vision.v1.TextAnnotation;
import com.google.cloud.vision.v1.WebDetection;
import com.google.cloud.vision.v1.WebDetection.WebEntity;
import com.google.cloud.vision.v1.WebDetection.WebImage;
import com.google.cloud.vision.v1.WebDetection.WebLabel;
import com.google.cloud.vision.v1.WebDetection.WebPage;
import com.google.cloud.vision.v1.WebDetectionParams;
import com.google.cloud.vision.v1.Word;

import com.google.protobuf.ByteString;

import com.google.protobuf.util.JsonFormat;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VisionControllerTest
{
	private static Image getImage(String filePath) throws IOException
	{
		Image image;

		if (filePath.startsWith("gs://"))
		{ // GCS에서 이미지를 가져올때 image 생성
			ImageSource imgSource = ImageSource.newBuilder().setGcsImageUri(filePath).build();
			image = Image.newBuilder().setSource(imgSource).build();
		} else
		{ // 로컬에서 이미지를 가져올때 image 생성
			ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));
			image = Image.newBuilder().setContent(imgBytes).build();
		}

		return image;
	}

	public static void detectLabels(String filePath) throws Exception
	{
		List<AnnotateImageRequest> requests = new ArrayList();

		Image image = getImage(filePath);

		Feature feature = Feature.newBuilder().setType(Feature.Type.LABEL_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feature).setImage(image).build();
		requests.add(request);

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create())
		{
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses)
			{
				if (res.hasError())
				{
					System.out.println("Error: " + res.getError().getMessage());
					return;
				}

				// For full list of available annotations, see http://g.co/cloud/vision/docs
				for (EntityAnnotation annotation : res.getLabelAnnotationsList())
				{
					annotation.getAllFields().forEach((k, v) -> System.out.println(k + " : " + v.toString()));
				}
			}
		}
	}
	@RequestMapping("/extractLabels")
	public String detectLabelsGcs() throws Exception, IOException
	{
		String gcsPath = "https://storage.cloud.google.com/art-planet-storage/blog/2019-11-15-072752662_kitten.png";
		//https://storage.googleapis.com/art-planet-storage/blog/2019-11-15-072752662_kitten.png
		//https://storage.cloud.google.com/art-planet-storage/blog/2019-11-15-072752662_kitten.png
		List<AnnotateImageRequest> requests = new ArrayList<>();
		System.out.println("gcsPath:"+gcsPath);
		ImageSource imgSource = ImageSource.newBuilder().setGcsImageUri(gcsPath).build();
		System.out.println("1");
		Image img = Image.newBuilder().setSource(imgSource).build();
		System.out.println("2");
		Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
		System.out.println("3");
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		System.out.println("4");
		requests.add(request);
		System.out.println("5");

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create())
		{
			System.out.println("6");
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			System.out.println("7");
			List<AnnotateImageResponse> responses = response.getResponsesList();
			System.out.println("8");

			for (AnnotateImageResponse res : responses)
			{
				System.out.println("9");
				if (res.hasError())
				{
					System.out.println("10");
					System.out.printf("Error: %s\n", res.getError().getMessage());
					return "fail";
				}

				// For full list of available annotations, see http://g.co/cloud/vision/docs
				for (EntityAnnotation annotation : res.getLabelAnnotationsList())
				{
					annotation.getAllFields().forEach((k, v) -> System.out.printf("%s : %s\n", k, v.toString()));
				}
			}
		}
		return "success";
	}
}
