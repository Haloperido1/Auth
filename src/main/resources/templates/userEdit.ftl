<#import "parts/common.ftl" as p>
<#include "parts/security.ftl">
<@p.page>
    User edit
    <form action="/user" method="post">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <input type="hidden" value="${user.id}" name="userId">

        <input type="text" name="username" value="${user.username}">
        <#if isAdmin>
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        </#if>

        <button type="submit">Save</button>
    </form>
</@p.page>