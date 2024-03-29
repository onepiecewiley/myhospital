/*! 2016 Baidu Inc. All Rights Reserved */
define("common/js/loading", ["require"], function (require) {
    function e(e) {
        this.content = e.content
    }

    return e.prototype = {
        init: function () {
            this.resize(this.render())
        }, view: function () {
            var e = "";
            e += '<div class="zooming normal-pop">', e += '<div class="zooming-con">', e += '<div class="zooming-content">', e += "" + this.content, e += "</div>", e += "</div>", e += "</div>", e += '<div class="marsk normal-pop" ></div>';
            var t = $(e);
            return t
        }, resize: function (e) {
            var t = $(window).width(), n = $(window).height(), i = e.filter(".zooming").width(),
                r = e.filter(".zooming").height(), o = (n - r) / 2, a = (t - i) / 2;
            e.filter(".zooming").css({top: o, left: a})
        }, remove: function () {
            $(".normal-pop").remove()
        }, render: function () {
            return this.view().appendTo($("body"))
        }
    }, e
}), define("common/js/ajax", ["require", "common/js/loading"], function (require) {
    return function (e) {
        var t = e.url, n = e.type || "get", i = e.data || {}, r = e.dataType || "json", o = !e.sync, a = e.success,
            s = e.error, u = $("#header").data("paramdata");
        if (!t) alert("url cannot be null.");
        if (u) for (var l in u) if (!i[l]) i[l] = u[l];
        if (!i.seed) i.seed = "seed_" + +new Date;
        var c = require("common/js/loading"),
            f = new c({content: '<i class="fa fa-spinner" style="font-size:30px"></i>'});
        f.init(), $.ajax({
            url: t, type: n, dataType: r, data: i, async: o, success: function (e) {
                if (a) a(e)
            }, complete: function () {
                f.remove()
            }, error: function (e, t, n) {
                if (f.remove(), s) s(e.status);
                if (0 != e.status && 12007 != e.status && 12029 != e.status) if (499 != e.status) if (404 == e.status) ; else if (401 == e.status) {
                    var i = errorUserMessage.status;
                    if (0 == i) ; else ;
                } else if (500 == e.status) ; else if ("parsererror" == t) ; else if ("timeout" == t) ; else if (498 != e.status) ; else if ("undefined" == typeof n) ; else ;
            }, beforeSend: function () {
            }
        })
    }
});