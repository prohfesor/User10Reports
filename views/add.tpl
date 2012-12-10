<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>User10Report</title>

    <link rel="stylesheet" type="text/css" href="/css/style.css"/>
    <link rel="stylesheet" href="/css/tipsy.css"/>
    <link rel="stylesheet" href="/css/datepicker.css"/>

    <!--<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>-->
    <script src="/js/jquery-1.7.1.min.js"></script>
    <script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
    <script src="/js/lib/jquery.form.js"></script>
    <script src="/js/lib/jquery.tipsy.js"></script>
    <script src="/js/lib/datepicker.js"></script>

    <script src="/js/lib/js-model.js"></script>
    <script src="/js/lib/js-view.js"></script>

    <script src="/js/model/custom-widget.js"></script>
    <script src="/js/model/image-widget.js"></script>
    <script src="/js/model/list-widget.js"></script>
    <script src="/js/model/quote-widget.js"></script>
    <script src="/js/model/status-widget.js"></script>

    <script src="/js/controller/tabs.js"></script>
    <script src="/js/controller/types.js"></script>
    <script src="/js/controller/forms.js"></script>
    <script src="/js/controller/list-form.js"></script>
    <script src="/js/controller/image-form.js"></script>
    <script src="/js/controller/status-form.js"></script>
    <script src="/js/controller/save-report.js"></script>
    <script src="/js/controller/about-form.js"></script>
    <script src="/js/controller/app.js"></script>
</head>
<body>
<div class="wrapper">
<div class="header">
    <!--<a href="#" class="logo"><img src="img/logo.png" alt="Logo" /></a>-->
    <ul>
        <li class="first"><a href="/" class="logo"><img src="/img/logo.png" alt="Logo"/></a></li>
        <li><a href="/" class="icon reports" title="Reports"></a></li>
        <li class="active"><a href="/add/" class="icon add" title="New Report"></a></li>
    </ul>
</div>
<!-- /Header -->

<div class="content">
<div class="wrap edit-page">
<div class="sidebar">

<div class="forms-wrap" id="forms">

<div class="side-block" id="types-form">
    <div class="side-caption"><h2>Add Data</h2></div>
    <div class="form-block side-list">
        <ul class="widget-type">
            <li data-class="custom">
                <div class="photo-block custom"></div>
                <div class="info-block">
                    <span class="name">Custom</span>
                    <span class="hint">Numbers, dollars, percentages-whatever you want</span>
                </div>
            </li>
            <li data-class="image">
                <div class="photo-block image"></div>
                <div class="info-block">
                    <span class="name">Image</span>
                    <span class="hint">Add a picture and a caption, nice and easy</span>
                </div>
            </li>
            <li data-class="list">
                <div class="photo-block list"></div>
                <div class="info-block">
                    <span class="name">List</span>
                    <span class="hint">Up to five bits of text, bulleted or numbered</span>
                </div>
            </li>
            <li data-class="quote">
                <div class="photo-block quote"></div>
                <div class="info-block">
                    <span class="name">Quote</span>
                    <span class="hint">Tell it like they said it, quote source and all</span>
                </div>
            </li>
            <li data-class="status">
                <div class="photo-block status"></div>
                <div class="info-block">
                    <span class="name">Status</span>
                    <span class="hint">Good, bad, and warning signals, nice and bright</span>
                </div>
            </li>
        </ul>
    </div>
</div>

<div class="side-block" id="about-form">
    <div class="side-caption"><h2>About the Report</h2></div>
    <div class="form-block">
        <form>
            <label>Report Name:</label>

            <div class="input-block">
                <input type="text" name="name"/>
            </div>

            <label>Reporting for date range:</label>

            <div class="input-block date with-icon">
                <input type="text" class="calendar" id="report-date" readonly/>
                <input type="hidden" name="date_from" id="date_from"/>
                <input type="hidden" name="date_to" id="date_to"/>
                
                <div class="calendar-hint">
                    <span class="arrow"></span>
                    <p><span class="month">Month 2012</span></p>
                    <p><span class="unactive">Dates not in this month</span></p>
                    <p><span class="not-selected">Unselected dates in this month</span></p>
                    <p><span class="selected">Selected dates in this month</span></p>
                </div>
            </div>

            <label>Created by:</label>

            <div class="input-block">
                <input type="text" name="email" placeholder="youremail@example.com"/>
            </div>

            <button class="btn-green">Publish Report</button>
        </form>
    </div>
</div>


