<%@ Page Title="" Language="C#" MasterPageFile="~/member/MasterPage.master" AutoEventWireup="true" CodeFile="rptPoolGlobalLevelStatus.aspx.cs" Inherits="User_rptPoolMemberStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <!-- Content -->
            <div class="content">
       <div class="alert alert-danger alert-dismissible" id="danger"  runat="server"  visible="false">
              
                <h4><i class="icon fa fa-ban"></i> Alert!</h4>
            <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> 
              </div>
   
    <div class="container-fluid">   
            
           <h5> Global Level Staus </h5>
     <hr />
        <div class="card ">
              <div class="form-horizontal">
                            <div class="card-body">
           
           <div class="form-group row">
                            <label class="col-lg-2 col-md-2 col-xs-6 col-sm-6">Select Level </label>
                            <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6">
                                <asp:DropDownList runat="server" ID="drplevelno"  OnSelectedIndexChanged="drplevelno_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                                    <asp:ListItem Value="0">- All -</asp:ListItem>
                                    <asp:ListItem Value="1">Level-1</asp:ListItem>
                                    <asp:ListItem Value="2">Level-2</asp:ListItem>
                                    <asp:ListItem Value="3">Level-3</asp:ListItem>
                                    <asp:ListItem Value="4">Level-4</asp:ListItem>
                                    <asp:ListItem Value="5">Level-5</asp:ListItem>
                                    <asp:ListItem Value="6">Level-6</asp:ListItem>
                                    <asp:ListItem Value="7">Level-7</asp:ListItem>
                                    <asp:ListItem Value="8">Level-8</asp:ListItem>
                                    <asp:ListItem Value="9">Level-9</asp:ListItem>
                                    <asp:ListItem Value="10">Level-10</asp:ListItem>
                                  
                                </asp:DropDownList>
                                  
                            </div>

                            
                        </div>
<div class="form-group row">
    <div class="col-lg-12" style="overflow:auto; ">
       
      
                  <asp:gridview ID="grdData" runat="server" AutoGenerateColumns="False" CellPadding="10" PageSize="15"  Font-Size="Large" CssClass="table table-bordered table-striped table-hover"

          GridLines="Both" Width="100%" AllowPaging="True"   OnPageIndexChanging="grdData_PageIndexChanging"  >
           
            <columns>
             

<asp:TemplateField HeaderText="#">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
                <ItemStyle Width="10%" />
</asp:TemplateField>
                  <%--<asp:BoundField DataField="Username" HeaderText="UserID" />--%>
        <%--<asp:BoundField DataField="PoolNo" HeaderText="PoolNo" />--%>

        <asp:BoundField DataField="LevelNo" HeaderText="LevelNo" />
        <%--<asp:BoundField DataField="m1" HeaderText="Member-1" />
        <asp:BoundField DataField="m2" HeaderText="Member-2" />--%>
        <asp:BoundField DataField="TragetMember" HeaderText="Target Member" />
        <asp:BoundField DataField="TotalTeam" HeaderText="Recieved Team" />
        <%--<asp:BoundField DataField="TOTAL" HeaderText="Total Amount" />--%>

        <asp:BoundField DataField="Recived" HeaderText="Received Amount" />
                 <asp:TemplateField HeaderText="IsTransfer">
                <ItemTemplate>
                    <%# remark(Eval("IsTransfer")) %>
                </ItemTemplate>
               
</asp:TemplateField>
        <asp:BoundField DataField="EntryNo" HeaderText="ReBirth IdNo" />
            </columns>
          
           
        </asp:gridview>
       </div></div>


                    </div>        </div>
               </div>
    </div>
    </div>
         
</asp:Content>

