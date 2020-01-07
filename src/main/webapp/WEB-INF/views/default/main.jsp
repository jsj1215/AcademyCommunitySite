<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
 <script>
    $('.carousel').carousel({
        interval: 1000 //changes the speed
    })
    </script>
    
    <style>
	    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .info .close:hover {cursor: pointer;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	    .info .link {color: #5085BB;}
	</style>
</head>
<body>

<%@ include file="header.jsp" %>
<div class="container">
    
        <div class="row ">
        	
        	       
            <div class="box">
                
                       
                <div class="col-lg-6 text-center">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"><!-- data-ride="carousel" 자동 슬라이드 기능 -->
                       
                        <ol class="carousel-indicators hidden-xs">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            
                        </ol>

                     
                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="img-responsive img-full" src="resources/img/1.png">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="resources/img/2.png"> <!-- img-full 옵션 class -->
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="resources/img/1.jpg">
                            </div>
                            
                           
                        </div>

                       	
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="icon-prev"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="icon-next"></span>
                        </a>
                    </div>
                        
                </div>
                
                
                 
                    
                <div class="col-lg-6 text-center" >    
                   
						<h2>KG아이티뱅크</h2>
						<p>
							종로점을 소개합니다.
						</p>
						<hr>
						<h3>학원 영상</h3>
						
						<iframe width="100%" height="372px" 
						src="https://serviceapi.nmv.naver.com/flash/convertIframeTag.nhn?vid=422DB03A8E48341A1EEF017E9CAD17C25653&outKey=V122e0ba17dc83ebd8175f6cff91b91f7aaec15190f61ecee2a67f6cff91b91f7aaec&width=544&height=306?autoplay=true&amp;loop=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
						</iframe>
					
                 </div>   
                    
                
            </div>
            
          
            
        </div>

        <div class="row">
            <div class="box">
            
                      
        
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">KG아이티뱅크 종로점
                        <strong>오시는 길</strong>
                    </h2>
                    <hr>
		                <div class="inner" align="center">
							<div id="map" style="width:90%;height:600px;"></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9533957086b7879f4d7bb431b7e848f9"></script>
							<script>
								var container = document.getElementById('map');
								var options = {
									center: new kakao.maps.LatLng(37.570938, 126.992418),
									level: 3
								};
								
								var markerPosition  = new kakao.maps.LatLng(37.570938, 126.992418); 
						
								var map = new kakao.maps.Map(container, options);
								
								var marker = new kakao.maps.Marker({
								    position: markerPosition
								});
						
								marker.setMap(map);
						
								var content = '<div class="wrap">' + 
						        '    <div class="info">' + 
						        '        <div class="title">' + 
						        '            KG 아이티뱅크' + 
						        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
						        '        </div>' + 
						        '        <div class="body">' + 
						        '            <div class="img">' +
						        '                <img src="./resources/img/image.png" width="73" height="70">' +
						        '           </div>' + 
						        '            <div class="desc">' + 
						        '                <div class="ellipsis">서울 종로구 돈화문로 26 단성사 4층</div>' + 
						        '                <div class="jibun ellipsis">묘동 56(우) 03138 </div>' + 
						        '                <div><a href="http://mgr.kgitbank.com" target="_blank" class="link">홈페이지</a></div>' + 
						        '            </div>' + 
						        '        </div>' + 
						        '    </div>' +    
						        '</div>';
						
								var overlay = new kakao.maps.CustomOverlay({
								content: content,
								map: map,
								position: marker.getPosition()       
								});
								
								kakao.maps.event.addListener(marker, 'click', function() {
								overlay.setMap(map);
								});
								
								function closeOverlay() {
								overlay.setMap(null);     
								}		
							</script>
	                    </div>
	                    	
                    
                </div>
              
                
                
                
            </div>
        </div>

          
    <!-- /.container -->
    </div>
<%@ include file="footer.jsp" %>
</body>
</html>