<#macro login>

    <form action="/login" method="post">

        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <div class="mb-3">
            <label for="inputNickname" class="form-label">Nickname</label>
            <input type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                   id="inputNickname" name="username" value="<#if user??>user.username</#if>">
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Password</label>
            <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   id="exampleInputPassword1" name="password">
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
        <div class="mb-3">
            <a href="/registration">Registration</a>
        </div>
    </form>

<#--<form action="${path}" method="post">-->
<#--    <div><label> User Name : <input type="text" name="username"/> </label></div>-->
<#--    <div><label> Password: <input type="password" name="password"/> </label></div>-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}"/>-->
<#--    <div><input type="submit" value="S  ign In"/></div>-->
<#--</form>-->
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Sign Out</button>
    </form>
</#macro>