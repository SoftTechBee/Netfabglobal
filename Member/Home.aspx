<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Member_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <script type="text/javascript">

         function myFunction() {

             var copyText = document.getElementById('ContentPlaceHolder1_myInput');

             copyText.select();
             copyText.setSelectionRange(0, 99999); /*For mobile devices*/
             /* Copy the text inside the text field */
             document.execCommand("copy");
             /* Alert the copied text */

             alert("Copied the referral link: " + copyText.value);

         }
        function myFunctionRight() {

            var copyText = document.getElementById('ContentPlaceHolder1_myInputRight');

             copyText.select();
             copyText.setSelectionRange(0, 99999); /*For mobile devices*/
             /* Copy the text inside the text field */
             document.execCommand("copy");
             /* Alert the copied text */

             alert("Copied the referral link: " + copyText.value);

         }
       


    </script>
    <!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3">Dashboard</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Home</li>
							</ol>
						</nav>
					</div>
					
				</div>
				<!--end breadcrumb-->
     
    
        <div class="row">
          <div class="col-xxl-12 d-flex align-items-stretch">
            <div class="card w-100 overflow-hidden rounded-4">
              <div class="card-body position-relative p-4">
                <div class="row">
                  <div class="col-12 col-sm-7">
                    <div class="d-flex align-items-center gap-3 mb-5">
                      <img src='<%=SessionData.Get<string>("profilepic")%>' class="rounded-circle bg-grd-info p-1"  width="60" height="60" alt="user">
                      <div class="">
                        <p class="mb-0 fw-semibold"><%=SessionData.Get<string>("newuser")%></p>
                        <h4 class="fw-semibold mb-0 fs-4 mb-0"><%=SessionData.Get<string>("name")%></h4>
                      </div>
                    </div>
                    <div class=" align-items-center gap-5">
                      <div class="">
                        <h6 class="mb-3 fw-semibold align-content-center">Left: <asp:Label ID="lbreffsidLeft"  CssClass="text-success"  runat="server" Text="0"></asp:Label>
                        </h6>
                          <span class="badge mb-3 bg-grd-primary" onclick="script: myFunction();">Copy</span>
                        <h6 class="mb-3 fw-semibold align-content-center">Right: <asp:Label ID="lbreffsidRight"  CssClass="text-success"  runat="server" Text="0"></asp:Label>
                        </h6>
                          <span class="badge mb-3 bg-grd-primary" onclick="script: myFunctionRight();">Copy</span>
                        <div class="progress mb-0" style="height:5px;">
                          <div class="progress-bar bg-grd-success" role="progressbar" style="width: 100%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                      </div>
                      
                    </div>
                  </div>
                  <div class="col-12 col-sm-5">
                    <div class="welcome-back-img pt-4">
                       <img src="../assets/images/gallery/logo.png" width="250" alt="">
                    </div>
                  </div>
                </div><!--end row-->
              </div>
            </div>
          </div>
               <marquee onMouseOver="this.stop()" onMouseOut="this.start()">
                                        <h6 > 
                                       <span style="color:#fff" >Update News :-
                                       <asp:Label ID="lbhead" Font-Bold="true" Font-Size="Larger" Font-Underline="true" runat="server" Text='<%#Eval("tittle")%>' ></asp:Label>
                                           : <asp:Label ID="lbnews"  Font-Bold="true" Font-Size="Larger"  runat="server" CssClass="text-white" Text='<%#Eval("news")%>'>
                                             </asp:Label></span></h6>

                                    </marquee>
                        <div class="col-xl-6 col-xxl-4 d-flex align-items-stretch">
            <div class="card w-100 rounded-4">
              <div class="card-body">
                <div class="d-flex align-items-start justify-content-between mb-3">
                  <div class="">
                    <h6 class="mb-0 fw-bold">Income Summary</h6>
                  </div>
                  <div class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle" data-bs-toggle="dropdown">
                      <span class="material-icons-outlined fs-5">more_vert</span>
                    </a>
                   
                  </div>
                 </div>

                  <ul class="list-group list-group-flush">
                    <li class="list-group-item px-0 bg-transparent"> 
                         <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Global Level Income</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="lblGlobalLevel" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
      <p class="mb-0 fw-bold text-success"><a href="rptGlobalLevelIncome.aspx" class="btn-sm">View</a></p>
    </div>
  </div>
</li>

<li class="list-group-item px-0 bg-transparent"> 
  <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Direct Refer Income</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="lblDirectRefer" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
      <p class="mb-0 fw-bold text-success"><a href="rptDirectReferIncome.aspx" class="btn-sm">View</a></p>
    </div>
  </div>
