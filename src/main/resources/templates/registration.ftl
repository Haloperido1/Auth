<#import "parts/common.ftl" as p>
<#import "parts/registration.ftl" as r>
<@p.page>

${message?ifExists}

<@r.registration />
    <a href="/login">Log in</a>
</@p.page>