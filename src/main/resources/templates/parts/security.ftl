<#assign
    know = Session.SPRING_SECURITY_CONTEXT??

    >
<#if know>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        userId = user.getId()
        name = user.getUsername()
        isAdmin = user.isAdmin()
        >
    <#else >
    <#assign
        name ="unknown"
        isAdmin = false
        userId =""
        >
</#if>