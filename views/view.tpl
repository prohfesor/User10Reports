{include "_header.tpl"}

<div class="wrap edit-page">

<div class="sidebar">

<div class="forms-wrap">
    <div class="side-block" style="display: none">
        <div class="side-caption"><h2>Share</h2></div>
        <div class="form-block side-list">
            <div class="add-block">
                <form>
                    <div class="input-block with-icon add-mail">
                        <button class="icon"></button>
                        <input type="text" placeholder="recipient@email.com" />
                    </div>
                </form>
                {if !empty($report->link)}
                <span class="share-link">Or share: <a href="{$report->link}" target="_blank">{$report->link}</a></span>
                {/if}
            </div>

            <ul class="mail-list">
                <li>
                    <div class="photo-block">
                        <img src="" />
                    </div>
                    <div class="info-block">
                        <span class="mail">{$report->user->email}</span>
                        <span class="hint">Created {$report->created|date_format:"%b %e, %Y"}</span>
                    </div>
                </li>
                {foreach from=$report->share item=email}
                <li>
                    <div class="photo-block">
                        <img src="" />
                    </div>
                    <div class="info-block">
                        <span class="mail">{$email->email}</span>
                        <span class="hint">Sent {$email->created|date_format:"%b %e, %Y"}</span>
                    </div>
                </li>
                {/foreach}
            </ul>
        </div>
    </div>
</div> <!-- /Forms-wrap -->

<ul class="buttons-block">
    <li class="first switch active"><a href="#sidebar"></a></li>
    <li class="button share"><a href="#sidebar">Share</a></li>
</ul>

</div> <!-- /Sidebar -->


<div class="main">


    <div class="caption with-date">
        <h1>{$report->name}</h1>
        <span class="date">{$report->date_from|date_format:"%b, %e, %Y"}
            - {$report->date_to|date_format:"%b, %e, %Y"}</span>
    </div>

    <ul class="edit-blocks">
    {foreach from=$report->blocks item=block}
    {include file="blocks/`$block->type`.tpl" block=$block}
        {foreachelse}
        <li>
            <table><tr><td>
            <span class="block-caption">Nothing</span>
            <span class="area">No content at this report</span>
            </td></tr></table>
        </li>
    {/foreach}
    </ul>



{include "_footer.tpl"}
