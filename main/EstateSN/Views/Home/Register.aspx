<%@ Page Language="C#" MasterPageFile="~/Views/Shared/1col.Master" 
AutoEventWireup="true" CodeBehind="Register.aspx.cs" 
Inherits="EstateSN.Views.Home.Register" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phMain" runat="server">
<form id="Form1" runat="server"></form>

<script type="text/javascript">
	function CheckName()
    {
		var name = document.getElementById("UserName").value;
		CallServer(name, "");
		return false;
	}
	
	function ReceiveServerData(args, context)
	{
		var resField = document.getElementById("resField");
		resField.innerHTML = args;
	}
</script>

<div class="pageheader">
	<h2>Регистрация нового пользователя</h2>
</div>
<form action="/User.mvc/Create" method="post">
	<fieldset>
	<p>
		<label>Имя пользователя</label><br />
		<input id="UserName" type="text" class="text" name="UserName" />
		<button id="bCheck" name="bCheck" type="button" class="button" runat="server" onclick="CheckName()" >Проверить</button><br />
		<span id="resField"></span>
	</p>
	<p>
		<label>Адрес электронной почты</label><br />
		<input id="EMail" type="text" class="text" name="EMail" />
	</p>
	<p>
		<label>Пароль</label><br />
		<input id="Password1" class="text" name="Password1" type="password" />
		
	</p>
	<p>
		<label>Пароль еще раз</label><br />
		<input id="Password2" class="text" name="Password2" type="password" />
	</p>
	
	<button type="submit" class="button positive">
		<img src="../../Content/blueprint/plugins/buttons/icons/tick.png" alt="Зарегистрироваться" />Зарегистрироваться
	</button>
	</fieldset>
</form>
</asp:Content>
