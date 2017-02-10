﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdddingMarksControl.ascx.cs" Inherits="SchoolSystem.WebForms.CustomControls.Teacher.AdddingMarksControl" %>

<h4>Teache area</h4>
<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="SubjectsDropDown" CssClass="col-md-2 control-label">Премет</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList
                    runat="server"
                    ID="SubjectsDropDown"
                    DataValueField="Id"
                    DataTextField="Name"
                    AutoPostBack="true"
                    CssClass="form-control"
                    OnSelectedIndexChanged="SubjectsDropDown_SelectedIndexChanged"
                    Width="150">
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ClassOfStudentsDropDown" CssClass="col-md-2 control-label">Клас</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList
                    ID="ClassOfStudentsDropDown"
                    runat="server"
                    AutoPostBack="true"
                    DataTextField="Name"
                    DataValueField="Id"
                    CssClass="form-control"
                    OnSelectedIndexChanged="ClassOfStudentsDropDown_SelectedIndexChanged"
                    Width="250">
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-10">
                <asp:ListView runat="server" ID="GradesList"
                    ItemType="SchoolSystem.WebForms.CustomControls.Teacher.Model">
                    <LayoutTemplate>
                        <table>
                            <tr>
                                <th>Име на ученика</th>
                                <th>Оценки</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#: Item.Name %></td>
                            <td><%#: string.Join(", ",Item.grades )%></td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
    </ContentTemplate>
</asp:UpdatePanel>