<div class="side-block" id="custom-form">
    <div class="side-caption"><h2>Edit data</h2></div>
    <div class="form-block">
        <form>
            <label>Data:</label>
            <div class="input-block big-font">
                <input type="text" name="data" placeholder="$117.48" />
            </div>

            <label>Data Name:</label>
            <div class="input-block">
                <input type="text" name="name" placeholder="Revenue per Customer" />
            </div>

            <label>Data source(s):</label>
            <div class="input-block">
                <input type="text" name="source" placeholder="Optional" />
            </div>

            <button class="btn-green">Save and Continue Editing</button>

            <div class="delete-data"><a href="#">Delete This Data</a></div>
        </form>
    </div>
</div>


<div class="side-block" id="image-form">
    <div class="side-caption"><h2>Edit data</h2></div>
    <div class="form-block">
        <form enctype="multipart/form-data">
            <label>Upload picture:</label>

            <div class="input-block browse">
                <button class="btn-browse">Browse</button>
                <input type="text" name="picture"/>
                <input type="file" name="file" class="file-input"/>
            </div>

            <div class="input-caption">
                <span class="chars"><span data-max="140">140</span> Characters</span>
                <label>Caption:</label>
            </div>
            <div class="input-block">
                <textarea name="caption" maxlength="140" placeholder="Optional"></textarea>
            </div>

            <!--
            <label>Data source(s):</label>

            <div class="input-block">
                <input type="text" name="source" placeholder="Optional"/>
            </div>
            -->

            <button class="btn-green">Save and Continue Editing</button>

            <div class="delete-data"><a href="#">Delete This Data</a></div>
        </form>
    </div>
</div>


<div class="side-block" id="list-form">
    <div class="side-caption"><h2>Edit data</h2></div>
    <div class="form-block">
        <form>
            <label>List Name:</label>

            <div class="input-block">
                <input type="text" name="name" placeholder="Top Traffic Sources" />
            </div>

            <label>List:</label>

            <div class="input-block">
                <ul class="square marked-list" id="form-list" data-max="5">
                    <li><div class="square-inside"><input type="text" name="list[]" class="text" placeholder="Add Item..."/></div></li>
                </ul>
            </div>

            <div class="input-block choose-type radio-list" id="list-type">
                <ul class="square marked-list">
                    <li class="active">
                        <div class="square-inside">
                            <input type="radio" class="radio" name="list_type" value="square" checked/>
                            <span class="text">Bulleted list</span>
                        </div>
                    </li>
                </ul>
                <ul class="digit marked-list">
                    <li>
                        <input type="radio" class="radio" name="list_type" value="digit"/>
                        <span class="text">Numbered list</span>
                    </li>
                </ul>
            </div>

            <label>Data source(s):</label>

            <div class="input-block">
                <input type="text" name="source" placeholder="Optional"/>
            </div>

            <button class="btn-green">Save and Continue Editing</button>

            <div class="delete-data"><a href="#">Delete This Data</a></div>
        </form>
    </div>
</div>


<div class="side-block" id="quote-form">
    <div class="side-caption"><h2>Edit data</h2></div>
    <div class="form-block">
        <form>
            <div class="input-caption">
                <span class="chars"><span data-max="140">140</span> Characters</span>
                <label>Quote:</label>
            </div>
            <div class="input-block">
                <textarea name="quote" maxlength="140" placeholder='"What somebody said or wrote..."'></textarea>
            </div>

            <label>Quote source:</label>

            <div class="input-block">
                <input type="text" name="source" placeholder="Forbes Magazine, October 2012"/>
            </div>

            <button class="btn-green">Save and Continue Editing</button>

            <div class="delete-data"><a href="#">Delete This Data</a></div>
        </form>
    </div>
</div>


<div class="side-block" id="status-form">
    <div class="side-caption"><h2>Edit data</h2></div>
    <div class="form-block">
        <form>
            <label>Status:</label>
            <div class="input-block big-font">
                <input type="text" name="title" placeholder="Below" />
            </div>

            <label>Status name:</label>
            <div class="input-block choose-color">
                <span class="dotted"></span>
                <a href="#" class="color green"></a>
                <input type="text" class="text" name="name" placeholder="Budget" />
            </div>
            <div class="input-block drop-down radio-list">
                <ul class="square colored marked-list">
                    <li class="green active">
                        <span class="dotted"></span>
                        <span class="color"></span>
                        <span class="text">Good</span>
                        <input type="radio" name="status" value="green" checked/>
                    </li>
                    <li class="yellow">
                        <span class="dotted"></span>
                        <span class="color"></span>
                        <span class="text">Warning</span>
                        <input type="radio" name="status" value="yellow"/>
                    </li>
                    <li class="red">
                        <span class="dotted"></span>
                        <span class="color"></span>
                        <span class="text">Negative</span>
                        <input type="radio" name="status" value="red"/>
                    </li>
                    <li class="grey">
                        <span class="dotted"></span>
                        <span class="color"></span>
                        <span class="text">Neutral</span>
                        <input type="radio" name="status" value="grey"/>
                    </li>
                </ul>
            </div>

            <label>Data source(s):</label>
            <div class="input-block">
                <input type="text" name="source" placeholder="Optional"/>
            </div>

            <button class="btn-green">Save and Continue Editing</button>

            <div class="delete-data"><a href="#">Delete This Data</a></div>
        </form>
    </div>
