<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ 
page import="java.util.List, 
			com.harmony.ensemble.model.dto.EnsembleTeamComment,
			com.harmony.ensemble.model.dto.EnsembleTeam,
			com.harmony.ensemble.model.dto.EnsembleTeamTime,
			com.harmony.ensemble.model.dto.EnsembleTeamMusic,
			com.harmony.ensemble.model.dto.EnsembleTeamVideo,
			com.harmony.ensemble.model.dto.Genre,
			com.harmony.ensemble.model.dto.EnsembleTeamComment" 
%>
<%
EnsembleTeam team=(EnsembleTeam)request.getAttribute("team");
List<EnsembleTeamTime> time = (List<EnsembleTeamTime>)request.getAttribute("time");
List<EnsembleTeamMusic> music = (List<EnsembleTeamMusic>)request.getAttribute("music");
List<EnsembleTeamVideo> video = (List<EnsembleTeamVideo>)request.getAttribute("video");
List<Genre> genre = (List<Genre>)request.getAttribute("genre");
// List<EnsembleTeamComment> comments=(List<EnsembleTeamComment>)request.getAttribute("comments");
%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/ensemble/teamProfile.css" type="text/css">

<%@ include file="/views/common/header.jsp" %>  

<main>
<input type="hidden" name="teamNo" value="<%=team.getEnsTeamNo()%>">
	<section>
	<%if(team!=null){ %>
		<div class="teamName_container">
			<p><b>팀명</b></p>
			<%=team.getEnsTeamName() %>
			<br>
		</div>
		<div class="hr_container">
			<hr>
		</div>
		<div>
			<p><b>장르</b></p>
			<% if(!genre.isEmpty()){
					for(Genre g: genre){%>
						<%if(team.getEnsGenreNo().equals(g.getGenreCode())){ %>
							<%=g.getGenreName() %>
						<%} %>
				<%}
			}%>
		</div>
		<div class="time_container">
			<p><b>합주 일정</b></p>
		<%if(!time.isEmpty()){ 
			for(EnsembleTeamTime t : time){%>
			<%=t.getEnsStartTime() %> <br>
					~ <br>
			<%=t.getEnsEndTime() %>
			<%} 
		}%>
		</div>
		<div class="hr_container">
			<hr>
		</div>		
		<div class="video_container">
			<p><b>영상</b></p>
			<%if(!video.isEmpty()){ 
			for(EnsembleTeamVideo v : video){%>
			<%=v.getVReName() %> <br>
			<%} 
		}%>
		<video src="https://media.istockphoto.com/id/933641342/ko/%EB%B9%84%EB%94%94%EC%98%A4/%ED%82%A4%EB%B3%B4%EB%93%9C-%EC%98%A4%EB%A5%B4%EA%B0%84-%EB%98%90%EB%8A%94-%ED%94%BC%EC%95%84%EB%85%B8-%EC%82%B0%ED%83%80-%EB%AA%A8%EC%9E%90%EC%97%90-%EC%9E%AC%EB%AF%B8-%EC%9E%88%EB%8A%94-%EA%B3%A0%EC%96%91%EC%9D%B4-%EC%9E%AC%EC%83%9D.mp4?s=mp4-640x640-is&k=20&c=lVo-NN-mzc5P6YYJvQtgzJI2zGQtn9u286QEmoewgeM="
				controls width="350" height="300"></video>
		</div>
		<div class="hr_container">
			<hr>
		</div>
		<div class="detail_container">
		<div class="music_container">
			<p><b>음원</b></p>
			<%if(!music.isEmpty()){ 
			for(EnsembleTeamMusic m : music){%>
				<%=m.getMReName() %> <br>
				 <audio src="https://artlist.io/royalty-free-music/song/beat-blitz/116358"
					controls></audio> <br><br>
			<%} 
		}%>
		
		</div>
		<div class="hr_container">
			<hr>
		</div>
		<div class="detail_container">
			<p><b>한 줄 소개</b></p>
			<%=team.getEnsTeamInfo() %>		
			
		</div>
		<div class="hr_container">
			<hr>
		</div>		
		<div class="comments_container">
			<p><b>댓글 보기</b></p>
		</div>
		
	<%} %>
	</section>
	<aside>
		<div class="mem_profile_container">
			<p><b>멤버 프로필</b></p>
		</div>
	</aside>
</main>

<%@ include file="/views/common/footer.jsp" %>  