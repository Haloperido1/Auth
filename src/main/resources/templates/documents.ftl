<#import "parts/common.ftl" as p>
<@p.page>
    <h5>Upload file</h5>
<#--    <div class="">-->
<#--        <div>-->
<#--        <form method="post" id="upload" name="upload" action="/documents/upload" enctype="multipart/form-data">-->
<#--            <input type="file" name="file" multiple required>-->
<#--            <button type="submit" >Submit</button>-->
<#--        </form>-->
<#--        </div>-->
<#--    </div>-->

    <div>
        <h3>Upload Multiple Files</h3>
        <form id="uploadFiles" name="uploadFiles" method="post" action="/documents/uploadFiles" encType="multipart/form-data">
            <input type="file" name="files" multiple required />
            <button type="submit">Submit</button>
        </form>
    </div>

    <div>
        <h5>List of documents</h5>
        <table>
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Download Link</th>
            </tr>
            </thead>
            <tbody>
            <#list docs as doc>
                <tr>
                    <td>${doc.id}</td>
                    <td>${doc.docName}</td>
                    <td><a href="/download/${doc.id}">Download</a></td>
                </tr>
            </#list>

            </tbody>
        </table>
    </div>
</@p.page>