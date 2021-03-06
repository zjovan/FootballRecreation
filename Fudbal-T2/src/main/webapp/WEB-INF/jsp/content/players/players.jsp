<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLibs.jsp"%>

<c:choose>
	<c:when test="${not empty errors}">
		<c:forEach items="${errors}" var="error">
			<fmt:message key="${error.code}" />
		</c:forEach>
	</c:when>
	<c:otherwise>

		<c:set var="home" value="<%=rs.tfzr.FudbalT2.model.Player.Team.Home%>"></c:set>
		<c:set var="away" value="<%=rs.tfzr.FudbalT2.model.Player.Team.Away%>"></c:set>
		<c:set var="none" value="<%=rs.tfzr.FudbalT2.model.Player.Team.None%>"></c:set>
		<div
			style="line-height: 40px; margin-bottom: 0px; width: 100%; border-bottom: 1px solid #DDD; padding-bottom: 5px;">
			<h1 style="display: inline;">
				<fmt:message key="page.players.title" />
			</h1>
			<sec:authorize ifAllGranted="ROLE_ADMIN">
				<a style="display: inline; margin-left: 20px;" class="btn btn-info"
					href="<c:url value="/players/exhibition/${exhibitionId}/add" />"
					role="button"> <fmt:message key="page.players.addPlayer" />
				</a>
			</sec:authorize>
		</div>
		<div>

			<h3 class="bg-success"
				style="padding: 15px; color: #666; margin-top: 0px;">
				<fmt:message key="page.players.exhibitionStartTitle" />
				: <small><c:out value="${exhibitionStart}" /></small>
			</h3>
		</div>
		<c:if test="${not empty players && fn:length(players) gt 0}">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th><fmt:message key="page.players.table.user" /></th>
						<th><fmt:message key="page.players.table.team" /></th>
						<sec:authorize ifAllGranted="ROLE_ADMIN">
							<th><fmt:message key="page.players.table.changeTeam" /></th>
						</sec:authorize>
					</tr>
				</thead>
				<c:forEach items="${players}" var="player">
					<tr class="info">
						<c:if test="${player.team == home}">
							<td style="vertical-align: middle;">
							<c:url var="link" value="/user/users/image/${player.userId}" />
							<img src="${link}" height="60" width="60" class="img-rounded"/>
							<a href="<c:url value="/user/users/${player.userId}" />"
							style="font-size:22px; margin-left:10px;">
									<c:out value="${player.firstName}"></c:out> <c:out
										value="${player.lastName}"></c:out>
							</a></td>
							<td style="vertical-align: middle;"><fmt:message key="page.player.team.home" /></td>
							<sec:authorize ifAllGranted="ROLE_ADMIN">
								<td style="vertical-align: middle;"><a
									href="<c:url value="/players/exhibition/${player.exhibitionId}/player/${player.id}/team/0" />">
										<fmt:message key="page.player.team.none" />
								</a> <a
									href="<c:url value="/players/exhibition/${player.exhibitionId}/player/${player.id}/team/2" />">
										<fmt:message key="page.player.team.away" />
								</a></td>
							</sec:authorize>
						</c:if>
					</tr>
				</c:forEach>
				<c:forEach items="${players}" var="player">
					<tr class="active">
						<c:if test="${player.team == away}">
							<td style="vertical-align: middle;">
							<c:url var="link" value="/user/users/image/${player.userId}" />
							<img src="${link}" height="60" width="60" class="img-rounded"/>
							<a href="<c:url value="/user/users/${player.userId}" />"
							style="font-size:22px; margin-left:10px;">
									<c:out value="${player.firstName}"></c:out> <c:out
										value="${player.lastName}"></c:out>
							</a></td>
							<td style="vertical-align: middle;"><fmt:message key="page.player.team.away" /></td>
							<sec:authorize ifAllGranted="ROLE_ADMIN">
								<td style="vertical-align: middle;"><a
									href="<c:url value="/players/exhibition/${player.exhibitionId}/player/${player.id}/team/0" />">
										<fmt:message key="page.player.team.none" />
								</a> <a
									href="<c:url value="/players/exhibition/${player.exhibitionId}/player/${player.id}/team/1" />">
										<fmt:message key="page.player.team.home" />
								</a></td>
							</sec:authorize>
						</c:if>
					</tr>
				</c:forEach>
				<c:forEach items="${players}" var="player">
					<tr>
						<c:if test="${player.team == none}">
							<td style="vertical-align: middle;">
							<c:url var="link" value="/user/users/image/${player.userId}" />
							<img src="${link}" height="60" width="60" class="img-rounded"/>
							<a href="<c:url value="/user/users/${player.userId}" />"
							style="font-size:22px; margin-left:10px;">
									<c:out value="${player.firstName}"></c:out> <c:out
										value="${player.lastName}"></c:out>
							</a></td>
							<td style="vertical-align: middle;"><fmt:message key="page.player.team.none" /></td>
							<sec:authorize ifAllGranted="ROLE_ADMIN">
								<td style="vertical-align: middle;"><a
									href="<c:url value="/players/exhibition/${player.exhibitionId}/player/${player.id}/team/1" />">
										<fmt:message key="page.player.team.home" />
								</a> <a
									href="<c:url value="/players/exhibition/${player.exhibitionId}/player/${player.id}/team/2" />">
										<fmt:message key="page.player.team.away" />
								</a></td>
							</sec:authorize>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<!-- USERS -->
		<c:if test="${not empty users}">
			<h1>
				<fmt:message key="page.users.title" />
				<small> <fmt:message key="page.players.addPlayer" />
				</small>
			</h1>
			<table class="table table-striped">
				<thead>
					<tr>
						<th><fmt:message key="page.players.table.user" /></th>
						<th><fmt:message key="page.players.addPlayer" /></th>
					</tr>
				</thead>
				<c:forEach items="${users}" var="user">
					<tr>
						<td><a href="<c:url value="/user/users/${user.id}" />"> 
									<c:out value="${user.firstName}" />
									<c:out value="${user.lastName}" />
									<c:out value="${user.username}" />
						</a></td>
						<td><a
							href="<c:url value="/players/exhibition/${exhibitionId}/add/${user.id}" />">
								<fmt:message key="common.action.add" />
						</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</c:otherwise>
</c:choose>