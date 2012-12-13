{if $block->data['list_type']=="digit"}
    {include file="blocks/email_list_digit.tpl" block=$block}
{else}
    {include file="blocks/email_list_square.tpl" block=$block}
{/if}