</li>

<li class="list-group-item px-0 bg-transparent"> 
  <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Extra Direct Refer Income</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="lblExtraDirect" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
      <p class="mb-0 fw-bold text-success"><a href="rptExtraDirectReferIncome.aspx" class="btn-sm">View</a></p>
    </div>
  </div>
</li>

<li class="list-group-item px-0 bg-transparent"> 
  <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Extra Direct Refer Team Income</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="lblExtraTeam" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
      <p class="mb-0 fw-bold text-success"><a href="rptExtraDirectReferTeamIncome.aspx" class="btn-sm">View</a></p>
    </div>
  </div>
</li>

<li class="list-group-item px-0 bg-transparent"> 
  <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Global Box Income</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="lblGlobalBox" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
      <p class="mb-0 fw-bold text-success"><a href="rptGlobalBoxIncome.aspx" class="btn-sm">View</a></p>
    </div>
  </div>
</li>

         </ul>

              </div>
            </div>
          </div>
             <div class="col-xl-6 col-xxl-4 d-flex align-items-stretch">
            <div class="card w-100 rounded-4">
              <div class="card-body">
                <div class="d-flex align-items-start justify-content-between mb-3">
                  <div class="">
                    <h6 class="mb-0 fw-bold">Income Summary</h6>
                  </div>
                  <div class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle" data-bs-toggle="dropdown">
                      <span class="material-icons-outlined fs-5">more_vert</span>
                    </a>
                   
                  </div>
                 </div>

                  <ul class="list-group list-group-flush">
                   
 
<li class="list-group-item px-0 bg-transparent"> 
  <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Royalty Income</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="lblRoyalty" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
      <p class="mb-0 fw-bold text-success"><a href="rptRoyaltyIncome.aspx" class="btn-sm">View</a></p>
    </div>
  </div>
</li>

<li class="list-group-item px-0 bg-transparent"> 
  <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Salary Income</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="lblSalary" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
      <p class="mb-0 fw-bold text-success"><a href="rptSalaryIncome.aspx" class="btn-sm">View</a></p>
    </div>
  </div>
</li>

<li class="list-group-item px-0 bg-transparent"> 
  <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Matching Binary Income</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="lblMatchingBinary" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
      <p class="mb-0 fw-bold text-success"><a href="rptMatchingBinaryIncome.aspx" class="btn-sm">View</a></p>
    </div>
  </div>
</li>

<li class="list-group-item px-0 bg-transparent"> 
  <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Sponsor Binary Matching Income</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="lblSponsorBinary" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
      <p class="mb-0 fw-bold text-success"><a href="rptSponsorBinaryMatchingIncome.aspx" class="btn-sm">View</a></p>
    </div>
  </div>
</li>

<li class="list-group-item px-0 bg-transparent"> 
  <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Re-Purchase Income</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="lblRepurchase" runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
      <p class="mb-0 fw-bold text-success"><a href="rptRePurchaseIncome.aspx" class="btn-sm">View</a></p>
    </div>
  </div>
