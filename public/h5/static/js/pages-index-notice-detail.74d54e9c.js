(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-index-notice-detail"],{"05b9":function(t,e,n){"use strict";var i=n("4ea4");Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0,n("96cf");var a=i(n("1da1")),o=n("834e"),r=(i(n("5028")),{data:function(){return{announceDetail:{},id:void 0,loading:!0}},filters:{time:function(t){return t}},onLoad:function(t){this.id=t.id,this.getNotifyAnnounceView(t.id)},onShareAppMessage:function(){return{title:this.banner.title,path:"/pages/index/notice/detail?id=".concat(this.id)}},methods:{getNotifyAnnounceView:function(){var t=(0,a.default)(regeneratorRuntime.mark((function t(e){var n=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,(0,o.getAnnouce)({id:e}).then((function(t){n.loading=!1,n.announceDetail=t.data,uni.setNavigationBarTitle({title:t.data.title})})).catch((function(){n.loading=!1}));case 2:case"end":return t.stop()}}),t)})));function e(e){return t.apply(this,arguments)}return e}()}});e.default=r},"3d05":function(t,e,n){"use strict";n.r(e);var i=n("05b9"),a=n.n(i);for(var o in i)"default"!==o&&function(t){n.d(e,t,(function(){return i[t]}))}(o);e["default"]=a.a},"710a":function(t,e,n){"use strict";var i=n("d84a"),a=n.n(i);a.a},"829b":function(t,e,n){"use strict";n.d(e,"b",(function(){return a})),n.d(e,"c",(function(){return o})),n.d(e,"a",(function(){return i}));var i={gjImage:n("f1f1").default},a=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("v-uni-view",{staticClass:"gj-notice-detail"},[t.announceDetail.cover?n("v-uni-view",{staticClass:"banner"},[n("gj-image",{staticClass:"banner-img",attrs:{src:t.announceDetail.cover}}),n("v-uni-view",{staticClass:"banner-title in2line"},[t._v(t._s(t.announceDetail.title))])],1):t._e(),t.announceDetail.cover?t._e():n("v-uni-view",{staticClass:"banner-title"},[t._v(t._s(t.announceDetail.title))]),t.announceDetail.created_at?n("v-uni-view",{staticClass:"article-meta"},[n("v-uni-text",{staticClass:"article-author"},[t._v(t._s(t.announceDetail.author_name))]),n("v-uni-text",{staticClass:"article-text"},[t._v("发布于")]),n("v-uni-text",{staticClass:"article-time"},[t._v(t._s(t._f("time")(t.announceDetail.created_at)))])],1):t._e(),n("v-uni-view",{staticClass:"article-content"},[n("gjParser",{attrs:{"lazy-load":!0,html:t.announceDetail.content}})],1),t.announceDetail||t.loading?t._e():n("gj-empty",{attrs:{info:"暂无商城公告详情"}}),n("gjLoading",{attrs:{isFullScreen:!0,active:t.loading}})],1)},o=[]},"834e":function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.getCaptchas=a,e.getVerificationCodes=o,e.getArea=r,e.getAnnouces=c,e.getAnnouce=l,e.getSitehelps=u,e.getSitehelp=d,e.uploadImage=s;var i=n("dc40");function a(){return i.http.post("/captchas")}function o(t){return i.http.put("/verificationCodes",t)}function r(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.get("/comm/getArea",t)}function c(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.get("/annouces",t)}function l(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.get("/annouces/"+t.id,t)}function u(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.get("/sitehelps",t)}function d(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.get("/sitehelps/"+t.id,t)}function s(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.upload("/upload",t)}},a82a:function(t,e,n){"use strict";n.r(e);var i=n("829b"),a=n("3d05");for(var o in a)"default"!==o&&function(t){n.d(e,t,(function(){return a[t]}))}(o);n("710a");var r,c=n("f0c5"),l=Object(c["a"])(a["default"],i["b"],i["c"],!1,null,"5efed684",null,!1,i["a"],r);e["default"]=l.exports},d84a:function(t,e,n){var i=n("e42c");"string"===typeof i&&(i=[[t.i,i,""]]),i.locals&&(t.exports=i.locals);var a=n("4f06").default;a("16ae5ca4",i,!0,{sourceMap:!1,shadowMode:!1})},e42c:function(t,e,n){var i=n("24fb");e=i(!1),e.push([t.i,".gj-notice-detail .banner[data-v-5efed684]{overflow:hidden;position:relative;background-color:#ccc}.gj-notice-detail .banner .banner-img[data-v-5efed684]{height:%?300?%;width:100%}.gj-notice-detail .banner .banner-title[data-v-5efed684]{max-height:%?84?%;overflow:hidden;position:absolute;bottom:0;width:100%;font-size:%?32?%;font-weight:400;line-height:%?42?%;color:#fff;z-index:11;background-color:rgba(0,0,0,.25);padding:%?4?% %?20?%}.gj-notice-detail .banner-title[data-v-5efed684]{padding:%?30?% %?30?% 0;font-size:%?32?%}.gj-notice-detail .article-meta[data-v-5efed684]{padding:%?20?% %?40?%;display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;flex-direction:row;-webkit-box-pack:start;-webkit-justify-content:flex-start;justify-content:flex-start;color:grey}.gj-notice-detail .article-meta .article-text[data-v-5efed684]{font-size:%?26?%;line-height:%?50?%;margin:0 %?20?%}.gj-notice-detail .article-meta .article-author[data-v-5efed684],.gj-notice-detail .article-meta .article-time[data-v-5efed684]{font-size:%?30?%}.gj-notice-detail .article-content[data-v-5efed684]{padding:0 %?30?%;overflow:hidden;font-size:%?30?%;margin-bottom:%?30?%}",""]),t.exports=e}}]);