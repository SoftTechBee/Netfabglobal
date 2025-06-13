<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="SelfActive.aspx.cs" Inherits="User_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <div class="content-body">
            <!-- Content -->
            <div class="content">
           
                 <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                    <h4 class="mb-0">Activation Block</h4>                                 

                                </div>
                            </div>
                        </div>
                <br />
                        <!-- end page title -->
    <!------Msgbox End---->
     <div class="card-body">
              <div class="alert alert-danger alert-dismissible" id="danger"  runat="server"  visible="false">
              
            <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> 
              </div>
              <div class="alert alert-info alert-dismissible" id="info" runat="server"  visible="false">
              
               <asp:Label ID="lbinfo" runat="server" Text="ere is  some thing wrong........."></asp:Label>  
             
              </div>
              <div class="alert alert-warning alert-dismissible" id="warning" runat="server"  visible="false">
              
               <asp:Label ID="lbwarning" runat="server" Text=" Try Again............"></asp:Label> 
            
              </div>
              <div class="alert alert-success alert-dismissible" id="sccess" runat="server" visible="false" >
              
                  <asp:Label ID="lbsuccess" runat="server" Text="Successfully updated................"></asp:Label>  
              </div>
            </div>
    <!-----Alert End----->


    
      <div class="row">
             
        <div class="col-lg-12">
          <div class="card">
            <%--  <div class="card-header with-border">
                  
              </div>--%>
              <div class="card-body">
                  <div class="form-horizontal">
                         <h5 class="text-warning " style="text-align: right; padding-right: 20px;" runat="server" visible="false" id="lbfund"><a class=" btn  btn-success" href="WalletRecharge.aspx">Add Fund</a></h5>
                       <div class="mb-3 row">
                          <label class="control-label col-sm-4">Available Wallet Balance </label>
                         <div class="col-sm-6">
                      
              <h3>$ <asp:Label ID="txtbalance" runat="server" Text="0"></asp:Label></h3>

             
            </div>
            </div>
         <hr />
                         <div class=" row">
                         <label class="control-label col-sm-2">Member ID </label>
                           <div class="col-sm-4">
                         <asp:TextBox ID="lbActiveMember" runat="server" ReadOnly="true" CssClass=" form-control"  ></asp:TextBox>
                             
                          </div>
                             <label class="control-label col-sm-2">Package Name </label>
                          <div class="col-sm-4">

                         <asp:TextBox ID="txtpackage" runat="server" ReadOnly="true" CssClass=" form-control"  ></asp:TextBox>
                              
                         
                      </div>
                          </div>
         <hr />
                    
                       <div class=" mb-3 row">
                         <label class="control-label col-sm-2">Minimum Amount($) </label>
                           <div class="col-sm-4">
                         <asp:TextBox ID="txtmin" runat="server" ReadOnly="true" Text="0" CssClass=" form-control"  ></asp:TextBox>
                             
                          </div>
                             <label class="control-label col-sm-2">Maximum Amount($) </label>
                          <div class="col-sm-4">

                         <asp:TextBox ID="txtmax" runat="server" ReadOnly="true" Text="0" CssClass=" form-control"  ></asp:TextBox>
                              
                         
                      </div>
                          </div>
               
                <div class="mb-3 row">
                        
                       <label class="control-label col-sm-2">Amount($) </label>
                          <div class="col-sm-10">

                              
                         
                         <asp:TextBox ID="txtAmt" runat="server" placeholder="Enter invest Amount" CssClass=" form-control" ></asp:TextBox>
                      </div>
                      </div>
                
                      
                     
                
                      
                     
                     
          <!-- /.card -->
                    
                      
                
              <div class="card-footer text-center">
                  
                  <center>

   <asp:Button ID="btnaction" runat="server" Text="Invest Now"  OnClientClick="return Validate();" OnClick="butsubmit_Click"  Width="200px"  CssClass="btn bg-success btn-flat btn-lg"/>
               
                      </center>
                 </div>         
              </div>
             

        </div>
        </div>
        </div>
         

  
 <script>
    
     function Processclick() {
         swal({
             title: "Processing.......!",
             text: "Note: Do Not press back or close the app? It will close in few seconds.",
             imageUrl: "../SoftImg/refresh.gif",
             timer: 2000000,
             showConfirmButton: false
         });
     }
     function Successclick() {
         swal("Succesfully", "Packages Purchased successfully!", "success")
     }
     function dangerlick() {
         swal("Oops...!", "Something went wrong! Try Again", "error")
     }
     function Warninglick() {
         swal("Oops...!", "You have already buy this Package ,please buy another packages!", "warning")
     }
     function fundlick() {
         swal("Oops...!", "Balance is less then to require amount,Please Add Fund! Check Minimum And Maxmum Amount", "warning")
     }
     //function PrePackBuy() {
     //    swal("Oops...!", "you can't buy this packages! Please Buy previous packages SequenceWise", "error")
     //}
     //function NotActive() {
     //    swal("Oops...!", "Your Account Is Not-Active ...! Please Active Your Account(Buy JOIN PAKAGE)", "error")
     //}
 </script>
            <script src="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://common.olemiss.edu/_js/sweet-alert/sweet-alert.css">
    

</div>
</div>
</div>
</asp:Content>