</li>

                     
                  </ul>

              </div>
            </div>
          </div>
            
           
              <div class="col-xl-6 col-xxl-4 d-flex align-items-stretch">
            <div class="card w-100 rounded-4">
              <div class="card-body">
                <div class="d-flex align-items-start justify-content-between mb-3">
                  <div class="">
                    <h6 class="mb-0 fw-bold">Team Left/Right</h6>
                  </div>
                  <div class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle" data-bs-toggle="dropdown">
                      <span class="material-icons-outlined fs-5">more_vert</span>
                    </a>
                   
                  </div>
                 </div>

                  <ul class="list-group list-group-flush">
                      <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-primary">
                         <img src="../assets/images/apps/user.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Total Team</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbLeftTeam" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="lbRightTeam" runat="server" Text="0"></asp:Label></p>
                          </div>
                        </div>
                      </li>
                     <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-warning">
                         <img src="../assets/images/apps/user.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Active Total</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbActiveleftteam" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="lbActiveRightteam" runat="server" Text="0"></asp:Label></p>
                          </div>
                        </div>
                      </li>
                       <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
                           <img src="../assets/images/apps/user.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">InActive Total</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbInActiveLeftteam" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="lbInActiveRightteam" runat="server" Text="0"></asp:Label></p>
                          </div>
                        </div>
                      </li>
                   
                      <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-success">
                           <img src="../assets/images/apps/user.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Total Direct</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbTotalLeftDirect" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="lbTotalRightDirect" runat="server" Text="0"></asp:Label></p>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
                           <img src="../assets/images/apps/user.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Active Direct</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                           <p class="mb-0"><asp:Label ID="lbActiveDirectLeft" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="lbActiveDirectRight" runat="server" Text="0"></asp:Label></p>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-warning">
                          <img src="../assets/images/apps/user.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">InActive Direct</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                             <p class="mb-0"><asp:Label ID="lbinActiveDirectLeft" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="lbinActiveDirectRight" runat="server" Text="0"></asp:Label></p>
                          </div>
                        </div>
                      </li>
                     
                  </ul>

              </div>
            </div>
          </div>
             <div class="col-xl-6 col-xxl-4 d-flex align-items-stretch">
            <div class="card w-100 rounded-4">
              <div class="card-body">
                <div class="d-flex align-items-start justify-content-between mb-3">
                  <div class="">
                    <h6 class="mb-0 fw-bold">Fund Info</h6>
                  </div>
                  <div class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle" data-bs-toggle="dropdown">
                      <span class="material-icons-outlined fs-5">more_vert</span>
                    </a>
                   
                  </div>
                 </div>

                  <ul class="list-group list-group-flush">
                      <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-primary">
                         <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Self Business</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbtotalrepurchase"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-success"> <a href="PurchaseHistory.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-success">
                           <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Total Income</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbTotalIncome1"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-danger"> <a href="account.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
                           <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Total Withdrawal</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbwithdrawapprove"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-success"> <a href="WithdrawRequestlist.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-warning">
                          <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Available Income</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbbalance"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-danger"> <a href="account.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
                 <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
                          <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Deposit Fund</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbdeposit"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-danger"> <a href="Wallet.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
                  <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-success">
                          <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Available Fund</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbAvailabledeposit"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-danger"> <a href="Wallet.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
                  <li class="list-group-item px-0 bg-transparent">
                        <div class="d-flex align-items-center gap-3">
                          <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-success">
                          <img src="../assets/images/apps/dollar.png" width="32" alt="">
                          </div>
                          <div class="flex-grow-1">
                            <h6 class="mb-0">Income to Fund</h6>
                          </div>
                          <div class="d-flex align-items-center gap-3">
                            <p class="mb-0"><asp:Label ID="lbincometofund"  runat="server" Text="0"></asp:Label> <%=SessionData.Get<string>("Currency")%></p>
                            <p class="mb-0 fw-bold text-danger"> <a href="Incometofundreport.aspx" class="btn-sm ">View</a></p>
                          </div>
                        </div>
                      </li>
                     
                            
                  </ul>

              </div>
            </div>
          </div>
           
            <div class="col-xl-6 col-xxl-4 d-flex align-items-stretch">
            <div class="card w-100 rounded-4">
              <div class="card-body">
                <div class="d-flex align-items-start justify-content-between mb-3">
                  <div class="">
                    <h6 class="mb-0 fw-bold">Total PV/BV</h6>
                  </div>
                  <div class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle" data-bs-toggle="dropdown">
                      <span class="material-icons-outlined fs-5">more_vert</span>
                    </a>
                   
                  </div>
                 </div>

                  <ul class="list-group list-group-flush">
                    <li class="list-group-item px-0 bg-transparent"> 
                         <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Left/Right PV</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="leftpv" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="rightpv" runat="server" Text="0"></asp:Label></p>
    </div>
  </div>
</li>

 <li class="list-group-item px-0 bg-transparent"> 
                         <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Left/Right BV</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="leftBV" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="rightBV" runat="server" Text="0"></asp:Label></p>
    </div>
  </div>
</li>



         </ul>

              </div>
            </div>
          </div> 
            <div class="col-xl-6 col-xxl-4 d-flex align-items-stretch">
            <div class="card w-100 rounded-4">
              <div class="card-body">
                <div class="d-flex align-items-start justify-content-between mb-3">
                  <div class="">
                    <h6 class="mb-0 fw-bold">Available PV/BV</h6>
                  </div>
                  <div class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle" data-bs-toggle="dropdown">
                      <span class="material-icons-outlined fs-5">more_vert</span>
                    </a>
                   
                  </div>
                 </div>

                  <ul class="list-group list-group-flush">
                    <li class="list-group-item px-0 bg-transparent"> 
                         <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Left/Right PV</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="Availableleftpv" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="Availablerightpv" runat="server" Text="0"></asp:Label></p>
    </div>
  </div>
