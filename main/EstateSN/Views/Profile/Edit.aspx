<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="EstateSN.Views.Profile.Edit" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <form action="<%=Url.Action(new {Action = "Update", ID = ViewData.UserID}) %>" method="post">
        <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>Имя пользователя:</td>
            <td><%=ViewData.UserName %></td>
        </tr>
        <tr>
            <td>Фамилия, имя, отчество:</td>
            <td><%=Html.TextBox("FIO", ViewData.FIO ?? String.Empty) %></td>
        </tr>
        <tr>
            <td>Страна:</td>
            <td><%=Html.Select("CountryID", (new estatesnModel.estatesnEntities()).C_Country.ToList<estatesnModel.Country>(), "CountryName", "CountryID", ViewData.Country == null ? String.Empty : ViewData.Country.CountryID.ToString())%></td>
        </tr>
        <tr>
            <td>Регион:</td>
            <td></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td></td>
        </tr>
        <tr>
            <td>Аватар:</td>
            <td></td>
        </tr>
        <tr>
            <td>Фото:</td>
            <td></td>
        </tr>
        <tr>
            <td>Дата рождения:</td>
            <td></td>
        </tr>
        <tr>
            <td>Доп. информация:</td>
            <td></td>
        </tr>
        <tr>
            <td>Пригласивший пользователь:</td>
            <td></td>
        </tr>
        <tr>
            <td>Количество приглашённых:</td>
            <td></td>
        </tr>
        <tr>
            <td>Рабочий телефон:</td>
            <td></td>
        </tr>
        <tr>
            <td>Мобильный телефон:</td>
            <td></td>
        </tr>
        <tr>
            <td>Должность:</td>
            <td></td>
        </tr>
        <tr>
            <td colspan=2>
                <input type="submit" value="Сохранить" />
            </td>
        </tr>
        </table>
    </form>
</asp:Content>
