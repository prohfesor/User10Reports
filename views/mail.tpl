<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta charset="utf-8" />
    <title>Email</title>
</head>
<body style="color: #333; margin: 0; font: 15px Arial, Helvetica, serif;">
<table style="background: #E4E4E4; margin: 0 auto;" width="600" border="0" cellspacing="0" cellpadding="0">

    <tr>
        <td colspan="3">
            <div style="border: 1px solid #F2F2F2; background: #FFF; height: 58px; padding: 22px 0 0 22px;">{$report->name}<span style="display: block; color: #999; padding: 3px 0 0; font-size: 10px;">{$report->date_from|date_format:"%b, %e, %Y"}
                - {$report->date_to|date_format:"%b, %e, %Y"}</span></div>
        </td>
    </tr>
    <tr>
        {section name=k start=0 loop=3}
        <td>
            {assign var="block" value=$report->blocks[$smarty.section.k.index]}
            {if (!empty($block->data) AND !empty($block->type))}
                {include file="blocks/email_`$block->type`.tpl" block=$block}
            {/if}
        </td>
        {/section}
    </tr>
    {if count($report->blocks)>3}
    <tr>
        {section name=k start=3 loop=6}
            <td>
                {assign var="block" value=$report->blocks[$smarty.section.k.index]}
                {if (!empty($block->data) AND !empty($block->type))}
                {include file="blocks/email_`$block->type`.tpl" block=$block}
                {/if}
            </td>
        {/section}
    </tr>
    {/if}
    {if count($report->blocks)>6}
    <tr>
        {section name=k start=6 loop=9}
            <td>
                {assign var="block" value=$report->blocks[$smarty.section.k.index]}
                {if (!empty($block->data) AND !empty($block->type))}
                {include file="blocks/email_`$block->type`.tpl" block=$block}
                {/if}
            </td>
        {/section}
    </tr>
    {/if}
    {if count($report->blocks)>9}
        <tr>
            {section name=k start=9 loop=12}
                <td>
                    {assign var="block" value=$report->blocks[$smarty.section.k.index]}
                    {if (!empty($block->data) AND !empty($block->type))}
                {include file="blocks/email_`$block->type`.tpl" block=$block}
                {/if}
                </td>
            {/section}
        </tr>
    {/if}
</table>

</body>
</html>
