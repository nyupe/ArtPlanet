<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<style type="text/css">
  .demo-droppable {
    background: #08c;
    color: #fff;
    padding: 100px 0;
    text-align: center;
  }
  .demo-droppable.dragover {
    background: #00CC71;
  }
</style>
<div class="demo-droppable">
  <p>파일 끌거나 클릭클릭~~~~~~~~~</p>
</div>
<div class="output"></div>
<div><a href="http://bitwiser.in/2015/08/08/creating-dropzone-for-drag-drop-file.html" class="mui-btn mui-btn-primary mui-btn-lg">뒤로가기</a></div>
<script type="text/javascript">
  (function(window) {
    function triggerCallback(e, callback) {
      if(!callback || typeof callback !== 'function') {
        return;
      }
      var files;
      if(e.dataTransfer) {
        files = e.dataTransfer.files;
      } else if(e.target) {
        files = e.target.files;
      }
      callback.call(null, files);
    }
    function makeDroppable(ele, callback) {
      var input = document.createElement('input');
      input.setAttribute('type', 'file');
      input.setAttribute('multiple', true);
      input.style.display = 'none';
      input.addEventListener('change', function(e) {
        triggerCallback(e, callback);
      });
      ele.appendChild(input);
      
      ele.addEventListener('dragover', function(e) {
        e.preventDefault();
        e.stopPropagation();
        ele.classList.add('dragover');
      });

      ele.addEventListener('dragleave', function(e) {
        e.preventDefault();
        e.stopPropagation();
        ele.classList.remove('dragover');
      });

      ele.addEventListener('drop', function(e) {
        e.preventDefault();
        e.stopPropagation();
        ele.classList.remove('dragover');
        triggerCallback(e, callback);
      });
      
      ele.addEventListener('click', function() {
        input.value = null;
        input.click();
      });
    }
    window.makeDroppable = makeDroppable;
  })(this);
  (function(window) {
    makeDroppable(window.document.querySelector('.demo-droppable'), function(files) {
      console.log(files);
      var output = document.querySelector('.output');
      output.innerHTML = '';
      for(var i=0; i<files.length; i++) {
        if(files[i].type.indexOf('image/') === 0) {
          output.innerHTML += '<img width="200" src="' + URL.createObjectURL(files[i]) + '" />';
        }
        output.innerHTML += '<p>'+files[i].name+'</p>';
      }
    });
  })(this);
</script>
</body>
</html>


