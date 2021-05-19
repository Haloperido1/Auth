<#import "parts/common.ftl" as p>
<#import "parts/login.ftl" as l>
<@p.page>
    <div class="">
        <form method="GET" action="/main" class="form-inline">
            <div class="input-group mb-3">
                <input type="text" class="form-control ml-3" id="filter"  name="filter" placeholder="Search by tag" value="${filter?ifExists}">
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </form>
    </div>
    <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>
    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="form-group mt-3 mb-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="text" placeholder="Введите сообщение"
                           class="form-control ${(textError??)?string('is-invalid', '')}"
                            value="<#if message??> ${message.text} </#if>"/>
                    <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                    </#if>
                </div>
                <div class="form-group mt-3">
                    <input type="text" name="tag" placeholder="Тэг" class="form-control"
                           value="<#if message??> ${message.tag} </#if>">
                    <#if tagError??>
                        <div class="invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                </div>
                <div class="form-group mt-3">
                    <input type="file" name="file" class="form-control">
                </div>
                <div class="form-group mt-3">
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                </div>
                <div class="form-group mt-3" >
                    <button type="submit" class="btn btn-primary">Add message</button>
                </div>
            </form>
        </div>
    </div>


    <div class="row row-cols-1 row-cols-md-2 g-4 mt-3">
        <#list messages as message>
            <div class="card my-3 mx-3" style="width: 18rem;">
                <div class="card-body">
                    <div>
                        <h5 class="card-title">${message.text}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">${message.authorName}</h6>
                        <p class="card-text">${message.tag}</p>
                        <div>
                        <#if message.filename??>
                             <a href="#" class="card-link">Card link</a>
                             <a href="#" class="card-link">Another link</a>
                            <div>
                             <img src="/img/${message.filename}">
                            </div>
                        </#if>
                        </div>
                    </div>
                </div>
            </div>
        <#else>
            No message
        </#list>

    </div>
</@p.page>