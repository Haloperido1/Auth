<#macro registration>
    <form action="/registration" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div class="mb-3">
        <label for="InputEmail" class="form-label">Email address</label>
        <input type="email" class="form-control" id="InputEmail" aria-describedby="emailHelp" name="email">
        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
    </div>
    <div class="mb-3">
        <label for="inputNickname" class="form-label">Nickname</label>
        <input type="text" class="form-control" id="inputNickname" name="username">
    </div>
    <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input type="password" class="form-control" id="exampleInputPassword1" name="password">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>

</#macro>