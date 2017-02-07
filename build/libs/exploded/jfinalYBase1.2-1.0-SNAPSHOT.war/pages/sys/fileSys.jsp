<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/pages/include/pageNavigation.jsp"/>

<style type="text/css">#ckfinder {
    margin: 0;
    padding: 0;
    border: 0;
    width: 100%;
    height: 1000px;
    overflow: hidden;
}</style>
<!-- start: MAIN CONTAINER -->
<div class="main-container inner">
    <!-- start: PAGE -->
    <div class="main-content">
        <div class="container">
            <!-- start: PAGE HEADER -->
            <!-- start: TOOLBAR -->
            <div class="toolbar row">
                <div class="col-sm-6 hidden-xs">
                    <div class="page-center">
                        <h1>文件管理</h1>
                    </div>
                </div>
            </div>
            <!-- end: TOOLBAR -->
            <!-- end: PAGE HEADER -->
            <div class="panel-body ">
                <div id="ckfinder"></div>
            </div>
        </div>
    </div>
</div>
<!-- block -->
<c:import url="/pages/include/pageFoot.jsp"/>
<script type="text/javascript">
    //<![CDATA[
    (function () {
        var config = {};
        var get = CKFinder.tools.getUrlParam;
        var getBool = function (v) {
            var t = get(v);

            if (t === null)
                return null;

            return t == '0' ? false : true;
        };

        var tmp;
        if (tmp = get('configId')) {
            var win = window.opener || window;
            try {
                while (( !win.CKFinder || !win.CKFinder._.instanceConfig[tmp] ) && win != window.top)
                    win = win.parent;

                if (win.CKFinder._.instanceConfig[tmp])
                    config = CKFINDER.tools.extend({}, win.CKFinder._.instanceConfig[tmp]);
            }
            catch (e) {
            }
        }

        if (tmp = get('basePath'))
            CKFINDER.basePath = tmp;

        if (tmp = get('startupPath') || get('start'))
            config.startupPath = decodeURIComponent(tmp);

        config.id = get('id') || '';

        if (( tmp = getBool('rlf') ) !== null)
            config.rememberLastFolder = tmp;

        if (( tmp = getBool('dts') ) !== null)
            config.disableThumbnailSelection = tmp;

        if (( tmp = getBool('sm') ) !== null)
            config.selectMultiple = tmp;

        if (tmp = get('data'))
            config.selectActionData = tmp;

        if (tmp = get('tdata'))
            config.selectThumbnailActionData = tmp;

        if (tmp = get('type'))
            config.resourceType = tmp;

        if (tmp = get('skin'))
            config.skin = tmp;

        if (tmp = get('langCode'))
            config.language = tmp;

        if (typeof( config.selectActionFunction ) == 'undefined') {
            // Try to get desired "File Select" action from the URL.
            var action;
            if (tmp = get('CKEditor')) {
                if (tmp.length)
                    action = 'ckeditor';
            }
            if (!action)
                action = get('action');

            var parentWindow = ( window.parent == window ) ? window.opener : window.parent;
            if (!parentWindow) parentWindow = window.parent.document;

            if (tmp = get('pwMf'))
                parentWindow = parentWindow.mainFrame;

            switch (action) {
                case 'js':
                    var actionFunction = get('func');
                    if (actionFunction && actionFunction.length > 0)
                        config.selectActionFunction = parentWindow[actionFunction];

                    actionFunction = get('thumbFunc');
                    if (actionFunction && actionFunction.length > 0)
                        config.selectThumbnailActionFunction = parentWindow[actionFunction];
                    break;

                case 'ckeditor':
                    var funcNum = get('CKEditorFuncNum');
                    if (parentWindow['CKEDITOR']) {
                        config.selectActionFunction = function (fileUrl, data) {
                            parentWindow['CKEDITOR'].tools.callFunction(funcNum, fileUrl, data);
                        };

                        config.selectThumbnailActionFunction = config.selectActionFunction;
                    }
                    break;

                default:
                    if (parentWindow && parentWindow['FCK'] && parentWindow['SetUrl']) {
                        action = 'fckeditor';
                        config.selectActionFunction = parentWindow['SetUrl'];

                        if (!config.disableThumbnailSelection)
                            config.selectThumbnailActionFunction = parentWindow['SetUrl'];
                    }
                    else
                        action = null;
            }
            config.action = action;

            var callback = get('cb');
            if (callback && callback.length > 0)
                config.callback = parentWindow[callback];

        }

        // Always use 100% width and height when nested using this middle page.
        config.width = config.height = '100%';

        var ckfinder = new CKFinder(config);
        ckfinder.replace('ckfinder', config);

    })();
    //]]>
</script>

