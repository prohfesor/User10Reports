{include "_header.tpl"}

<div class="wrap edit-page">

<div class="sidebar">

<div class="forms-wrap">
<div class="side-block">
    <div class="side-caption"><h2>About the Report</h2></div>
    <div class="form-block">
        <form>
            <label>Report Name:</label>
            <div class="input-block">
                <input type="text" placeholder="Social Media Marketing Report" />
            </div>

            <label>Reporting for date range:</label>
            <div class="input-block date">
                <a href="#" class="icon"></a>
                <input type="text" />
            </div>

            <label>Created by:</label>
            <div class="input-block">
                <input type="text" placeholder="youremail@example.com" />
            </div>

            <button class="btn-green">Publish Report</button>
        </form>
    </div>
</div>
</div> <!-- /Forms-wrap -->

<ul class="buttons-block">
    <li class="first switch active"><a href="#"></a></li>
    <li class="button share"><a href="#">Share</a></li>
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
            <span class="block-caption">Nothing</span>
            <span class="area">No content at this report</span>
        </li>
    {/foreach}
    </ul>

{include "_footer.tpl"}
