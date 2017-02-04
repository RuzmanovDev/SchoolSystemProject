﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreatingScheduleControl.ascx.cs" Inherits="SchoolSystem.WebForms.CustomControls.Admin.CreateScheduleControl" %>


<asp:UpdatePanel runat="server" ID="test" UpdateMode="Conditional">
    <ContentTemplate>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ClassOfStudentsDropDown" CssClass="col-md-2 control-label">Клас</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList
                    runat="server"
                    ID="ClassOfStudentsDropDown"
                    DataValueField="Id"
                    DataTextField="Name"
                    OnSelectedIndexChanged="DaysOfWeekDropDown_SelectedIndexChanged"
                    AutoPostBack="true"
                    CssClass="form-control"
                    Width="150">
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DaysOfWeekDropDown" CssClass="col-md-2 control-label">Ден ог седмицата</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList
                    ID="DaysOfWeekDropDown"
                    runat="server"
                    AutoPostBack="true"
                    DataTextField="Name"
                    DataValueField="Id"
                    OnSelectedIndexChanged="DaysOfWeekDropDown_SelectedIndexChanged"
                    CssClass="form-control"
                    Width="250">
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group">

            <asp:ListView
                runat="server"
                ID="ScheduleList"
                ItemType="SchoolSystem.Data.Models.CustomModels.ManagingScheduleModel"
                OnItemCommand="ScheduleList_ItemCommand"
                InsertItemPosition="LastItem"
                DeleteMethod="ScheduleList_DeleteItem"
                InsertMethod="ScheduleList_InsertItem2"
                SelectMethod="ScheduleList_GetData">
                <InsertItemTemplate>
                    <tr>
                        <td>
                            <asp:Button ID="InsertBtn"
                                runat="server"
                                CommandName="Insert"
                                CssClass="btn btn-success"
                                Text="Insert" />
                        </td>
                        <td>
                            <asp:DropDownList ID="AddingSubjectDropDown" runat="server"
                                CssClass="form-control"
                                SelectMethod="PopulateSubjects"
                                SelectedItem='<%# Bind("Id") %>'
                                DataTextField="Name"
                                DataValueField="Id">
                                <asp:ListItem Selected="True">Моля изберете предмет</asp:ListItem>
                            </asp:DropDownList>

                        </td>
                        <td>
                            <asp:DropDownList ID="StartHourDropDown" runat="server"
                                SelectedItem='<%# Bind("StartDate") %>'
                                CssClass="form-control">
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="EndHourDropDown" runat="server"
                                CssClass="form-control">
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:Button ID="UpdateButton"
                                runat="server"
                                CssClass="btn btn-warning"
                                CommandName="Update"
                                Text="Update" />
                            <asp:Button ID="CancelButton"
                                runat="server"
                                CssClass="btn btn-error"
                                CommandName="Cancel"
                                Text="Cancel" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </EditItemTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Button ID="Delete"
                                runat="server"
                                CssClass="btn btn-danger"
                                CommandName="Delete" Text="X" />
                            <asp:HiddenField
                                ID="HiddenFielSubjectId"
                                runat="server"
                                Value='<%#: Item.Subject.Id %>'></asp:HiddenField>
                        </td>
                        <td runat="server" id="subjName"><%#: Item.Subject.Name %></td>
                        <td><%#: Item.StartHour %></td>
                        <td><%#: Item.EndHour %></td>
                    </tr>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server">
                                    <tr runat="server">
                                        <th runat="server"></th>
                                        <th runat="server">Име на предмета</th>
                                        <th runat="server">Начален час</th>
                                        <th runat="server">Краен час</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>

    </ContentTemplate>

</asp:UpdatePanel>
