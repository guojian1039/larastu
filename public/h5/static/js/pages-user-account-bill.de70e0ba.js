(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-user-account-bill"],{"1c94":function(t,e,i){var a=i("24fb");e=a(!1),e.push([t.i,".gj-load-more[data-v-23b2d473]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;flex-direction:row;height:%?80?%;-webkit-box-align:center;-webkit-align-items:center;align-items:center;-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center\n\t/*position: fixed;*/\n\t/*bottom: 5upx;*/\n\t/*text-align: center;*/}.gj-load-more__text[data-v-23b2d473]{font-size:%?28?%;color:#999}.gj-load-more__img[data-v-23b2d473]{height:24px;width:24px;margin-right:10px}.gj-load-more__img > uni-view[data-v-23b2d473]{position:absolute}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]{width:6px;height:2px;border-top-left-radius:1px;border-bottom-left-radius:1px;background:#999;position:absolute;opacity:.2;-webkit-transform-origin:50%;transform-origin:50%;-webkit-animation:load-data-v-23b2d473 1.56s ease infinite;animation:load-data-v-23b2d473 1.56s ease infinite}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]:nth-child(1){-webkit-transform:rotate(90deg);transform:rotate(90deg);top:2px;left:9px}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]:nth-child(2){-webkit-transform:rotate(180deg);transform:rotate(180deg);top:11px;right:0}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]:nth-child(3){-webkit-transform:rotate(270deg);transform:rotate(270deg);bottom:2px;left:9px}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]:nth-child(4){top:11px;left:0}.load1[data-v-23b2d473],\n.load2[data-v-23b2d473],\n.load3[data-v-23b2d473]{height:24px;width:24px}.load2[data-v-23b2d473]{-webkit-transform:rotate(30deg);transform:rotate(30deg)}.load3[data-v-23b2d473]{-webkit-transform:rotate(60deg);transform:rotate(60deg)}.load1 uni-view[data-v-23b2d473]:nth-child(1){-webkit-animation-delay:0s;animation-delay:0s}.load2 uni-view[data-v-23b2d473]:nth-child(1){-webkit-animation-delay:.13s;animation-delay:.13s}.load3 uni-view[data-v-23b2d473]:nth-child(1){-webkit-animation-delay:.26s;animation-delay:.26s}.load1 uni-view[data-v-23b2d473]:nth-child(2){-webkit-animation-delay:.39s;animation-delay:.39s}.load2 uni-view[data-v-23b2d473]:nth-child(2){-webkit-animation-delay:.52s;animation-delay:.52s}.load3 uni-view[data-v-23b2d473]:nth-child(2){-webkit-animation-delay:.65s;animation-delay:.65s}.load1 uni-view[data-v-23b2d473]:nth-child(3){-webkit-animation-delay:.78s;animation-delay:.78s}.load2 uni-view[data-v-23b2d473]:nth-child(3){-webkit-animation-delay:.91s;animation-delay:.91s}.load3 uni-view[data-v-23b2d473]:nth-child(3){-webkit-animation-delay:1.04s;animation-delay:1.04s}.load1 uni-view[data-v-23b2d473]:nth-child(4){-webkit-animation-delay:1.17s;animation-delay:1.17s}.load2 uni-view[data-v-23b2d473]:nth-child(4){-webkit-animation-delay:1.3s;animation-delay:1.3s}.load3 uni-view[data-v-23b2d473]:nth-child(4){-webkit-animation-delay:1.43s;animation-delay:1.43s}@-webkit-keyframes load-data-v-23b2d473{0%{opacity:1}100%{opacity:.2}}",""]),t.exports=e},"23b2":function(t,e,i){"use strict";i.r(e);var a=i("8e79"),n=i.n(a);for(var o in a)"default"!==o&&function(t){i.d(e,t,(function(){return a[t]}))}(o);e["default"]=n.a},2909:function(t,e,i){"use strict";function a(t,e){(null==e||e>t.length)&&(e=t.length);for(var i=0,a=new Array(e);i<e;i++)a[i]=t[i];return a}function n(t){if(Array.isArray(t))return a(t)}function o(t){if("undefined"!==typeof Symbol&&Symbol.iterator in Object(t))return Array.from(t)}function r(t,e){if(t){if("string"===typeof t)return a(t,e);var i=Object.prototype.toString.call(t).slice(8,-1);return"Object"===i&&t.constructor&&(i=t.constructor.name),"Map"===i||"Set"===i?Array.from(t):"Arguments"===i||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(i)?a(t,e):void 0}}function l(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}function d(t){return n(t)||o(t)||r(t)||l()}i.r(e),i.d(e,"default",(function(){return d}))},"342d":function(t,e,i){"use strict";i.d(e,"b",(function(){return n})),i.d(e,"c",(function(){return o})),i.d(e,"a",(function(){return a}));var a={gjLoadMore:i("d189").default},n=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-uni-view",{staticClass:"account-bill"},[i("v-uni-view",{staticClass:"navbar"},t._l(t.billTypeList,(function(e,a){return i("v-uni-view",{key:a,staticClass:"nav-item",class:t.tabCurrentIndex===a?"text-"+t.themeColor.name+" current":"",on:{click:function(i){arguments[0]=i=t.$handleEvent(i),t.tabClick(a,e.state)}}},[t._v(t._s(e.text))])})),1),t.integralList.length>0?i("v-uni-view",{staticClass:"gj-bill-list"},[t._l(t.integralList,(function(e,a){return i("v-uni-view",{key:a,staticClass:"gj-list-item"},[i("v-uni-view",{staticClass:"mid"},[i("v-uni-view",{staticClass:"title"},[t._v(t._s(e.account_type))]),i("v-uni-view",{staticClass:"time"},[t._v(t._s(t._f("time")(e.created_at)))])],1),i("v-uni-view",{staticClass:"right"},[i("v-uni-text",{staticClass:"change-num",class:parseFloat(e.amount)>=0?"change-num-add":"change-num-reduce"},[t._v(t._s(t._f("numFilter")(e.amount)))])],1)],1)})),t.integralList.length>0?i("gj-load-more",{staticClass:"load-more",attrs:{status:t.loadingType}}):t._e()],2):t._e(),0!==t.integralList.length||t.loading?t._e():i("gj-empty",{attrs:{info:"暂无账单记录"}}),i("gjLoading",{attrs:{isFullScreen:!0,active:t.loading}})],1)},o=[]},"5ed5":function(t,e,i){"use strict";i.r(e);var a=i("aba7"),n=i.n(a);for(var o in a)"default"!==o&&function(t){i.d(e,t,(function(){return a[t]}))}(o);e["default"]=n.a},"62cd":function(t,e,i){"use strict";var a=i("bdfd"),n=i.n(a);n.a},8439:function(t,e,i){"use strict";i.r(e);var a=i("342d"),n=i("5ed5");for(var o in n)"default"!==o&&function(t){i.d(e,t,(function(){return n[t]}))}(o);i("62cd");var r,l=i("f0c5"),d=Object(l["a"])(n["default"],a["b"],a["c"],!1,null,"d711e9f4",null,!1,a["a"],r);e["default"]=d.exports},"8e79":function(t,e,i){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var a={name:"gj-load-more",props:{status:{type:String,default:"more"},width:{type:String,default:"100vw"},showIcon:{type:Boolean,default:!0},color:{type:String,default:"#777777"},contentText:{type:Object,default:function(){return{}}}},data:function(){return{}}};e.default=a},"9dfe":function(t,e,i){var a=i("1c94");"string"===typeof a&&(a=[[t.i,a,""]]),a.locals&&(t.exports=a.locals);var n=i("4f06").default;n("9208cb30",a,!0,{sourceMap:!1,shadowMode:!1})},a12f:function(t,e,i){"use strict";var a=i("9dfe"),n=i.n(a);n.a},a2e3:function(t,e,i){"use strict";var a;i.d(e,"b",(function(){return n})),i.d(e,"c",(function(){return o})),i.d(e,"a",(function(){return a}));var n=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("v-uni-view",{staticClass:"load-more",style:{width:t.width}},["loading"===t.status&&t.showIcon?i("v-uni-view",{staticClass:"gj-load-more__img"},[i("v-uni-view",{staticClass:"load1"},[i("v-uni-view",{style:{background:t.color}}),i("v-uni-view",{style:{background:t.color}}),i("v-uni-view",{style:{background:t.color}}),i("v-uni-view",{style:{background:t.color}})],1),i("v-uni-view",{staticClass:"load2"},[i("v-uni-view",{style:{background:t.color}}),i("v-uni-view",{style:{background:t.color}}),i("v-uni-view",{style:{background:t.color}}),i("v-uni-view",{style:{background:t.color}})],1),i("v-uni-view",{staticClass:"load3"},[i("v-uni-view",{style:{background:t.color}}),i("v-uni-view",{style:{background:t.color}}),i("v-uni-view",{style:{background:t.color}}),i("v-uni-view",{style:{background:t.color}})],1)],1):t._e(),i("v-uni-view",{staticClass:"cu-load",class:"more"===t.status?"loading":"over"})],1)},o=[]},aba7:function(t,e,i){"use strict";var a=i("4ea4");Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0,i("8e6e"),i("ac6a"),i("456d");var n=a(i("2909")),o=a(i("ade3"));i("96cf");var r=a(i("1da1"));i("6b54");var l=i("c24f"),d=a(i("d189"));a(i("5028"));function s(t,e){var i=Object.keys(t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(t);e&&(a=a.filter((function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable}))),i.push.apply(i,a)}return i}function c(t){for(var e=1;e<arguments.length;e++){var i=null!=arguments[e]?arguments[e]:{};e%2?s(Object(i),!0).forEach((function(e){(0,o.default)(t,e,i[e])})):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(i)):s(Object(i)).forEach((function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(i,e))}))}return t}var u={components:{gjLoadMore:d.default},data:function(){return{loading:!0,typeClass:"valid",state:1,tabCurrentIndex:0,billTypeList:[{state:1,text:"全部"},{state:2,text:"充值"},{state:3,text:"消费"}],integralList:[],loadingType:"more",page:1}},filters:{time:function(t){return t},numFilter:function(t){return t>=0?"+".concat(t.toString()):t}},onPullDownRefresh:function(){this.page=1,this.integralList=[],this.getIntegralListList("refresh")},onReachBottom:function(){"nomore"!==this.loadingType&&(this.page++,this.getIntegralListList())},onLoad:function(t){this.initData(t)},methods:{tabClick:function(t,e){this.page=1,this.integralList.length=0,this.loading=!0,this.tabCurrentIndex=t,this.state=e,this.getIntegralListList()},initData:function(t){this.state=parseInt(t.state,10),2!==this.state?3!==this.state?this.getIntegralListList():this.tabClick(2,3):this.tabClick(1,2)},getIntegralListList:function(){var t=(0,r.default)(regeneratorRuntime.mark((function t(e){var i,a=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return i={},i.credit_type=0,2===this.state?i.credit_type=1:3===this.state&&(i.credit_type=2),i.page=this.page,t.next=6,(0,l.bills)(c({},i)).then((function(t){a.loading=!1,"refresh"===e&&uni.stopPullDownRefresh(),console.log(t.data.data),a.loadingType=t.data.meta.current_page<t.data.meta.last_page?"more":"nomore",a.integralList=[].concat((0,n.default)(a.integralList),(0,n.default)(t.data.data))})).catch((function(){a.loading=!1,"refresh"===e&&uni.stopPullDownRefresh()}));case 6:case"end":return t.stop()}}),t,this)})));function e(e){return t.apply(this,arguments)}return e}()}};e.default=u},bc8c:function(t,e,i){var a=i("24fb");e=a(!1),e.push([t.i,"uni-page-body[data-v-d711e9f4]{background-color:#f8f8f8}.account-bill .gj-bill-list .gj-list-item[data-v-d711e9f4]{background-color:#fff;padding:%?20?% %?30?%;border:%?1?% solid rgba(0,0,0,.02);display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-pack:justify;-webkit-justify-content:space-between;justify-content:space-between;-webkit-box-align:center;-webkit-align-items:center;align-items:center}.account-bill .gj-bill-list .gj-list-item .mid[data-v-d711e9f4]{text-align:left}.account-bill .gj-bill-list .gj-list-item .mid .title[data-v-d711e9f4]{margin-top:%?10?%;font-size:%?30?%;color:#303133}.account-bill .gj-bill-list .gj-list-item .mid .time[data-v-d711e9f4]{margin-top:%?10?%;font-size:%?28?%;margin-left:%?10?%;color:#909399}.account-bill .gj-bill-list .gj-list-item .right .change-num[data-v-d711e9f4]{font-size:%?36?%;color:#606266}.account-bill .gj-bill-list .gj-list-item .right .change-num-add[data-v-d711e9f4]{color:#16ac57}.account-bill .gj-bill-list .gj-list-item .right .change-num-reduce[data-v-d711e9f4]{color:#fc4141}body.?%PAGE?%[data-v-d711e9f4]{background-color:#f8f8f8}",""]),t.exports=e},bdfd:function(t,e,i){var a=i("bc8c");"string"===typeof a&&(a=[[t.i,a,""]]),a.locals&&(t.exports=a.locals);var n=i("4f06").default;n("2b8f6a12",a,!0,{sourceMap:!1,shadowMode:!1})},d189:function(t,e,i){"use strict";i.r(e);var a=i("a2e3"),n=i("23b2");for(var o in n)"default"!==o&&function(t){i.d(e,t,(function(){return n[t]}))}(o);i("a12f");var r,l=i("f0c5"),d=Object(l["a"])(n["default"],a["b"],a["c"],!1,null,"23b2d473",null,!1,a["a"],r);e["default"]=d.exports}}]);