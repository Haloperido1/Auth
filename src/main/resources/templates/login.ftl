<#import "parts/common.ftl" as p>
<#import "parts/login.ftl" as l>
<@p.page>

    ${message?ifExists}

<@l.login />
</@p.page>