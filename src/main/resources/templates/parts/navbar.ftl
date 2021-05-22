<#include "security.ftl">
<#import "login.ftl" as l>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">WebApp</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/documents">Documents</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/main">Messages</a>
                </li>
                <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link active" href="/user">User list</a>
                </li>
                </#if>
            </ul>
        </div>
        <div>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <#if user??>
            <li class="nav-item mr-3">
                <a class="nav-link active"  href="/user/profile">${name}</a>
            </li>
                </#if>
            <li class="nav-item">
                <@l.logout />
            </li>
            </ul>

        </div>
    </div>
</nav>