</li>

 <li class="list-group-item px-0 bg-transparent"> 
                         <div class="d-flex align-items-center gap-3">
    <div class="wh-42 d-flex align-items-center justify-content-center rounded-3 bg-grd-branding">
      <img src="../assets/images/gallery/favicon.png" width="32" alt="">
    </div>
    <div class="flex-grow-1">
      <h6 class="mb-0">Left/Right BV</h6>
    </div>
    <div class="d-flex align-items-center gap-3">
      <p class="mb-0"><asp:Label ID="AvailableleftBV" runat="server" Text="0"></asp:Label></p>/
      <p class="mb-0"><asp:Label ID="AvailablerightBV" runat="server" Text="0"></asp:Label></p>
    </div>
  </div>
</li>



         </ul>

              </div>
            </div>
          </div> 
             
      <div class="col-xl-6 col-xxl-6 d-flex align-items-stretch">
            <div class="card  w-100 rounded-4">
              <div class="card-body">
                <div class="d-flex align-items-start justify-content-between mb-3">
                  <div class="">
                    <h5 class="mb-0 fw-bold">About</h5>
                  </div>
                  <div class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle"
                      data-bs-toggle="dropdown">
                      <span class="material-icons-outlined fs-5">more_vert</span>
                    </a>
                    
                  </div>
                 </div>
                 <div class="full-info">
                  <div class="info-list d-flex flex-column gap-3">
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">account_circle</span><p class="mb-0">Member ID: <asp:Label ID="lbusername" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">code</span><p class="mb-0">Member Name: <asp:Label ID="lbname" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">send</span><p class="mb-0">Date Of Join: <asp:Label ID="lbDOJ" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">send</span><p class="mb-0">Date Of Active: <asp:Label ID="lbDOA" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">done</span><p class="mb-0">Acount Status: <asp:Label ID="lbstatus" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">code</span><p class="mb-0">Current Package: <asp:Label ID="lbpack" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">call</span><p class="mb-0">Mobile: <asp:Label ID="lbmobile" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>

                    <div class="info-list-item d-flex align-items-center gap-3"><span class="material-icons-outlined">send</span><p class="mb-0">Email: <asp:Label ID="lbemail" CssClass="text-warning" runat="server" Text="N/A"></asp:Label></p></div>
                  </div>
                </div>
              </div>
            </div>
            </div>
            <div class="col-xl-6 col-xxl-6 d-flex align-items-stretch">
            <div class="card w-100 rounded-4">
              <div class="card-body">
                  <div class="d-flex align-items-start justify-content-between">
                    <div class="">
                      <h5 class="mb-0">Business</h5>
                    </div>
                    <div class="dropdown">
                      <a href="javascript:;" class="dropdown-toggle-nocaret options dropdown-toggle"
                        data-bs-toggle="dropdown">
                        <span class="material-icons-outlined fs-5">more_vert</span>
                      </a>
                     
                    </div>
                  </div>
                <div class="d-flex align-items-center gap-3 mt-4">
                     
                  <div class="mb-4">
                    <h1 class="mb-0"><asp:Label runat="server" ID="lbtotalbusiness" Text="0.0"></asp:Label> <%=SessionData.Get<string>("Currency")%></h1>
                  </div>
                  <div class="d-flex align-items-center align-self-end gap-2">
                    <span class="material-icons-outlined text-success">trending_up</span>
                  </div>
                </div>
                <p class="mb-4">Total Business</p>
                <div class="d-flex flex-column gap-3">
                  <div class="mb-4">
                    <p class="mb-1">Left Side <span class="float-end"><asp:Label runat="server" ID="leftbusiness" Text="0.0"></asp:Label></span> Business</p>
                    <div class="progress" style="height: 5px;">
                      <div class="progress-bar bg-grd-primary" style="width: 100%"></div>
                    </div>
                  </div>
                  <div class="">
                    <p class="mb-1">Right Side <span class="float-end"><asp:Label runat="server" ID="rightbusiness" Text="0.0"></asp:Label></span> Business</p>
                    <div class="progress" style="height: 5px;">
                      <div class="progress-bar bg-grd-warning" style="width: 100%"></div>
                    </div>
                  </div>
                 
                </div>
              </div>
            </div>
                </div>
          
     


           
          
        </div>

     <input type="text" name="link" id="myInput" runat="server" value="" style="opacity: 0;">
     <input type="text" name="link" id="myInputRight" runat="server" value="" style="opacity: 0;">


</asp:Content>

