{include "_header.tpl"}

<div class="wrap list-page">
    <div class="main">

    <div class="caption">
        <h1>Reports</h1>
    </div>

    <ul class="reports-list">
    {foreach from=$reports item=report}
        <li class="report">
            <a href="/view/{$report->id}/">
                <span class="view">view</span>
                <span class="name">{$report->name}</span>
                <span class="date">{$report->date_from|date_format:"%b, %e, %Y"} - {$report->date_to|date_format:"%b, %e, %Y"}</span>
            </a>
        </li>
        {foreachelse}

        <li class="report empty">
            <span class="name">There is no reports currently</span>
        </li>
    {/foreach}
    </ul>

    <div class="pagination">
        <a href="/add/" class="add"></a>
        <a href="/" class="left"></a>
        <a href="/" class="right"></a>
    </div>


{include "_footer.tpl"}