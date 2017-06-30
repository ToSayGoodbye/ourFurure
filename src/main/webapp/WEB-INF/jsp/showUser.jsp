<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>医疗影像系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery.plupload.queue/css/jquery.plupload.queue.css">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	
	<script src="${pageContext.request.contextPath}/js/jquery-2.0.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/ajaxfileupload.js"></script>  

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <style>
    	body{
    		
    	}
    	btn-group{
    		height:27px
    	}
    	td{
    		padding:0px
    	}
    	.list-group-item{
    		background:rgba(109, 85, 85, 0.33);	
    	}
    	a.list-group-item, button.list-group-item{
    		color:rgb(23, 132, 92);
    	}
    	.carousel-indicators .active{
    		background-color: #286090;
    	}
    	.carousel-indicators li{
    		border: 1px solid #333;
    	}
    </style>
</head>
	<%
	String name = (String)session.getAttribute("user");
	if(name==null)response.sendRedirect(request.getServletContext().getContextPath()+"/login.html");
	%>
<body style="color:rgb(23, 132, 92);background-image:url('${pageContext.request.contextPath}/img/body6.jpg')">
   <nav class="navbar navbar-inverse">
       <div class="container-fluid">
           <!-- Brand and toggle get grouped for better mobile display -->
           <div class="navbar-header">
               <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                   <span class="sr-only">Toggle navigation</span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
                   <span class="icon-bar"></span>
               </button>
               <a style="padding:0px;margin:0px" class="navbar-brand" href="#" id="project"><img style="width: 192px; height: 50px;padding:0px;margin:0px" src="${pageContext.request.contextPath}/img/logo.png"></a>
           </div>

           <!-- Collect the nav links, forms, and other content for toggling -->
           <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav" style="display:none">
                   <li><a href="#">Link <span class="sr-only">(current)</span></a></li>
                   <li><a href="#">Link</a></li>
                   <li>
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown </a>

                   </li>
                   <li>
                       <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown </a>

                   </li>
               </ul>
               <form class="navbar-form navbar-right">
                   <div class="form-group">
                   		 <span style="color:#A98E8E">你好,<%=session.getAttribute("user")%>!</span>
                       <input type="text" class="form-control" placeholder="Search">
                   </div>
                   <a href="./login.html" class="btn btn-default">退出</a>
                    <input type="hidden" id="onTimeCount">
               </form>
           </div><!-- /.navbar-collapse -->
       </div><!-- /.container-fluid -->
   </nav>
	<div class="container-fluid" style="">
            <div class="row">
                <div class="col-sm-2" style="">
                    <a href="#" class="list-group-item active" style="background-image:linear-gradient(to bottom,#3A3532 0,#C3D3E0 100%);border-color:#DEDEDE"> 影像管理</a>
                    <a href="#" class="list-group-item" style="height:40px">
                        <span class="glyphicon glyphicon-home"> 内科影像</a>
                    <a href="#" class="list-group-item" style="height:40px">
                        <span class="glyphicon glyphicon-file"> 外科影像</a>
                      <a href="#" class="list-group-item" style="height:40px">
                        <span class="glyphicon glyphicon-th-large"> 中医影像</a>
                      <a href="#" onclick="toShow()" class="list-group-item" style="height:40px">
                        <span class="glyphicon glyphicon-home"> 西医影像</a>
                      <a href="#" class="list-group-item" style="height:40px">
                        <span class="glyphicon glyphicon-th-large"> 神经影像</a>
                      <a href="#" class="list-group-item" style="height:40px">
                        <span class="glyphicon glyphicon-th-large"> 心胸影像</a>
                      <a href="#" class="list-group-item" style="height:40px">
                        <span class="glyphicon glyphicon-th-large"> 泌尿影像</a>
                       <a href="#" class="list-group-item" style="height:40px">
                        <span class="glyphicon glyphicon-user"> 肿瘤影像</a>
                	<img id="showImg" style="width: 195px; height: 200px" src="${pageContext.request.contextPath}/img/5775eac1b352b_1024.jpg">
                </div>
                
                <div id="myAlert" class="alert alert-warning" style="display:none;position:absolute">
				    <a href="#" class="close" data-dismiss="alert">&times;</a>
				    <strong>警告！</strong>您的网络连接有问题。
				</div>
                <div class="col-sm-10">
                    <div class="panel panel-default" style="">
                        <div class="panel-heading" style="color:#000000;background-image:linear-gradient(to bottom,#3A3532 0,#C3D3E0 100%);">
                      		      搜索
                        </div>
                        <div class="panel-body">
                            <form role="form" class="form-inline">
                                <div class="form-group">
                                    <label for="name">名称</label>
                                    <input type="text" class="form-control" id="name" placeholder="请输入名称">
                                </div>
                                <div class="form-group">
                                    <label for="name">状态</label>
                                    <select id="type"  class="form-control">
                                        <option value="">所有</option>
                                        <option value="1">A类</option>
                                        <option value="2">B类</option>
                                        <option value="3">C类</option>
                                        <option value="4">D类</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <a onclick="toQuery()" class="btn btn-default">搜索</a>
                                    <a onclick="toOpen()" class="btn btn-primary">影像上传</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>名称</th>
                                    <th>类别</th>
                                    <th>图片简介</th>
                                    <th>备注</th>
                                    <th>状态</th>
                                    <th>上传时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody id="listBody">

                            </tbody>
                        </table>
                    </div>
                    <div class="span6" style="width:25%;" >
					 <div id="DataTables_Table_0_info" class="dataTables_info">当前第 <span id="page">1</span> 页，共 <span id="total"></span> 项</div>
					 </div>
                    <ul class="pager" style="margin-top:-30px;padding-left:-50px">
						<li>
							<a href="#" onclick="preView()">上一页</a>
						</li>
						<li>
							<a href="#" onclick="nextView()">下一页</a>
						</li>
					</ul>
                </div>
            </div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content" style="width:810px;padding:0px";height:371px>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						上传图片
					</h4>
				</div>
				<div class="modal-body" style="padding:15px;height:470px">
						<form id="photoForm" role="form"  class="form-horizontal" action="./addPhoto.do">
						  <div class="form-group">
						    <label for="picture_name" class="col-sm-2 control-label">图片名称：</label>
						     <div class="col-sm-10">
						    	<input type="text" class="form-control" id="picture_name" placeholder="请输入图片名称">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="picture_type" class="col-sm-2 control-label">图片分类：</label>
						    <div class= "col-sm-10">
	                              <select id="picture_type" class= "form-control selectpicker">
	                                   <option value="1">A类</option >
	                                   <option  value="2">B类</option >
	                                   <option  value="3">C类</option >
	                                   <option  value="4">D类</option >
	                              </select>
	                         </div>
						  </div>
						  <div class="form-group">
						  	  <label for="upload" class="col-sm-2 control-label">选择图片：</label>
						  	  <div class="col-sm-10">
								  <img id="upload" alt="" style="width: 200px; height: 200px" src="${pageContext.request.contextPath}/img/select.png">  
							   </div>
								<!-- 隐藏file标签 -->  
								<input id="fileToUpload" onchange="changeEvent()" style="display: none" type="file" name="upfile"><br/>  
						  </div>
						  <div class="form-group">
						    <label for="picture_information" class="col-sm-2 control-label">图片描述：</label>
						    <div class="col-sm-10">
							    <textarea id="picture_information" name="picture_information" class="form-control" rows="3" placeholder="请输入图片描述"></textarea>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="comment" class="col-sm-2 control-label">备注：</label>
						     <div class="col-sm-10">
						    	<input type="text" class="form-control" id="comment" placeholder="请输入备注">
						    </div>
						  </div>
						</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-default" onclick="addPhoto()">提交</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content" style="width:700px;padding:0px";height:512px>
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 id="imgName" class="modal-title" id="myModalLabel">
						
					</h4>
				</div>
				<div class="modal-body" style="padding:15px;height:512px">
					  <img id="viewImg" style="width: 400px; height: 400px;margin-top:40px;margin-left:120px">  
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		<div class="modal-dialog" style="margin:0;padding:0">
			<div id="toShowBody" class="modal-content" style="margin:12px 50px 30px 30px";>
				<div class="modal-header" style="background-color:">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
				</div>
				<div class="modal-body" style="padding:0px;">
					  <div id="myCarousel" class="carousel slide">
					    <!-- 轮播（Carousel）指标 -->
					    <ol class="carousel-indicators">
					    </ol>   
					    <!-- 轮播（Carousel）项目 -->
					    <div class="carousel-inner" style="heigth:800px">
					    </div>
					    <!-- 轮播（Carousel）导航 -->
					    <a class="carousel-control left" href="#myCarousel" 
					        data-slide="prev">&lsaquo;
					    </a>
					    <a class="carousel-control right" href="#myCarousel" 
					        data-slide="next">&rsaquo;
					    </a>
					</div>
				</div>
				<div class="modal-footer">
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
</body>
<script>
$(function(){ 
	
	//初始化数据
	query(0,'','');
	
    //点击打开文件选择器  
    $("#upload").on('click', function() {  
        $('#fileToUpload').click();  
    });
	setOnTimeCount();
	
    var getting = {
            url:'./countLevel.do',
            dataType:'json',
            success:function(res) {
            	if($('#onTimeCount').val()!=res){
            		$('#onTimeCount').val(res);
            		toQuery();
            	}
             	$.ajax(getting); //关键在这里，回调函数内再次请求Ajax
    		},        
            //当请求时间过长（默认为60秒），就再次调用ajax长轮询
            error:function(res){
            	$.ajax($getting);
            }

    };
  	//开始
    //$.ajax(getting);
  	
  	//禁止轮播
    $("#myCarousel").carousel('pause');
  	
  	//
  	$("#showImg").css({
  		'width': function () {
            return ($('.list-group-item').width()+32);
        }
  	})
    
});   
	function setOnTimeCount(){
		$.ajax({
			url:'./countLevel.do',
	        dataType:'json',
	        async:false,
	        success:function(res){
	        	$('#onTimeCount').val(res);
	        }
		})
	}
	function query(page,name,picture_type){
		 $.ajax({
			 type : "POST",	
			 dataType: 'json',
			 data:{page:page,pagesize:"20",name:name,picture_type:picture_type},
		   	 url : "./queryPhotos.do",    			 
		   	 success: function(data){
		   		 $('#page').html(data.page+1);
		   		 $('#total').html(data.total);
		   		if(data.rows.length>0){
		   			for (var i = 0; i < data.rows.length; i++) {
		   				var trClass="";
				   		 if(data.rows[i].level==1){
				   			trClass="success";
				   		 }
		   				var path=data.rows[i].picture_path.replace(new RegExp(/\./g),'\\.').replace(new RegExp(/\//g),'\\/');
		   			 $('<tr class="'+trClass+'">'+
		   		            '<td style="padding:0px">'+data.rows[i].id+'</td>'+
		   		            '<td style="padding:0px">'+data.rows[i].picture_name+'</td>'+
		   		           '<td style="padding:0px">'+getType(data.rows[i].picture_type)+'</td>'+
		   		           '<td style="padding:0px">'+data.rows[i].picture_information+'</td>'+
		   		           '<td style="padding:0px">'+data.rows[i].comment+'</td>'+
		   		        	'<td style="padding:0px">正常</td>'+
		   		     		'<td style="padding:0px">'+data.rows[i].putin_date+'</td>'+
		   		            '<td style="padding:0px">'+
		   		                '<div class="btn-group">'+
		   		                  '<a onclick="view(\'' +path+ '\',\''+data.rows[i].picture_name+'\')" class="btn btn-default" style="padding-top:0px;padding-bottom:0px;margin-top:2px;margin-bottom:2px">查看</a>'+'<a href="" class="btn btn-default" style="padding-top:0px;padding-bottom:0px;margin-top:2px;margin-bottom:2px">标记</a><a onclick="dele(\''+data.rows[i].id+'\')" class="btn btn-danger" style="padding-top:0px;padding-bottom:0px;margin-top:2px;margin-bottom:2px">删除</a>'+
		   		                '</div></td></tr>').appendTo($('#listBody'));
		   			}
		   		}
	        }
		});
	}
	function getType(type){
		switch(Number(type)){
			case 1:
				return "A类";
			case 2:
				return "B类";
			case 3:
				return "C类";
			case 4:
				return "D类";
		}
	}
	function view(path,name){
		 $("#viewImg").attr("src",path);  
		 $('#imgName').html(name);
		 $('#myModal2').modal({
		        keyboard: true
		  })
	}
	function toShow(){
		 $('.carousel-inner').html("");
		$('.carousel-indicators').html(""); 
		$.ajax({
			 type : "POST",	
			 dataType: 'json',
			 data:{page:0,pagesize:1000,level:'1'},
		   	 url : "./queryPhotos.do",    			 
		   	 success: function(data){
		   		if(data.rows.length>0){
		   			for (var i = 0; i < data.rows.length; i++) {
		   				var liClass = "";
		   				if(i==0)liClass = "active";
		   				$('<div class="item '+liClass+'">'+
		   		            '<img style="width:500px;height:450px;margin:0 auto;" src="'+data.rows[i].picture_path+'"></div>'
		   		          ).appendTo($('.carousel-inner'));
		   				$('<li data-target="#myCarousel" data-slide-to="'+i+'" class="'+liClass+'"></li>').appendTo($('.carousel-indicators'));
		   			}
		   		}   
	        }
		}); 
        $('#myModal3').modal('show');
		$('#toShowBody').css({
			'width': function () {
                return ($(document.body).width()-60);
            },
            'height': function () {
                return ($(document.body).height()-270);
            }
		});
	}
   //选择文件之后执行上传  
   	function changeEvent(){
   		 $.ajaxFileUpload({  
               url:'./toUpload.do',  
               secureuri:false,  
               fileElementId:'fileToUpload',//file标签的id  
               dataType: 'json',//返回数据的类型  
               data:{name:'logan'},//一同上传的数据  
               success: function (data, status) { 
                   $("#upload").attr("src", "../photo/"+data.fileName);  
               },  
               error: function (data, status, e) {  
                   alert(e);  
               }  
           });  
   	}
        

function toOpen(){
	  $('#myModal').modal({
	        keyboard: true
	  })
	   $('#myModal').on('hide.bs.modal', function () {
	    	$('#name').val("");
	    	$('#comment').val("");
	    	$('#picture_information').val("");
	    	$("#upload").attr("src", "./img/select.png");  
	    })
}
function addPhoto(){
	var name = $('#picture_name').val();
	var picture_type = $('#picture_type').val();
	var comment = $('#comment').val();
	var picture_path = $("#upload").attr("src");
	var picture_information = $('#picture_information').val();
	$.ajax({
		 type : "POST",	
		 dataType: 'json',
		 data:{name:name,comment:comment,picture_path:picture_path,picture_information:picture_information,picture_type:picture_type},
	   	 url : "./addPhoto.do",    			 
	   	 success: function(data){
	   		 if(data.status=="success"){
	   			 $('#myModal').modal('hide');
	   			 toQuery();
	   			 alert("上传成功！");
	   		 }else{
	   			 alert("图片信息填加失败！");
	   		 }
         }
 	});
}
function dele(id){
	if(confirm("确认删除该图片信息？")){
		$.ajax({
			 type : "POST",	
			 dataType: 'json',
			 data:{id:id},
		   	 url : "./deletePhoto.do",    			 
		   	 success: function(data){
		   		 if(data.status=="success"){
		   			 toQuery();
		   		 }else{
		   			 alert("图片删除失败！");
		   		 }
	        }
		});
	}
}
function preView(){
	if($('#page').html()!="1"){
		$("table tbody").html("");
		var name=$('#name').val();
		var type=$('#type').val();
		query(Number($('#page').html()-2),name,type);
	}
}
function nextView(){
	if(Number($('#total').html())>10 && Number($('#page').html())*10<Number($('#total').html())){
		$("table tbody").html("");
		var name=$('#name').val();
		var type=$('#type').val();
		query(Number($('#page').html()),name,type);
	}
}
function toQuery(){
	$("table tbody").html("");
	var name=$('#name').val();
	var type=$('#type').val();
	query(0,name,type);
}
</script>
</html>