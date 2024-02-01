<#import "parts/common.ftl" as c>

<@c.page>
    <div>
        <span><a href="/user">User list</a></span>
    </div>
    <div>
        <form method="post" enctype="multipart/form-data">
    <label>
      <input type="text" name="text" placeholder="Put message" />
    </label>
    <label>
      <input type="text" name= "tag" placeholder="Tag">
    </label>
            <input type="file" name="file">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit">Add</button>
        </form>
    </div>
<div>List messages</div>
    <form method="get" action="/main">
        <label>
            <input type="text" name="filter" value="${filter?if_exists}">
        </label>
        <button type="submit">Find</button>
</form>
<#list messages as message>
    <div>
        <b>${message.id}</b>
        <span>${message.text}</span>
        <i>${message.tag}</i>
        <strong>${message.authorName}</strong>
    </div>
    <div>
        <#if message.filename??>
            <img src ="/img/${message.filename}">
        </#if>
    </div>
<#else>
    No message
</#list>
</@c.page>