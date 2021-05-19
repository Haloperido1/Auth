<#macro registration>
    <form action="/registration" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="mb-3">
            <label for="inputNickname" class="form-label">Nickname</label>
            <input type="text" class="form-control
<#--${(usernameError??)?string('is-invalid', '')}-->
"
                   id="inputNickname" name="username" value="<#if user??>${user.username}</#if>">
<#--            <div class="invalid-feedback">-->
<#--                ${usernameError}-->
<#--            </div>-->
        </div>

    <div class="mb-3">
        <label for="InputEmail" class="form-label">Email address</label>
        <input type="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
               id="InputEmail" aria-describedby="emailHelp" name="email" placeholder="Enter email"
               value="<#if user??>${user.email}</#if>">
        <#if emailError??>
            <div class="invalid-feedback">
                ${emailError}
            </div>
        </#if>
        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
    </div>

        <div class="mb-3">
            <label for="InputPassword" class="form-label">Password</label>
            <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   id="InputPassword" name="password" placeholder="Enter password">
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
        <div class="mb-3">
            <label for="RetypePassword" class="form-label">Password</label>
            <input type="password" class="form-control ${(password2Error??)?string('is-invalid', '')}"
                   id="RetypePassword" name="password2" placeholder="Retype password">
            <#if password2Error??>
                <div class="invalid-feedback">
                    ${password2Error}
                </div>
            </#if>
        </div>
        <div class="g-recaptcha" data-sitekey="6LfXwdgaAAAAAEGVf1-mtJBjux9GRrwkt44RLpuv">

        </div>
        <#if captchaError??>
            <div class="alert alert-danger" role="alert">
                ${captchaError}
            </div>
        </#if>
        <br/>
        <button type="submit" class="btn btn-primary">Submit</button>
</form>

</#macro>