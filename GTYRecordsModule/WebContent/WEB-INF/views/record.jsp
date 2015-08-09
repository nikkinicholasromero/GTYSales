<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>GTY | Records Module</title>
<link rel="stylesheet" type="text/css" href="resources/sbadmin/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/sbadmin/bower_components/metisMenu/dist/metisMenu.min.css">
<link rel="stylesheet" type="text/css" href="resources/sbadmin/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css" href="resources/sbadmin/bower_components/datatables-responsive/css/dataTables.responsive.css">
<link rel="stylesheet" type="text/css" href="resources/sbadmin/dist/css/sb-admin-2.css">
<link rel="stylesheet" type="text/css" href="resources/sbadmin/bower_components/font-awesome/css/font-awesome.min.css">
	
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>

<body>

	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> 
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="">GTY Records Module</a>
			</div>
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li><a href="branches">Branches</a></li>
						<li><a href="records">Records</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Records</h1>
				</div>
				<div class="panel-body">
					<div class="dataTable_wrapper">
						<table class="table table-striped table-bordered table-hover" id="dataTables-records">
							<thead>
								<tr>
									<th style="display:none;">ID</th>
									<th>Branch</th>
									<th>TR Date</th>
									<th>Rec Date</th>
									<th>Sales</th>
									<th>Expense</th>
									<th>OD</th>
									<th>Adv Pymnt</th>
									<th>New Members</th>
									<th>OC</th>
									<th>NC</th>
									<th>DC</th>
									<th>Consig</th>
									<th>C-o-H</th>
									<th>CashDeposit</th>
									<th>CoH-Difference</th>
									<th>AdditionalCash</th>
									<th>Update</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${records}" var="record">
									<tr id="recordId_${record.id}">
										<td style="display: none;"><c:out value="${record.id}" /></td>
										<td><c:out value="${record.branchName}" /></td>
										<td><c:out value="${record.transactionDate}" /></td>
										<td><c:out value="${record.recordDate}" /></td>
										<td><c:out value="${record.sales}" /></td>
										<td><c:out value="${record.expense}" /></td>
										<td><c:out value="${record.overdue}" /></td>
										<td><c:out value="${record.advancedPayments}" /></td>
										<td><c:out value="${record.newMembers}" /></td>
										<td><c:out value="${record.openConsignment}" /></td>
										<td><c:out value="${record.newConsignment}" /></td>
										<td><c:out value="${record.dueConsignment}" /></td>
										<td><c:out value="${record.consignment}" /></td>
										<td><c:out value="${record.cashOnHand}" /></td>
										<td><c:out value="${record.cashDeposit}" /></td>
										<td><c:out value="${record.cashOnHandDifference}" /></td>
										<td><c:out value="${record.additionalCash}" /></td>
										<td style="width: 100px;"><input type="button" value="Update" class="btn btn-xs btn-block btn-flat" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="resources/sbadmin/bower_components/jquery/dist/jquery.min.js"></script>
	<script src="resources/sbadmin/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="resources/sbadmin/bower_components/metisMenu/dist/metisMenu.min.js"></script>
	<script src="resources/sbadmin/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script src="resources/sbadmin/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
	<script src="resources/sbadmin/dist/js/sb-admin-2.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-records').DataTable({
				responsive: true
			});
		});
	</script>
</body>

</html>