</div>

<div class="side-block" id="share-form">
    <div class="side-caption"><h2>Share</h2></div>
    <div class="form-block side-list">
        <div class="add-block">
            <form>
                <div class="input-block with-icon add-mail">
                    <button class="icon"></button>
                    <input type="text" placeholder="recipient@email.com"/>
                </div>
            </form>
            <span class="share-link">Or share: <a href="#">http://lik.ie/r12345</a></span>
        </div>

        <ul class="mail-list">
            <li>
                <div class="photo-block">
                    <img src=""/>
                </div>
                <div class="info-block">
                    <span class="mail">jonathan@user10.com</span>
                    <span class="hint">Created 2 days ago</span>
                </div>
            </li>
            <li>
                <div class="photo-block">
                    <img src=""/>
                </div>
                <div class="info-block">
                    <span class="mail">jonathan@user10.com</span>
                    <span class="hint">Created 2 days ago</span>
                </div>
            </li>
            <li>
                <div class="photo-block">
                    <img src=""/>
                </div>
                <div class="info-block">
                    <span class="mail">jonathan@user10.com</span>
                    <span class="hint">Created 2 days ago</span>
                </div>
            </li>
        </ul>
    </div>
</div>

</div>

<ul class="buttons-block" id="tabs">
    <!--<li class="first close"><a href="#"></a></li>-->
    <li class="first switch active" id="toggle-tab"><a href="#"></a></li>
    <li class="button about active" id="about-tab"><a href="#">About</a></li>
    <li class="button add" id="add-widget-tab"><a href="#">Add data</a></li>
    <li class="button share" id="share-tab"><a href="#">Share</a></li>
    <li class="button edit active" id="edit-tab"><a href="#">Edit data</a></li>
</ul>

</div>
<!-- /Sidebar -->


<div class="main">
    <!--
    <div class="caption">
        <h1>New Report</h1>
    </div>
    -->

    <div class="caption with-date">
        <a href="#" class="btn-green publish-btn">Publish Report</a>
        <h1>New Report</h1>
        <span class="date"></span>
    </div>

    <div id="editor-wrap">
        <ul class="edit-blocks" id="editor">
            <li id="add-widget" data-row="1" data-col="1" data-sizex="1" data-sizey="1">
                <table><tr><td>
                    <span class="add"></span>
                </td></tr></table>
            </li>
        </ul>
    </div>

    <div class="footer">
        <span class="copy">&copy; 2012 Likely Products</span>
        <a href="#" class="mail">validate@user10.com</a>
    </div>
    <!-- /Footer -->
</div>
<!-- /Main -->
</div>
<!-- /Wrap -->
</div>
<!-- /Content -->
</div>
<!-- /Wrapper -->

<script type="text/html" id="custom-tpl">
    <li class="widget">
        <table><tr><td>
            <span class="block-caption">Behind</span>
            <span class="area">Project schedule</span>
        </td></tr></table>
    </li>
</script>
<script type="text/html" id="image-tpl">
    <li class="widget with-image">
        <table><tr><td>
            <p>som text</p>
        </td></tr></table>
    </li>
</script>
<script type="text/html" id="list-tpl">
    <li class="widget with-list">
        <table><tr><td>
            <span class="area">Top traffic sources</span>
            <ul class="square">
                <li><span>Direct</span></li>
            </ul>
        </td></tr></table>
    </li>
</script>
<script type="text/html" id="quote-tpl">
    <li class="widget">
        <table><tr><td>
            <p>some text</p>
            <span class="area">John Doe, Beta tester</span>
        </td></tr></table>
    </li>
</script>
<script type="text/html" id="status-tpl">
    <li class="widget red">
        <table><tr><td>
            <span class="block-caption">Behind</span>
            <span class="area">Project schedule</span>
        </td></tr></table>
    </li>
</script>

</body>
</html>