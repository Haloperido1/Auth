<#import "parts/common.ftl" as p>
<#import "parts/login.ftl" as l>
<@p.page>

<#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
    <div class="alert alert-danger" role="alert">
        ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
    </div>
</#if>
    <#if message??>
        <div class="alert alert-${messageType}" role="alert">
            ${message}
        </div>
    </#if>
<@l.login />
</@p.page>