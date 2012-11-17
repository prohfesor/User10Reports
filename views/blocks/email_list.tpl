{if $block->list_type=="square"}
    {include file="blocks/email_list_square.tpl" block=$block}
{else}
    {include file="blocks/email_list_digit.tpl" block=$block}
{/if}