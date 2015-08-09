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

<title>GTY | Sales</title>
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
				<a class="navbar-brand" href="">GTY Sales</a>
			</div>
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li><a href="banks">Bank</a></li>
						<li><a href="branches">Branches</a></li>
						<li><a href="discrepancies">Discrepancies</a></li>
						<li><a href="records">Records</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Record</h1>
				</div>
			</div>

			<div class="row">
				<div class="col-md-2 col-xs-12">
					<h4 class="box-title">
						<a href="#addRecordModal" role="button" class="btn btn-lg btn-success" data-toggle="modal" style="box-shadow: 0px 4px 8px #888888">
							ADD RECORD
						</a>
					</h4>
				</div>
			</div>

			<div id="successNotificationDiv" class="alert alert-success alert-dismissable" style="display: none">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				<p id="successNotificationMessage"></p>
			</div>

			<div id="addRecordModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title">Record Form</h4>
						</div>
						<div class="modal-body">
							<div class="row" style="margin-bottom: 5px">
								<div class="col-md-12 col-xs-12">
									<div id="successAddModalNotificationDiv" class="alert alert-warning alert-dismissable" style="display: none">
										<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
										<p id="successAddModalNotificationMessage"></p>
									</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 5px">
								<div class="col-md-4 col-xs-12">
									<label>Branch</label>
									<select class="form-control input-sm" id="addBranch" name="addBranch">
										<c:forEach items="${branches}" var="branch">
											<option value="${branch.name}">${branch.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Bank</label>
									<select class="form-control input-sm" id="addBank" name="addBank">
										<c:forEach items="${banks}" var="bank">
											<option value="${bank.name}">${bank.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Date</label>
									<input type="date" class="form-control input-sm" id="addDate" name="addDate" min="2000-01-01" max="2100-01-01">
								</div>
							</div>
							<div class="row" style="margin-bottom: 5px">
								<div class="col-md-4 col-xs-12">
									<label>Consignment</label>
									<input type="number" class="form-control input-sm" id="addConsignment" name="addConsignment" min="0">
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Overdue</label>
									<input type="number" class="form-control input-sm" id="addOverdue" name="addOverdue" min="0">
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Advanced</label>
									<input type="number" class="form-control input-sm" id="addAdvanced" name="addAdvanced" min="0">
								</div>
							</div>
							<div class="row" style="margin-bottom: 5px">
								<div class="col-md-4 col-xs-12">
									<label>Open Consignment</label>
									<input type="number" class="form-control input-sm" id="addOpenConsignment" name="addOpenConsignment" min="0">
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Due Consignment</label>
									<input type="number" class="form-control input-sm" id="addDueConsignment" name="addDueConsignment" min="0">
								</div>
								<div class="col-md-4 col-xs-12">
									<label>New Consignment</label>
									<input type="number" class="form-control input-sm" id="addNewConsignment" name="addNewConsignment" min="0">
								</div>
							</div>
							<div class="row" style="margin-bottom: 5px">
								<div class="col-md-4 col-xs-12">
									<label>Sales</label>
									<input type="number" class="form-control input-sm" id="addSales" name="addSales" min="0" step="0.01">
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Expense</label>
									<input type="number" class="form-control input-sm" id="addExpense" name="addExpense" min="0" step="0.01">
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Deposit</label>
									<input type="number" class="form-control input-sm" id="addDeposit" name="addDeposit" min="0" step="0.01">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-lg btn-block btn-success" id="btnAddRecord" onclick="saveNewRecord()">Save</button>
							<button type="button" class="btn btn-lg btn-block btn-danger" data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</div>
			</div>

			<div id="updateRecordModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title">Record Form</h4>
						</div>
						<div class="modal-body">
							<div class="row" style="margin-bottom: 5px">
								<div class="col-md-12 col-xs-12">
									<div id="successUpdateModalNotificationDiv" class="alert alert-warning alert-dismissable" style="display: none">
										<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
										<p id="successUpdateModalNotificationMessage"></p>
									</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 5px">
								<input type="hidden" class="form-control input-sm" id="updateId" name="updateId">
								<div class="col-md-4 col-xs-12">
									<label>Branch</label>
									<select class="form-control input-sm" id="updateBranch" name="updateBranch">
										<c:forEach items="${branches}" var="branch">
											<option value="${branch.name}">${branch.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Bank</label>
									<select class="form-control input-sm" id="updateBank" name="updateBank">
										<c:forEach items="${banks}" var="bank">
											<option value="${bank.name}">${bank.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Date</label>
									<input type="date" class="form-control input-sm" id="updateDate" name="updateDate" min="2000-01-01" max="2100-01-01">
								</div>
							</div>
							<div class="row" style="margin-bottom: 5px">
								<div class="col-md-4 col-xs-12">
									<label>Consignment</label>
									<input type="number" class="form-control input-sm" id="updateConsignment" name="updateConsignment" min="0">
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Overdue</label>
									<input type="number" class="form-control input-sm" id="updateOverdue" name="updateOverdue" min="0">
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Advanced</label>
									<input type="number" class="form-control input-sm" id="updateAdvanced" name="updateAdvanced" min="0">
								</div>
							</div>
							<div class="row" style="margin-bottom: 5px">
								<div class="col-md-4 col-xs-12">
									<label>Open Consignment</label>
									<input type="number" class="form-control input-sm" id="updateOpenConsignment" name="updateOpenConsignment" min="0">
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Due Consignment</label>
									<input type="number" class="form-control input-sm" id="updateDueConsignment" name="updateDueConsignment" min="0">
								</div>
								<div class="col-md-4 col-xs-12">
									<label>New Consignment</label>
									<input type="number" class="form-control input-sm" id="updateNewConsignment" name="updateNewConsignment" min="0">
								</div>
							</div>
							<div class="row" style="margin-bottom: 5px">
								<div class="col-md-4 col-xs-12">
									<label>Sales</label>
									<input type="number" class="form-control input-sm" id="updateSales" name="updateSales" min="0" step="0.01">
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Expense</label>
									<input type="number" class="form-control input-sm" id="updateExpense" name="updateExpense" min="0" step="0.01">
								</div>
								<div class="col-md-4 col-xs-12">
									<label>Deposit</label>
									<input type="number" class="form-control input-sm" id="updateDeposit" name="updateDeposit" min="0" step="0.01">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-lg btn-block btn-success" id="btnUpdateRecord" onclick="updateRecord()">Update</button>
							<button type="button" class="btn btn-lg btn-block btn-danger" data-dismiss="modal">Cancel</button>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Records</div>
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover" id="dataTables-records">
									<thead>
										<tr>
											<th>ID</th>
											<th>Branch</th>
											<th>Bank</th>
											<th>Date</th>
											<th>Con</th>
											<th>OD</th>
											<th>Adv</th>
											<th>Open</th>
											<th>Due</th>
											<th>New</th>
											<th>Sales</th>
											<th>Exp</th>
											<th>Deposit</th>
											<th>Update</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${records}" var="record">
											<tr id="recordId_${record.id}">
												<td id="recordRowId_${record.id}"><c:out value="${record.id}" /></td>
												<td id="recordRowBranch_${record.id}"><c:out value="${record.branch}" /></td>
												<td id="recordRowBank_${record.id}"><c:out value="${record.bank}" /></td>
												<td id="recordRowDate_${record.id}"><c:out value="${record.date}" /></td>
												<td id="recordRowConsignment_${record.id}"><c:out value="${record.consignment}" /></td>
												<td id="recordRowOverdue_${record.id}"><c:out value="${record.overdue}" /></td>
												<td id="recordRowAdvanced_${record.id}"><c:out value="${record.advanced}" /></td>
												<td id="recordRowOpenConsignment_${record.id}"><c:out value="${record.openConsignment}" /></td>
												<td id="recordRowDueConsignment_${record.id}"><c:out value="${record.dueConsignment}" /></td>
												<td id="recordRowNewConsignment_${record.id}"><c:out value="${record.newConsignment}" /></td>
												<td id="recordRowSales_${record.id}"><c:out value="${record.sales}" /></td>
												<td id="recordRowExpense_${record.id}"><c:out value="${record.expense}" /></td>
												<td id="recordRowDeposit_${record.id}"><c:out value="${record.deposit}" /></td>
												<td style="width: 100px;"><input type="button" value="Update" class="btn btn-xs btn-block btn-flat" data-toggle="modal" data-target="#updateRecordModal" data-id="${record.id}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
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
				responsive : true,
		        "order": [[ 0, "desc" ]]
			});
		});

		$('#addRecordModal').on('show.bs.modal', function(e) {
			$("#addBranch").val($("#addBranch option:first").val());
			$("#addBank").val($("#addBank option:first").val());
			$('#addDate').attr('value', getDateToday());
			$('#addConsignment').val("0");
			$('#addOverdue').val("0");
			$('#addAdvanced').val("0");
			$('#addOpenConsignment').val("0");
			$('#addDueConsignment').val("0");
			$('#addNewConsignment').val("0");
			$('#addSales').val("0");
			$('#addExpense').val("0");
			$('#addDeposit').val("0");
			$('#successAddModalNotificationDiv').css('display', 'none');
			$('#successAddModalNotificationMessage').text("");
		});

		function getDateToday() {
			var now = new Date();
			var day = ("0" + now.getDate()).slice(-2);
			var month = ("0" + (now.getMonth() + 1)).slice(-2);
			var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
			return today;
		}

		function saveNewRecord() {
			var result = insertNewRecord();
			var branch = $("#addBranch").val();
			var date = $("#addDate").val();
			if (result == "success") {
				$('#addRecordModal').modal('toggle');
				$('#successNotificationDiv').css('display', 'block');
				$('#successNotificationMessage').text("Successfully added new record");
				addNewRecordToTable(branch, date);
			} else {
				$('#successAddModalNotificationDiv').css('display', 'block');
				$('#successAddModalNotificationMessage').text(result);
			}
		}

		function insertNewRecord() {
			var validationResult = "";
			var branch = $("#addBranch").val();
			var bank = $("#addBank").val();
			var date = $("#addDate").val();
			var consignment = $("#addConsignment").val();
			var overdue = $("#addOverdue").val();
			var advanced = $("#addAdvanced").val();
			var openConsignment = $("#addOpenConsignment").val();
			var dueConsignment = $("#addDueConsignment").val();
			var newConsignment = $("#addNewConsignment").val();
			var sales = $("#addSales").val();
			var expense = $("#addExpense").val();
			var deposit = $("#addDeposit").val();
			$.ajax({
				type : 'POST',
				url : 'addNewRecord',
				data : {
					'branch' : branch,
					'bank' : bank,
					'date' : date, 
					'consignment' : consignment,
					'overdue' : overdue,
					'advanced' : advanced, 
					'openConsignment' : openConsignment,
					'dueConsignment' : dueConsignment,
					'newConsignment' : newConsignment, 
					'sales' : sales,
					'expense' : expense,
					'deposit' : deposit 
				},
				async : false,
				success : function(result) {
					validationResult = result;
				},
				error : function(jqXHR, textStatus, errorThrown) {
					validationResult = jqXHR.status + ' ' + jqXHR.responseText;
				}
			});

			return validationResult;
		}

		function addNewRecordToTable(branch, date) {
			var branch = $("#addBranch").val();
			var date = $("#addDate").val();
			$.ajax({
				type : 'POST',
				url : 'getRecordByBranchAndDate',
				data : {
					'branch' : branch, 
					'date' : date
				},
				dataType : 'json',
				async : true,
				success : function(result) {
					var row = '<tr id="recordId_' + result.id + '">';
					row += '<td id="recordRowId_' + result.id + '">' + result.id + '</td>';
					row += '<td id="recordRowBranch_' + result.id + '">' + result.branch + '</td>';
					row += '<td id="recordRowBank_' + result.id + '">' + result.bank + '</td>';
					row += '<td id="recordRowDate_' + result.id + '">' + result.date + '</td>';
					row += '<td id="recordRowConsignment_' + result.id + '">' + result.consignment + '</td>';
					row += '<td id="recordRowOverdue_' + result.id + '">' + result.overdue + '</td>';
					row += '<td id="recordRowAdvanced_' + result.id + '">' + result.advanced + '</td>';
					row += '<td id="recordRowOpenConsignment_' + result.id + '">' + result.openConsignment + '</td>';
					row += '<td id="recordRowDueConsignment_' + result.id + '">' + result.dueConsignment + '</td>';
					row += '<td id="recordRowNewConsignment_' + result.id + '">' + result.newConsignment + '</td>';
					row += '<td id="recordRowSales_' + result.id + '">' + result.sales + '</td>';
					row += '<td id="recordRowExpense_' + result.id + '">' + result.expense + '</td>';
					row += '<td id="recordRowDeposit_' + result.id + '">' + result.deposit + '</td>';
					row += '<td style="width: 100px;"><input type="button" value="Update" class="btn btn-xs btn-block btn-flat" data-toggle="modal" data-target="#updateRecordModal" data-id="' + result.id + '" /></td>';
					row += '</tr>';
 					$('#dataTables-records tr:first').after(row);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.status + ' ' + jqXHR.responseText);
					alert(errorThrown);
				}
			});
		}

		$('#updateRecordModal').on('show.bs.modal', function(e) {
			var id = $(e.relatedTarget).data('id');
			$('#updateId').attr("value", $('#recordRowId_' + id).text());
			$("[name=updateBranch]").val($('#recordRowBranch_' + id).text());
			$("[name=updateBank]").val($('#recordRowBank_' + id).text());
			$("#updateDate").attr('value', $('#recordRowDate_' + id).text());
			$("#updateConsignment").attr("value", $('#recordRowConsignment_' + id).text());
			$("#updateOverdue").attr("value", $('#recordRowOverdue_' + id).text());
			$("#updateAdvanced").attr("value", $('#recordRowAdvanced_' + id).text());
			$("#updateOpenConsignment").attr("value", $('#recordRowOpenConsignment_' + id).text());
			$("#updateDueConsignment").attr("value", $('#recordRowDueConsignment_' + id).text());
			$("#updateNewConsignment").attr("value", $('#recordRowNewConsignment_' + id).text());
			$("#updateSales").attr("value", $('#recordRowSales_' + id).text());
			$("#updateExpense").attr("value", $('#recordRowExpense_' + id).text());
			$("#updateDeposit").attr("value", $('#recordRowDeposit_' + id).text());
			$('#successUpdateModalNotificationDiv').css('display','none');
			$('#successUpdateModalNotificationMessage').text("");
		});

		function updateRecord() {
			var result = updateExistingRecord();
			var id = $("#updateId").val();
			var branch = $("#updateBranch").val();
			var bank = $("#updateBank").val();
			var date = $("#updateDate").val();
			var consignment = $("#updateConsignment").val();
			var overdue = $("#updateOverdue").val();
			var advanced = $("#updateAdvanced").val();
			var openConsignment = $("#updateOpenConsignment").val();
			var dueConsignment = $("#updateDueConsignment").val();
			var newConsignment = $("#updateNewConsignment").val();
			var sales = $("#updateSales").val();
			var expense = $("#updateExpense").val();
			var deposit = $("#updateDeposit").val();
			if (result == "success") {
				$('#updateRecordModal').modal('toggle');
				$('#successNotificationDiv').css('display', 'block');
				$('#successNotificationMessage').text("Successfully updated record");
				updateRecordToTable(id, branch, bank, date, consignment, overdue, advanced, openConsignment, dueConsignment, newConsignment, sales, expense, deposit);
			} else {
				$('#successUpdateModalNotificationDiv').css('display', 'block');
				$('#successUpdateModalNotificationMessage').text(result);
			}
		}
		
		function updateExistingRecord() {
			var validationResult = "";
			var id = $("#updateId").val();
			var branch = $("#updateBranch").val();
			var bank = $("#updateBank").val();
			var date = $("#updateDate").val();
			var consignment = $("#updateConsignment").val();
			var overdue = $("#updateOverdue").val();
			var advanced = $("#updateAdvanced").val();
			var openConsignment = $("#updateOpenConsignment").val();
			var dueConsignment = $("#updateDueConsignment").val();
			var newConsignment = $("#updateNewConsignment").val();
			var sales = $("#updateSales").val();
			var expense = $("#updateExpense").val();
			var deposit = $("#updateDeposit").val();
			$.ajax({
				type : 'POST',
				url : 'updateRecord',
				data : {
					'id' : id,
					'branch' : branch,
					'bank' : bank,
					'date' : date, 
					'consignment' : consignment,
					'overdue' : overdue,
					'advanced' : advanced, 
					'openConsignment' : openConsignment,
					'dueConsignment' : dueConsignment,
					'newConsignment' : newConsignment, 
					'sales' : sales,
					'expense' : expense,
					'deposit' : deposit 
				},
				async : false,
				success : function(result) {
					validationResult = result;
				},
				error : function(jqXHR, textStatus, errorThrown) {
					validationResult = jqXHR.status + ' ' + jqXHR.responseText;
				}
			});

			return validationResult;
		}

		function updateRecordToTable(id, branch, bank, date, consignment, overdue, advanced, openConsignment, dueConsignment, newConsignment, sales, expense, deposit) {
			$('#recordRowId_' + id).text(id);
			$('#recordRowBranch_' + id).text(branch);
			$('#recordRowBank_' + id).text(bank);
			$('#recordRowDate_' + id).text(date);
			$('#recordRowConsignment_' + id).text(consignment);
			$('#recordRowOverdue_' + id).text(overdue);
			$('#recordRowAdvanced_' + id).text(advanced);
			$('#recordRowOpenConsignment_' + id).text(openConsignment);
			$('#recordRowDueConsignment_' + id).text(dueConsignment);
			$('#recordRowNewConsignment_' + id).text(newConsignment);
			$('#recordRowSales_' + id).text(sales);
			$('#recordRowExpense_' + id).text(expense);
			$('#recordRowDeposit_' + id).text(deposit);
		}
		
	</script>
</body>

</html>