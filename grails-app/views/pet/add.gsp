<html>
	<head>
		<meta name="layout" content="main">
		<title>${ pet.id ? 'Update' : 'Add'} Pet</title>
	</head>

	<body id="add">
		<h2><g:if test="${!pet.id}">New </g:if>Pet</h2>

		<b>Owner:</b> ${pet.owner?.firstName} ${pet.owner?.lastName}
		<br/>

		<g:form action="${pet.id ? 'edit' : 'add'}">
			<g:if test="${pet.id}">
				<g:hiddenField name="id" value="${pet.id}" />
			</g:if>
			<g:hiddenField name="owner_id" value="${pet.owner.id}"></g:hiddenField>
			<table>
				<tr>
					<th>
					<g:render template="/common/formField"
					          model="[name:'pet', bean:pet, field:'name', label:'Name']" />
				</th>
				</tr>
				<tr>
					<th>
						Birth Date:
						<g:if test="${pet.errors.getFieldError("birthDate")}">
							<span class="errors"><g:fieldError bean="${pet}" field="birthDate" /></span>
						</g:if>

						<br/>
						<g:datePicker name="pet.birthDate" value="${pet.birthDate}" precision="day"></g:datePicker>
					</th>
				</tr>
				<tr>
					<th>
						Type:
						<g:if test="${pet.errors.getFieldError("birthDate")}">
							<span class="errors"><g:fieldError bean="${pet}" field="type" /></span>
						</g:if>
						<br/>
						<g:select optionKey="id"
						          optionValue="name" name="pet.type.id"
						          from="${types}"
						          value="${pet.type?.id}"/>
					</th>
				</tr>
				<tr>
					<td>
						<p class="submit"><input type="submit" value="${pet.id ? 'Update' : 'Add' } Pet"/></p>
					</td>
				</tr>
			</table>
		</g:form>

	</body>
</html>
