<%@ Page Language="C#" MasterPageFile="~/Views/Shared/2col.master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="EstateSN.Views.User.Index" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="phMain" runat="server">

<script type="text/javascript" src="../../Content/events.js"></script>
<script type="text/javascript" src="../../Content/jquery.selectboxes.pack.js"></script>
<script type="text/javascript">
	$( 	
		function () 
		{
			$("#Countries")[0].className = "long";
			registerEvent($("#Countries")[0], "change", countrychanged);
			var d = $("#Day");
			var i;
			for (i=1;i<32;i++)
			{ d.addOption(i,i); }
			d.selectOptions('0',true);
			var now = new Date();
			var y = $("#Year");
			for (i=now.getYear()-14;i>1900;i--)
			{ y.addOption(i,i); }
			y.selectOptions('0',true);
			countrychanged();
		}
	);
	function countrychanged()
	{
		var r = $("#Regions");
		r.removeOption(/./);
		r.ajaxAddOption(
			"/Region.mvc/GetByCountry", 
			{countryID: $("#Countries")[0].value},
			false,
			function() { r.selectOptions('<%=ViewData.User.Region == null ? "" : ViewData.User.Region.RegionID.ToString() %>',true) }
		);
	}
</script>
					

<div class="page">
	<div class="pageheader">
		<h2>Редактирование профиля <%=ViewData.User.UserName %></h2>
	</div>
	<form action="/User.mvc/Update" method="post">
		<fieldset>
			<table>
				<tr>
					<th><label for="FIO">Настоящее имя</label></th>
					<td><%=Html.TextBox("FIO", ViewData.User.FIO, new { Class = "text" } )%></td>
				</tr>
				
				<tr>
					<th><label for="EMail">Почтовый ящик</label></th>
					<td><%=Html.TextBox("EMail", ViewData.User.EMail, new { Class = "text" })%></td>
				</tr>
				
				<tr>
					<th><label for="Countries">Страна</label></th>
					<td><%= Html.Select("Countries", ViewData.Countries, ViewData.User.Country == null ? 0 : ViewData.User.Country.CountryID)%></td>

				</tr>
				<tr>
					<th><label for="Regions">Регион</label></th>
					<td><select id="Regions" name="Regions" class="long"></select></td>
				</tr>
				
				<tr>
					<th><label for="Day">Дата рождения</label></th>
					<td>
						<select id="Day" name="Day">
							<option value="0">День</option>
						</select>
						<select id="Month" name="Month">
							<option value="0">Месяц</option>
							<option value="1">января</option>
							<option value="2">февраля</option>
							<option value="3">марта</option>
							<option value="4">апреля</option>
							<option value="5">мая</option>
							<option value="6">июня</option>
							<option value="7">июля</option>
							<option value="8">августа</option>
							<option value="9">сентября</option>
							<option value="10">октября</option>
							<option value="11">ноября</option>
							<option value="12">декабря</option>
						</select>
						<select id="Year" name="Year">
							<option value="0">Год</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"><div class="colgroup">Контактная информация</div></td>
				</tr>
				<tr>
					<th><label for="Company">Компания</label></th>
					<td><%=Html.TextBox("Company", "", new { Class = "text" })%></td>
				</tr>
				<tr>
					<th><label for="Post">Должность</label></th>
					<td><%=Html.TextBox("Post", ViewData.User.Post ?? "", new { Class = "text" })%></td>
				</tr>
				<tr>
					<th><label for="WorkPhone">Телефон (раб.)</label></th>
					<td><%=Html.TextBox("WorkPhone", ViewData.User.WorkPhone ?? "", new { Class = "text" })%></td>
				</tr>
				<tr>
					<th><label for="MobilePhone">Телефон (моб.)</label></th>
					<td><%=Html.TextBox("MobilePhone", ViewData.User.MobilePhone ?? "", new { Class = "text" })%></td>
				</tr>
				<tr>
					<th><label for="AddInfo">Доп. информация</label></th>
					<td><%=Html.TextArea("AddInfo", ViewData.User.AddInfo ?? "", new { Class = "text" })%></td>
				</tr>
				
			</table>
			
			
		</fieldset>
		
		
		
		
		<%=Html.SubmitButton("Save", "Сохранить", new { Class = "button positive" })%>
	</form>
</div>
<div class="pagefooter"></div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phSideBar" runat="server">
<div class="sidebar">
Профиль<br />
<%= Html.ActionLink("Редактирование", "Index", "User") %><br />
<%= Html.ActionLink("Личная страница", "Page", "User") %><br />

Блог<br />
<%= Html.ActionLink("Создать запись", "NewPost", "User") %><br />
<%= Html.ActionLink("Изображения", "Images", "User") %>

</div>



</asp:Content>
