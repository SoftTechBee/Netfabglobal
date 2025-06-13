<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="rptPoolGlobalStatus.aspx.cs" Inherits="User_rptPoolMemberStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <!-- Content -->
            <div class="content">
       <div class="alert alert-danger alert-dismissible" id="danger"  runat="server"  visible="false">
              
                <h4><i class="icon fa fa-ban"></i> Alert!</h4>
            <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> 
              </div>
   
    <div class="container-fluid">   
            
             <h5> Global Box Staus </h5>
     <hr />
        <div class="card ">
              <div class="form-horizontal">
                            <div class="card-body">
                                      <div class=" form-group row">
                   <div class="col-lg-3 col-md-3 col-xs-6 ">

                     <asp:TextBox ID="txtsearch" CssClass="form-control" runat="server" placeholder="Enter UserName"></asp:TextBox>
          
                </div>
  
                 <div class="col-md-2 col-xs-6 col-lg-3">
      
            <asp:Button ID="btnSeach" runat="server" Text="Search" Height="40px" Width="150px" CssClass="btn btn-block btn-success"   OnClick="btnSeach_Click"/>

      </div>
</div>
        
         <div class="form-group row">
                            <label class="col-lg-2 col-md-2 col-xs-6 col-sm-6">Select Boxes </label>
                            <div class="col-lg-3 col-md-3 col-xs-6 col-sm-6">
                                <asp:DropDownList runat="server" ID="drpbox"  OnSelectedIndexChanged="drpbox_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                                    <asp:ListItem Value="0">- All -</asp:ListItem>
                                    <asp:ListItem Value="1">BOX-1</asp:ListItem>
                                    <asp:ListItem Value="2">BOX-2</asp:ListItem>
                                    <asp:ListItem Value="3">BOX-3</asp:ListItem>
                                    <asp:ListItem Value="4">BOX-4</asp:ListItem>
                                    <asp:ListItem Value="5">BOX-5</asp:ListItem>
                                    <asp:ListItem Value="6">BOX-6</asp:ListItem>
                                    <asp:ListItem Value="7">BOX-7</asp:ListItem>
                                    <asp:ListItem Value="8">BOX-8</asp:ListItem>
                                    <asp:ListItem Value="9">BOX-9</asp:ListItem>
                                    <asp:ListItem Value="10">BOX-10</asp:ListItem>
                                  
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
                  <asp:BoundField DataField="Username" HeaderText="UserID" />
        <asp:BoundField DataField="PoolNo" HeaderText="BoxNo" />

        <asp:BoundField DataField="LevelNo" HeaderText="LevelNo" />
        <%--<asp:BoundField DataField="m1" HeaderText="Member-1" />
        <asp:BoundField DataField="m2" HeaderText="Member-2" />--%>
        <asp:BoundField DataField="TragetMember" HeaderText="Target Member" />
        <asp:BoundField DataField="TotalTeam" HeaderText="Recieved Team" />
        <asp:BoundField DataField="TOTAL" HeaderText="Total Amount" />

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

