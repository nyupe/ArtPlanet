<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>유효성 검사 테스트</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="description"
	content="Inline validation is very easy to implement using the Kero Dashboard.">
<link rel="icon" href="favicon.ico">

<link href="./main.07a59de7b920cd76b874.css" rel="stylesheet">
</head>
<body>
<div class="app-inner-layout app-inner-layout-page">
	<div class="app-inner-layout__wrapper">
		<div class="app-inner-layout__content pt-1">
			<div class="tab-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="main-card mb-3 card">
								<div class="card-body">
									<h5 class="card-title">Bootstrap 4 Form Validation</h5>
									<form id="signupForm" class="col-md-10 mx-auto"
										method="post" action="">
										<div class="form-group">
											<label for="firstname">First name</label>
											<div>
												<input type="text" class="form-control" id="firstname"
													name="firstname" placeholder="First name" />
											</div>
										</div>
	
										<div class="form-group">
											<label for="lastname">Last name</label>
											<div>
												<input type="text" class="form-control" id="lastname"
													name="lastname" placeholder="Last name" />
											</div>
										</div>
	
										<div class="form-group">
											<label for="username">Username</label>
											<div>
												<input type="text" class="form-control" id="username"
													name="username" placeholder="Username" />
											</div>
										</div>
	
										<div class="form-group">
											<label for="email">Email</label>
											<div>
												<input type="text" class="form-control" id="email"
													name="email" placeholder="Email" />
											</div>
										</div>
	
										<div class="form-group">
											<label for="password">Password</label> <input
												type="password" class="form-control" id="password"
												name="password" placeholder="Password" />
										</div>
	
										<div class="form-group">
											<label for="confirm_password">Confirm password</label>
											<div>
												<input type="password" class="form-control"
													id="confirm_password" name="confirm_password"
													placeholder="Confirm password" />
											</div>
										</div>
	
										<div class="form-group">
											<div>
												<div class="form-check">
													<input type="checkbox" id="agree" name="agree"
														value="agree" class="form-check-input" /> <label
														class="form-check-label">Please agree to our
														policy</label>
												</div>
											</div>
										</div>
	
										<div class="form-group">
											<button type="submit" class="btn btn-primary"
												name="signup" value="Sign up">Sign up</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="./main.07a59de7b920cd76b874.js"/>		
</body>
</html>