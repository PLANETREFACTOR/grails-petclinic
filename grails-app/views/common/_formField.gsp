${label}:
<g:if test="${bean.errors.getFieldError(field)}">
	<span class="errors">
		<g:fieldError bean="${bean}" field="${field}" />
	</span>
</g:if>

<br/>
<g:textField name="${name + '_' + field}"
             value="${fieldValue(bean:bean, field:field)}" />
