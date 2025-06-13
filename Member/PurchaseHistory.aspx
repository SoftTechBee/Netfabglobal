<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="PurchaseHistory.aspx.cs" Inherits="User_purchasehistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
  
                      <div class="alert alert-danger alert-dismissible" id="danger"  runat="server"  visible="false">
              
                <h4><i class="icon fa fa-ban"></i> Alert!</h4>
            <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> 
              </div>

      <div class="row">
        <div class="col-lg-12">
     <div class="card">
            <div class="card-header">
              <h5 class="card-title">Investment  History</h5>
                <asp:Label ID="lbname" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <div style="overflow:auto; color:#000000;" >
<asp:gridview ID="grdData" runat="server" AutoGenerateColumns="False" CellPadding="10" PageSize="10"  Font-Size="Large" CssClass="table table-bordered table-striped table-hover"

          GridLines="Both" Width="100%" AllowPaging="True"   OnPageIndexChanging="grdData_PageIndexChanging"  >
           
            <columns>
             

<asp:TemplateField HeaderText="#">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
                <ItemStyle Width="10%" />
</asp:TemplateField>
                              <asp:boundfield DataField="Packtype" HeaderText="Package_Name"></asp:boundfield>

                <asp:boundfield DataField="Amount" HeaderText="Amount"></asp:boundfield>
               
                <asp:boundfield DataField="DOR" DataFormatString="{0:d}" HeaderText="DOR"></asp:boundfield>
                 <asp:boundfield DataField="PV" HeaderText="PV"></asp:boundfield>
                 <asp:boundfield DataField="BV" HeaderText="BV"></asp:boundfield>
                 <asp:boundfield DataField="Matching" HeaderText="Matching"></asp:boundfield>
                 <asp:boundfield DataField="Capping" HeaderText="Capping"></asp:boundfield>
              <%--  <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <%# remark(Eval("islive")) %>
                </ItemTemplate>
                <ItemStyle Width="10%" />
</asp:TemplateField>--%>
               
            </columns>
          
           
        </asp:gridview>
           
             </div>   
            
               
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      </div>
      </div>
      <!-- /.row -->
  

    

<!-- page script -->
      
</asp:Content>



