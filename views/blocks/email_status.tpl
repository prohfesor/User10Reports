{if $block->data['status']=='green'}
    {include file="blocks/email_status_green.tpl" block=$block}
{elseif $block->data['status']=='red'}
    {include file="blocks/email_status_red.tpl" block=$block}
{elseif $block->data['status']=='yellow'}
    {include file="blocks/email_status_yellow.tpl" block=$block}
{else}
    {include file="blocks/email_status_grey.tpl" block=$block}
{/if}