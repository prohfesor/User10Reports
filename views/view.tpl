{include "_header.tpl"}


<div class="sidebar">

</div>


<div class="main">
    <div class="caption with-date">
        <h1>{$report->name}</h1>
        <span class="date">{$report->date_from|date_format:"%b, %e, %Y"} - {$report->date_to|date_format:"%b, %e, %Y"}</span>
    </div>

    <ul class="edit-blocks">
        {foreach from=$report->blocks item=block}
            {include file="blocks/`$block->type`.tpl" block=$block}
        {foreachelse}
            <li>
                <span class="block-caption">Nothing</span>
                <span class="area">No content at this report</span>
            </li>
        {/foreach}
    </ul>


{include "_footer.tpl"}