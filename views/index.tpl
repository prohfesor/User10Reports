{include "_header.tpl"}


<h1>Reports</h1>

<ul id="reports">
{foreach from=$reports item=report}
    <li class="report-item">
        <span>{$report->name}</span>
        <br>
        <span>{$report->date_from|date_format:"%b, %e, %Y"} - {$report->date_to|date_format:"%b, %e, %Y"}</span>
        <br>
        <a href="/edit.html">View</a>
        <br><br>
    </li>
{foreachelse}

    <li class="noreports">
    - sorry, no reports yet -
    </li>
{/foreach}
</ul>


{include "_footer.tpl"}