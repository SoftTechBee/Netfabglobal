<%@ Page Title="" Language="C#" MasterPageFile="~/Member/MasterPage.master" AutoEventWireup="true" CodeFile="LevelTreeView.aspx.cs" Inherits="Admin_Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
            <!-- Content -->
         
      <!-- jQuery 3 -->
<script src="../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="../../bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="../../bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="../../bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
    <!------Msgbox End---->

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link href="https://ajax.googleapis.com/ajax/static/modules/gviz/1.0/orgchart/orgchart.css" rel="stylesheet" />
     <script type="text/javascript">
    
    function NewWindow(mypage, myname, w, h, scroll) {
        var winl = (screen.width - w) / 2;
        var wint = (screen.height - h) / 2;
        winprops = 'height=' + h + ',width=' + w + ',resizable, top=' + wint + ',left=' + winl + ',scrollbars=' + scroll + ','
        win = window.open(mypage, myname, winprops)
        if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
    }
</script>
    <link href="../Mycss/Tree.css" rel="stylesheet" />
        <section class="content">
        
            <div class="alert alert-danger alert-dismissible" id="danger"  runat="server"  visible="false">
              
                <h4><i class="icon fa fa-ban"></i> Alert!</h4>
            <asp:Label ID="lbdanger" runat="server" Text="There is  some thing wrong........."></asp:Label> 
              </div>
      <div class="row">
        <div class="col-xs-12">
     <div class="box">
            <div class="box-header">
              <h1 class="box-title"> Tree View</h1>
                
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="overflow:auto;">
               - <%-- <div class="input-group input-group-sm" style="margin-bottom:30px;">
           <asp:TextBox ID="txtsearch" CssClass="form-control" runat="server" placeholder="Enter UserName"></asp:TextBox>
               
                    <span class="input-group-btn">
          <asp:Button ID="btnsearch" runat="server" Text="Go!"  OnClick="btnsearch_Click"  CssClass="btn btn-info btn-flat btn-lg"  />
                    
                    </span>
              </div>--%>
              <!------------------------------Tree View Start---------------------------->

                <div lign="Left" style="overflow-x:scroll;"   >
        <table border="0" bordercolor="#A2C0FC" cellpadding="1" cellspacing="0" 
            width="900" height="500" >
            <tbody>
                <tr>
                    <td valign="top" align="center">
                        
                        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
                        
                        <script type="text/javascript">
                            google.load("visualization", "1", { packages: ["orgchart"] });
                            google.setOnLoadCallback(drawChart);
                            function drawChart() {
                                $.ajax({
                                    type: "POST",
                                    url: "LevelTreeView.aspx/FunTreeView",
                                    data: '{}',
                                     contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (r) {
                                        //  alert(r.d);
                                     
                                        var maindata = eval(r.d);
                                      //  alert(maindata[0].UserName);
                                        var data = new google.visualization.DataTable();
                                        data.addColumn('string', 'Entity');
                                        data.addColumn('string', 'ParentEntity');
                                        data.addColumn('string', 'ToolTip');
                                        data.addColumn('string', 'ImageName');
                                        data.addColumn('string', 'UserName');
                                       
                                        if (maindata.length > 0) {
                                            for (var i = 0; i < maindata.length; i++) {
                                                var UserName = maindata[i].UserName;
                                                var memberName = maindata[i].Name;
                                                var parentId = maindata[i].ParentID;
                                                var memberId = maindata[i].MemberID;
                                                var TeamBus = maindata[i].TeamBus;
                                                var Direct = maindata[i].Direct;
                                                var Team = maindata[i].Team;
                                                var JoinAmount = maindata[i].JoinAmount;
                                               
                                                var ImageName = '../SoftImg/R.png';

                                                var status = maindata[i].Status
                                                var RankName = maindata[i].RANKNAME;
                                                var color ='#F01B0A';
                                                if ( status== "Active") {
                                                    color = '#076E25'; 
                                                    var ImageName = '../SoftImg/G.png';
                                                }
                                                data.addRows([[{
                                                    v: memberId,
                                                    f: '<div  style="background: #184068; width: 110px;" ><a href="LevelTreeView.aspx?upline=' + UserName + '"><img src ="' + ImageName + '" alt="' + UserName + '" height="40" width="40" /></a><br/><span style="font-size: 12px;">{ Id: ' + UserName + '<span/>} {<span style="font-size: 12px;">Name: ' + memberName + '<span/>} {<span style="font-size: 12px;">SelfBuss: ' + JoinAmount + '<span/>}</div>'
                                                    
                                                }, parentId, memberName, ImageName, UserName]]);


                                            }
                                        }
                                         var chart = new google.visualization.OrgChart($("#chart")[0]);
                                        chart.draw(data, { allowHtml: true,size:'large' });
                                    },
                                    failure: function (r) {
                                      alert(r.d);
                                    },
                                    error: function (r) {
                                          // alert('hi');
                                        alert(r.d);
                                    }
                                });
                            }
                        </script>
                        
                        <div id="chart" >
                        </div>
                    
                    </td>
                </tr>
            </tbody>
        </table>
         </div>
                <!-------------------------END --------------->
            
               
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->

    

<!-- page script -->
      
</asp:Content>


