<%@ Page Title="Login" Language="vb" AutoEventWireup="false" CodeBehind="loginForm.aspx.vb" Inherits="test.loginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="description" content="" />
	<meta name="author" content="" />

	<title>SB Admin 2 - Bootstrap Admin Theme</title>

	<!-- Bootstrap Core CSS -->
	<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

	<!-- MetisMenu CSS -->
	<link href="./vendor/metisMenu/metisMenu.min.css" rel="stylesheet" />

	<!-- Custom CSS -->
	<link href="./Content/sb-admin-2.css" rel="stylesheet" />

	<!-- Custom Fonts -->
	<link href="./vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form id="form1" runat="server">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="login-panel panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Please Sign In</h3>
						</div>
						<div class="panel-body">
							<fieldset>
								<div class="form-group">
									<asp:TextBox ID="username" CssClass="form-control" runat="server" placeholder="username" />
								</div>
								<div class="form-group">
									<asp:TextBox ID="password" CssClass="form-control" TextMode="password" runat="server" placeholder="password" />
								</div>

								<asp:Button ID="login" CssClass="btn btn-lg btn-success btn-block" Text="Login" runat="server" />

								<div>
									<asp:Label ID="result" runat="server" Text="Label"></asp:Label>

								</div>
							</fieldset>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- jQuery -->
		<script src="./vendor/jquery/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="./vendor/bootstrap/js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="./vendor/metisMenu/metisMenu.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="./Scripts/sb-admin-2.js"></script>


	</form>

</body>
</html>
