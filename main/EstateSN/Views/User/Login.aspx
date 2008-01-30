<%@ Page Language="C#" MasterPageFile="~/Views/Shared/1col.Master" AutoEventWireup="true"
	CodeBehind="Login.aspx.cs" Inherits="EstateSN.Views.User.Login" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="phMain" runat="server">
	
<div class="pageheader">
	<h2>Представьтесь, пожалуйста.</h2>
</div>

	<% using (Html.Form("Authenticate", "User")) { %>
	<fieldset>
		
		<p>
		<label for="userName">Логин</label><br />
		<%=Html.TextBox("userName", "", new { Class = "text" })%>
		</p>
		<p>
		<label for="password">Пароль</label><br />
		<%=Html.TextBox("password", "", new { Class = "text", Type = "password" })%>
		</p>
		<p>

		<label for="rememberMe">Запомнить</label>
		<input type="checkbox" id="rememberMe" name="rememberMe" checked="checked" value="checked" />
		
		
		<% if( ViewData["ErrorMessage"] != null ){ %> 
    <div class="error"><% =ViewData["ErrorMessage"] %></div> 
	<% } %>
	<p>
		<button type="submit" class="button positive">
			<img src="../../Content/blueprint/plugins/buttons/icons/tick.png" alt="Войти" />Войти
		</button>
		<% =Html.Hidden( "returnUrl", "/" ) %>
	</p>
		
		</p>
	</fieldset>
	<% } %>
</asp:Content>
