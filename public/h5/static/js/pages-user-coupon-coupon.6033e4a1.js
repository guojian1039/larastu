(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-user-coupon-coupon"],{"02b4":function(t,e,a){"use strict";var i=a("28f1"),n=a.n(i);n.a},"0375":function(t,e,a){"use strict";a.d(e,"b",(function(){return n})),a.d(e,"c",(function(){return o})),a.d(e,"a",(function(){return i}));var i={gjLoadMore:a("d189").default,uniDrawer:a("6e16").default},n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("v-uni-view",{staticClass:"my-coupon"},[a("v-uni-view",[a("v-uni-view",{staticClass:"tabr",style:{top:t.headerTop}},[a("v-uni-view",{class:"valid"==t.typeClass?"text-"+t.themeColor.name+" on":"",on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.switchType("valid",1)}}},[t._v("可用"),1===t.state?a("v-uni-text",[t._v("("+t._s(t.couponList.length)+")")]):t._e()],1),a("v-uni-view",{class:"used"==t.typeClass?"text-"+t.themeColor.name+" on":"",on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.switchType("used",2)}}},[t._v("已使用"),2===t.state?a("v-uni-text",[t._v("("+t._s(t.couponList.length)+")")]):t._e()],1),a("v-uni-view",{class:"invalid"==t.typeClass?"text-"+t.themeColor.name+" on":"",on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.switchType("invalid",3)}}},[t._v("已失效"),3===t.state?a("v-uni-text",[t._v("("+t._s(t.couponList.length)+")")]):t._e()],1),a("v-uni-view",{staticClass:"border",class:[t.typeClass,"bg-"+t.themeColor.name]})],1),a("v-uni-view",{staticClass:"place"}),a("v-uni-view",{staticClass:"coupon-list"},[3===t.state&&t.couponList.length>0&&!t.loading?a("v-uni-view",{staticClass:"empty-invalid",class:"text-"+t.themeColor.name,on:{click:function(e){e.stopPropagation(),arguments[0]=e=t.$handleEvent(e),t.emptyInvalidCoupon.apply(void 0,arguments)}}},[t._v("清空失效优惠券")]):t._e(),a("v-uni-view",{staticClass:"sub-list valid",style:{marginTop:3===t.state?"50upx":0}},t._l(t.couponList,(function(e,i){return a("v-uni-view",{key:i,staticClass:"row"},[a("v-uni-view",{staticClass:"carrier"},[a("v-uni-view",{staticClass:"left"},[a("v-uni-view",{staticClass:"in1line title"},[a("v-uni-text",{staticClass:"cell-icon",class:"bg-"+t.themeColor.name},[t._v(t._s(2===parseInt(e.coupon_type.range_type,10)?"限":"全"))]),t._v(t._s(e.coupon_type.title))],1),2!==t.state?a("v-uni-view",{staticClass:"term"},[1==e.coupon_type.term_of_validity_type?a("v-uni-text",[t._v(t._s(t._f("time")(e.start_time))+" ~ "+t._s(t._f("time")(e.end_time)))]):a("v-uni-text",[t._v(t._s(t._f("time")(e.coupon_type.start_time))+" ~ "+t._s(t._f("time")(e.coupon_type.end_time)))])],1):a("v-uni-view",{staticClass:"term"},[t._v("使用时间："+t._s(t._f("timeFull")(e.use_time)))]),3===t.state?a("v-uni-view",{staticClass:"overdue"},[a("v-uni-text",{staticClass:"iconfont iconyiguoqi2",class:"text-"+t.themeColor.name})],1):t._e(),2===t.state?a("v-uni-view",{staticClass:"overdue"},[a("v-uni-text",{staticClass:"iconfont iconyishiyong"})],1):t._e(),a("v-uni-view",{staticClass:"usage"},[t._v(t._s(0===parseInt(e.coupon_type.max_fetch,10)?"不限":"每人限领"+e.coupon_type.max_fetch)+"\n\t\t\t\t\t\t\t\t\t总共"+t._s(e.coupon_type.count)),a("v-uni-text",[t._v("剩余"+t._s(e.coupon_type.get_count))])],1)],1),a("v-uni-view",{staticClass:"right",class:1!==t.state?"invalid":"bg-"+t.themeColor.name},[a("v-uni-view",{staticClass:"ticket"},[a("v-uni-view",{staticClass:"num"},[t._v(t._s(1===e.coupon_type.type?t.moneySymbol+e.coupon_type.value:e.coupon_type.value/10+"折"))])],1),a("v-uni-view",{staticClass:"criteria"},[t._v("满"+t._s(e.coupon_type.at_least)+"使用")]),2===parseInt(e.coupon_type.range_type,10)?a("v-uni-view",{staticClass:"use view",class:"text-"+t.themeColor.name,on:{click:function(a){arguments[0]=a=t.$handleEvent(a),t.show(e.coupon_type)}}},[t._v("商品")]):t._e(),1==t.state?a("v-uni-view",{staticClass:"use",class:"text-"+t.themeColor.name,on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.navTo("/pages/product/list")}}},[t._v("去使用")]):t._e(),2==t.state?a("v-uni-view",{staticClass:"use",class:"text-"+t.themeColor.name,on:{click:function(a){arguments[0]=a=t.$handleEvent(a),t.navTo("/pages/order/detail?id="+e.use_order_id)}}},[t._v("去查看")]):t._e()],1)],1)],1)})),1),t.couponList.length>0?a("gj-load-more",{attrs:{status:t.loadingType}}):t._e()],1)],1),0!==t.couponList.length||t.loading?t._e():a("gj-empty",{staticClass:"empty",attrs:{info:"暂无优惠券"}}),a("uni-drawer",{staticClass:"gj-drawer",attrs:{visible:t.showRight,mode:"right"},on:{close:function(e){arguments[0]=e=t.$handleEvent(e),t.closeDrawer()}}},[a("v-uni-view",{staticClass:"gj-drawer-title",class:"text-"+t.themeColor.name},[t._v("可用商品列表")]),a("v-uni-view",{staticClass:"gj-drawer-list"},t._l(t.currentCoupon.product,(function(e){return a("v-uni-view",{key:e.id,staticClass:"gj-drawer-item",on:{click:function(a){arguments[0]=a=t.$handleEvent(a),t.navTo("/pages/product/product?id="+e.id)}}},[a("v-uni-view",{staticClass:"left"},[a("v-uni-view",{staticClass:"title"},[t._v(t._s(e.title))]),a("v-uni-view",{staticClass:"desc in2line"},[t._v(t._s(e.description))])],1),a("v-uni-text",{staticClass:"iconfont iconyou"})],1)})),1),a("v-uni-view",{staticClass:"close"},[a("v-uni-view",{staticClass:"btn",class:"bg-"+t.themeColor.name,attrs:{plain:"true",size:"small",type:"primary"},on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.hide.apply(void 0,arguments)}}},[t._v("关闭")])],1)],1),a("gjLoading",{attrs:{isFullScreen:!0,active:t.loading}})],1)},o=[]},"1c94":function(t,e,a){var i=a("24fb");e=i(!1),e.push([t.i,".gj-load-more[data-v-23b2d473]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;flex-direction:row;height:%?80?%;-webkit-box-align:center;-webkit-align-items:center;align-items:center;-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center\n\t/*position: fixed;*/\n\t/*bottom: 5upx;*/\n\t/*text-align: center;*/}.gj-load-more__text[data-v-23b2d473]{font-size:%?28?%;color:#999}.gj-load-more__img[data-v-23b2d473]{height:24px;width:24px;margin-right:10px}.gj-load-more__img > uni-view[data-v-23b2d473]{position:absolute}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]{width:6px;height:2px;border-top-left-radius:1px;border-bottom-left-radius:1px;background:#999;position:absolute;opacity:.2;-webkit-transform-origin:50%;transform-origin:50%;-webkit-animation:load-data-v-23b2d473 1.56s ease infinite;animation:load-data-v-23b2d473 1.56s ease infinite}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]:nth-child(1){-webkit-transform:rotate(90deg);transform:rotate(90deg);top:2px;left:9px}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]:nth-child(2){-webkit-transform:rotate(180deg);transform:rotate(180deg);top:11px;right:0}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]:nth-child(3){-webkit-transform:rotate(270deg);transform:rotate(270deg);bottom:2px;left:9px}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]:nth-child(4){top:11px;left:0}.load1[data-v-23b2d473],\n.load2[data-v-23b2d473],\n.load3[data-v-23b2d473]{height:24px;width:24px}.load2[data-v-23b2d473]{-webkit-transform:rotate(30deg);transform:rotate(30deg)}.load3[data-v-23b2d473]{-webkit-transform:rotate(60deg);transform:rotate(60deg)}.load1 uni-view[data-v-23b2d473]:nth-child(1){-webkit-animation-delay:0s;animation-delay:0s}.load2 uni-view[data-v-23b2d473]:nth-child(1){-webkit-animation-delay:.13s;animation-delay:.13s}.load3 uni-view[data-v-23b2d473]:nth-child(1){-webkit-animation-delay:.26s;animation-delay:.26s}.load1 uni-view[data-v-23b2d473]:nth-child(2){-webkit-animation-delay:.39s;animation-delay:.39s}.load2 uni-view[data-v-23b2d473]:nth-child(2){-webkit-animation-delay:.52s;animation-delay:.52s}.load3 uni-view[data-v-23b2d473]:nth-child(2){-webkit-animation-delay:.65s;animation-delay:.65s}.load1 uni-view[data-v-23b2d473]:nth-child(3){-webkit-animation-delay:.78s;animation-delay:.78s}.load2 uni-view[data-v-23b2d473]:nth-child(3){-webkit-animation-delay:.91s;animation-delay:.91s}.load3 uni-view[data-v-23b2d473]:nth-child(3){-webkit-animation-delay:1.04s;animation-delay:1.04s}.load1 uni-view[data-v-23b2d473]:nth-child(4){-webkit-animation-delay:1.17s;animation-delay:1.17s}.load2 uni-view[data-v-23b2d473]:nth-child(4){-webkit-animation-delay:1.3s;animation-delay:1.3s}.load3 uni-view[data-v-23b2d473]:nth-child(4){-webkit-animation-delay:1.43s;animation-delay:1.43s}@-webkit-keyframes load-data-v-23b2d473{0%{opacity:1}100%{opacity:.2}}",""]),t.exports=e},"23b2":function(t,e,a){"use strict";a.r(e);var i=a("8e79"),n=a.n(i);for(var o in i)"default"!==o&&function(t){a.d(e,t,(function(){return i[t]}))}(o);e["default"]=n.a},"28f1":function(t,e,a){var i=a("b9a2");"string"===typeof i&&(i=[[t.i,i,""]]),i.locals&&(t.exports=i.locals);var n=a("4f06").default;n("403820ba",i,!0,{sourceMap:!1,shadowMode:!1})},2909:function(t,e,a){"use strict";function i(t,e){(null==e||e>t.length)&&(e=t.length);for(var a=0,i=new Array(e);a<e;a++)i[a]=t[a];return i}function n(t){if(Array.isArray(t))return i(t)}function o(t){if("undefined"!==typeof Symbol&&Symbol.iterator in Object(t))return Array.from(t)}function r(t,e){if(t){if("string"===typeof t)return i(t,e);var a=Object.prototype.toString.call(t).slice(8,-1);return"Object"===a&&t.constructor&&(a=t.constructor.name),"Map"===a||"Set"===a?Array.from(t):"Arguments"===a||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(a)?i(t,e):void 0}}function s(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}function l(t){return n(t)||o(t)||r(t)||s()}a.r(e),a.d(e,"default",(function(){return l}))},"340f":function(t,e,a){"use strict";a.r(e);var i=a("ad8a"),n=a.n(i);for(var o in i)"default"!==o&&function(t){a.d(e,t,(function(){return i[t]}))}(o);e["default"]=n.a},"3fc5":function(t,e,a){var i=a("24fb");e=i(!1),e.push([t.i,"uni-view[data-v-1938cfa2]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-flex-wrap:wrap;flex-wrap:wrap}uni-page-body[data-v-1938cfa2]{position:relative;background-color:#f8f8f8}.my-coupon .place[data-v-1938cfa2]{width:100%;height:%?95?%}.my-coupon .tabr[data-v-1938cfa2]{background-color:#fff;width:100%;height:%?95?%;padding:0 3%;border-bottom:solid %?1?% #dedede;position:fixed;top:0;z-index:10}.my-coupon .tabr uni-view[data-v-1938cfa2]{width:33.3%;height:%?90?%;-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center;-webkit-box-align:center;-webkit-align-items:center;align-items:center;font-size:%?32?%}.my-coupon .tabr .border[data-v-1938cfa2]{height:%?4?%}.my-coupon .tabr .border.used[data-v-1938cfa2]{-webkit-transform:translate3d(100%,0,0);transform:translate3d(100%,0,0)}.my-coupon .tabr .border.invalid[data-v-1938cfa2]{-webkit-transform:translate3d(200%,0,0);transform:translate3d(200%,0,0)}.coupon-list[data-v-1938cfa2]{width:100%;display:block;position:relative}.coupon-list .empty-invalid[data-v-1938cfa2]{position:absolute;right:%?20?%;top:%?10?%;font-size:%?28?%}@-webkit-keyframes showValid-data-v-1938cfa2{0%{-webkit-transform:translateX(-100%);transform:translateX(-100%)}100%{-webkit-transform:translateX(0);transform:translateX(0)}}@keyframes showValid-data-v-1938cfa2{0%{-webkit-transform:translateX(-100%);transform:translateX(-100%)}100%{-webkit-transform:translateX(0);transform:translateX(0)}}@-webkit-keyframes showInvalid-data-v-1938cfa2{0%{-webkit-transform:translateX(0);transform:translateX(0)}100%{-webkit-transform:translateX(-100%);transform:translateX(-100%)}}@keyframes showInvalid-data-v-1938cfa2{0%{-webkit-transform:translateX(0);transform:translateX(0)}100%{-webkit-transform:translateX(-100%);transform:translateX(-100%)}}.sub-list[data-v-1938cfa2]{width:100%}.sub-list.invalid[data-v-1938cfa2]{position:absolute;top:0;left:100%;display:none}.sub-list.showvalid[data-v-1938cfa2]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-animation:showValid-data-v-1938cfa2 .2s linear both;animation:showValid-data-v-1938cfa2 .2s linear both}.sub-list.showinvalid[data-v-1938cfa2]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-animation:showInvalid-data-v-1938cfa2 .2s linear both;animation:showInvalid-data-v-1938cfa2 .2s linear both}.sub-list .tis[data-v-1938cfa2]{width:100%;height:%?60?%;-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center;-webkit-box-align:center;-webkit-align-items:center;align-items:center;font-size:%?32?%}.sub-list .row[data-v-1938cfa2]{width:92%;height:24vw;margin:%?20?% auto %?10?% auto;border-radius:%?8?%;-webkit-box-align:center;-webkit-align-items:center;align-items:center;position:relative;overflow:hidden;z-index:4;border:0}.sub-list .row .carrier[data-v-1938cfa2]{background-color:#fff;position:absolute;width:100%;padding:0 0;height:100%;z-index:3;-webkit-flex-wrap:nowrap;flex-wrap:nowrap}@-webkit-keyframes showMenu-data-v-1938cfa2{0%{-webkit-transform:translateX(0);transform:translateX(0)}100%{-webkit-transform:translateX(-28%);transform:translateX(-28%)}}@keyframes showMenu-data-v-1938cfa2{0%{-webkit-transform:translateX(0);transform:translateX(0)}100%{-webkit-transform:translateX(-28%);transform:translateX(-28%)}}@-webkit-keyframes closeMenu-data-v-1938cfa2{0%{-webkit-transform:translateX(-28%);transform:translateX(-28%)}100%{-webkit-transform:translateX(0);transform:translateX(0)}}@keyframes closeMenu-data-v-1938cfa2{0%{-webkit-transform:translateX(-28%);transform:translateX(-28%)}100%{-webkit-transform:translateX(0);transform:translateX(0)}}.sub-list .row .carrier.open[data-v-1938cfa2]{-webkit-animation:showMenu-data-v-1938cfa2 .25s linear both;animation:showMenu-data-v-1938cfa2 .25s linear both}.sub-list .row .carrier.close[data-v-1938cfa2]{-webkit-animation:closeMenu-data-v-1938cfa2 .15s linear both;animation:closeMenu-data-v-1938cfa2 .15s linear both}.sub-list .row .carrier .left[data-v-1938cfa2]{width:100%;position:relative}.sub-list .row .carrier .left .title[data-v-1938cfa2]{padding-top:3vw;width:90%;margin:0 5%;font-size:%?36?%}.sub-list .row .carrier .left .title .cell-icon[data-v-1938cfa2]{display:inline-block;height:%?32?%;margin-top:%?15?%;width:%?32?%;font-size:%?22?%;text-align:center;line-height:%?32?%;border-radius:%?4?%;margin-right:%?12?%}.sub-list .row .carrier .left .title .cell-icon.hb[data-v-1938cfa2]{background:#ffaa0e}.sub-list .row .carrier .left .title .cell-icon.lpk[data-v-1938cfa2]{background:#3ab54a}.sub-list .row .carrier .left .term[data-v-1938cfa2]{width:90%;margin:0 5%;font-size:%?26?%;color:#999}.sub-list .row .carrier .left .usage[data-v-1938cfa2]{width:90%;margin:0 5%;font-size:%?26?%;color:#909399}.sub-list .row .carrier .left .gap-top[data-v-1938cfa2],.sub-list .row .carrier .left .gap-bottom[data-v-1938cfa2]{position:absolute;width:%?20?%;height:%?20?%;right:%?-10?%;border-radius:100%;background-color:#f5f5f5}.sub-list .row .carrier .left .gap-top[data-v-1938cfa2]{top:%?-10?%}.sub-list .row .carrier .left .gap-bottom[data-v-1938cfa2]{bottom:%?-10?%}.sub-list .row .carrier .left .overdue[data-v-1938cfa2]{position:absolute;right:%?10?%;top:0}.sub-list .row .carrier .left .overdue .iconyiguoqi2[data-v-1938cfa2]{font-size:%?72?%}.sub-list .row .carrier .left .overdue .iconyishiyong[data-v-1938cfa2]{font-size:%?72?%;color:#606266}.sub-list .row .carrier .right[data-v-1938cfa2]{-webkit-flex-shrink:0;flex-shrink:0;width:28%;color:#fff;-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center}.sub-list .row .carrier .right.invalid[data-v-1938cfa2]{background:-webkit-linear-gradient(left,#aaa,#999);background:linear-gradient(90deg,#aaa,#999)}.sub-list .row .carrier .right.invalid .use[data-v-1938cfa2]{color:#aaa}.sub-list .row .carrier .right .ticket[data-v-1938cfa2],.sub-list .row .carrier .right .criteria[data-v-1938cfa2]{width:100%}.sub-list .row .carrier .right .ticket[data-v-1938cfa2]{padding-top:1vw;-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center;-webkit-box-align:baseline;-webkit-align-items:baseline;align-items:baseline;height:6vw}.sub-list .row .carrier .right .ticket .num[data-v-1938cfa2]{font-size:%?42?%;font-weight:600}.sub-list .row .carrier .right .ticket .unit[data-v-1938cfa2]{font-size:%?24?%}.sub-list .row .carrier .right .criteria[data-v-1938cfa2]{-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center;font-size:%?28?%}.sub-list .row .carrier .right .use[data-v-1938cfa2]{width:45%;margin:0 2.5%;height:%?40?%;-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center;-webkit-box-align:center;-webkit-align-items:center;align-items:center;font-size:%?24?%;background-color:#fff;border-radius:%?40?%;padding:0 %?4?%}.empty[data-v-1938cfa2]{width:100vw;display:block}body.?%PAGE?%[data-v-1938cfa2]{background-color:#f8f8f8}",""]),t.exports=e},"6e16":function(t,e,a){"use strict";a.r(e);var i=a("d5a4"),n=a("9c14");for(var o in n)"default"!==o&&function(t){a.d(e,t,(function(){return n[t]}))}(o);a("02b4");var r,s=a("f0c5"),l=Object(s["a"])(n["default"],i["b"],i["c"],!1,null,"06fa601a",null,!1,i["a"],r);e["default"]=l.exports},"8e79":function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i={name:"gj-load-more",props:{status:{type:String,default:"more"},width:{type:String,default:"100vw"},showIcon:{type:Boolean,default:!0},color:{type:String,default:"#777777"},contentText:{type:Object,default:function(){return{}}}},data:function(){return{}}};e.default=i},"97ca":function(t,e,a){var i=a("3fc5");"string"===typeof i&&(i=[[t.i,i,""]]),i.locals&&(t.exports=i.locals);var n=a("4f06").default;n("3e9f166e",i,!0,{sourceMap:!1,shadowMode:!1})},"9b13":function(t,e,a){"use strict";a.r(e);var i=a("0375"),n=a("340f");for(var o in n)"default"!==o&&function(t){a.d(e,t,(function(){return n[t]}))}(o);a("c5c1");var r,s=a("f0c5"),l=Object(s["a"])(n["default"],i["b"],i["c"],!1,null,"1938cfa2",null,!1,i["a"],r);e["default"]=l.exports},"9c14":function(t,e,a){"use strict";a.r(e);var i=a("c470"),n=a.n(i);for(var o in i)"default"!==o&&function(t){a.d(e,t,(function(){return i[t]}))}(o);e["default"]=n.a},"9dfe":function(t,e,a){var i=a("1c94");"string"===typeof i&&(i=[[t.i,i,""]]),i.locals&&(t.exports=i.locals);var n=a("4f06").default;n("9208cb30",i,!0,{sourceMap:!1,shadowMode:!1})},a12f:function(t,e,a){"use strict";var i=a("9dfe"),n=a.n(i);n.a},a2e3:function(t,e,a){"use strict";var i;a.d(e,"b",(function(){return n})),a.d(e,"c",(function(){return o})),a.d(e,"a",(function(){return i}));var n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("v-uni-view",{staticClass:"load-more",style:{width:t.width}},["loading"===t.status&&t.showIcon?a("v-uni-view",{staticClass:"gj-load-more__img"},[a("v-uni-view",{staticClass:"load1"},[a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}})],1),a("v-uni-view",{staticClass:"load2"},[a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}})],1),a("v-uni-view",{staticClass:"load3"},[a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}})],1)],1):t._e(),a("v-uni-view",{staticClass:"cu-load",class:"more"===t.status?"loading":"over"})],1)},o=[]},ad8a:function(t,e,a){"use strict";var i=a("4ea4");Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n=i(a("2909"));a("96cf");var o=i(a("1da1")),r=a("cbfe"),s=i(a("d189")),l=(i(a("5028")),i(a("6e16"))),c={components:{gjLoadMore:s.default,uniDrawer:l.default},data:function(){return{headerTop:0,typeClass:"valid",theIndex:null,oldIndex:null,state:1,isStop:!1,couponList:[],loadingType:"more",token:null,page:1,showRight:!1,moneySymbol:this.moneySymbol,currentCoupon:{},loading:!0}},filters:{time:function(t){return t.substr(8)},timeFull:function(t){return t.substr(8)}},onPullDownRefresh:function(){this.page=1,this.couponList=[],this.getMyCouponList("refresh")},onReachBottom:function(){"nomore"!==this.loadingType&&(this.page++,this.getMyCouponList())},onLoad:function(){var t=this;this.initData();var e=setInterval((function(){var a=document.getElementsByTagName("uni-page-head");a.length>0&&(t.headerTop=a[0].offsetHeight+"px",clearInterval(e))}),1)},methods:{show:function(t){0!==t.product.length&&(this.currentCoupon=t,this.showRight=!0)},hide:function(){this.showRight=!1},closeDrawer:function(){this.showRight=!1},switchType:function(t,e){this.typeClass!==t&&(uni.pageScrollTo({scrollTop:0,duration:0}),this.typeClass=t,this.state=e,this.page=1,this.couponList=[],this.loading=!0,this.getMyCouponList())},emptyInvalidCoupon:function(){var t=(0,o.default)(regeneratorRuntime.mark((function t(){var e=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$http.get("".concat(r.couponClear)).then((function(){e.getMyCouponList()}));case 2:case"end":return t.stop()}}),t,this)})));function e(){return t.apply(this,arguments)}return e}(),discard:function(){},initData:function(){this.page=1,this.couponList=[],this.getMyCouponList()},navTo:function(t,e){e?this.$mRouter.switchTab({route:t}):this.$mRouter.push({route:t})},getMyCouponList:function(){var t=(0,o.default)(regeneratorRuntime.mark((function t(e){var a=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,(0,r.userCoupons)({page:this.page,state:this.state}).then((function(t){a.loading=!1,"refresh"===e&&uni.stopPullDownRefresh(),a.loadingType=t.data.meta.current_page<t.data.meta.last_page?"more":"nomore",a.couponList=[].concat((0,n.default)(a.couponList),(0,n.default)(t.data.data))})).catch((function(){a.loading=!1,"refresh"===e&&uni.stopPullDownRefresh()}));case 2:case"end":return t.stop()}}),t,this)})));function e(e){return t.apply(this,arguments)}return e}()}};e.default=c},b9a2:function(t,e,a){var i=a("24fb");e=i(!1),e.push([t.i,'@charset "UTF-8";.uni-drawer[data-v-06fa601a]{display:block;position:fixed;top:0;left:0;right:0;bottom:0;overflow:hidden;visibility:hidden;z-index:999;height:100vh；}.uni-drawer.uni-drawer--right .uni-drawer__content[data-v-06fa601a]{left:auto;right:0;-webkit-transform:translatex(100%);transform:translatex(100%)}.uni-drawer.uni-drawer--visible[data-v-06fa601a]{visibility:visible}.uni-drawer.uni-drawer--visible .uni-drawer__content[data-v-06fa601a]{-webkit-transform:translatex(0);transform:translatex(0)}.uni-drawer.uni-drawer--visible .uni-drawer__mask[data-v-06fa601a]{display:block;opacity:1}.uni-drawer__mask[data-v-06fa601a]{display:block;opacity:0;position:absolute;top:0;left:0;width:100%;height:100%;background:rgba(0,0,0,.4);-webkit-transition:opacity .3s;transition:opacity .3s}.uni-drawer__content[data-v-06fa601a]{display:block;position:absolute;overflow-y:scroll;top:0;left:0;height:100%;background:#fff;-webkit-transition:all .3s ease-out;transition:all .3s ease-out;-webkit-transform:translatex(-100%);transform:translatex(-100%)}',""]),t.exports=e},c470:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i={name:"UniDrawer",props:{visible:{type:Boolean,default:!1},mode:{type:String,default:""},mask:{type:Boolean,default:!0}},data:function(){return{visibleSync:!1,showDrawer:!1,rightMode:!1,closeTimer:null,watchTimer:null}},watch:{visible:function(t){var e=this;clearTimeout(this.watchTimer),setTimeout((function(){e.showDrawer=t}),100),this.visibleSync&&clearTimeout(this.closeTimer),t?this.visibleSync=t:this.watchTimer=setTimeout((function(){e.visibleSync=t}),300)}},created:function(){var t=this;this.visibleSync=this.visible,setTimeout((function(){t.showDrawer=t.visible}),100),this.rightMode="right"===this.mode},methods:{close:function(){var t=this;this.showDrawer=!1,this.closeTimer=setTimeout((function(){t.visibleSync=!1,t.$emit("close")}),200)},moveHandle:function(){}}};e.default=i},c5c1:function(t,e,a){"use strict";var i=a("97ca"),n=a.n(i);n.a},cbfe:function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.coupons=n,e.getCoupons=o,e.userCoupons=r,e.userCouponCount=s;var i=a("dc40");function n(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.get("/coupons",t,{custom:{auth:!0}})}function o(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.post("/coupons/"+t.id,t,{custom:{auth:!0}})}function r(t){return i.http.get("/usercoupons",t,{custom:{auth:!0}})}function s(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.get("/usercoupons/count",t,{custom:{auth:!0}})}},d189:function(t,e,a){"use strict";a.r(e);var i=a("a2e3"),n=a("23b2");for(var o in n)"default"!==o&&function(t){a.d(e,t,(function(){return n[t]}))}(o);a("a12f");var r,s=a("f0c5"),l=Object(s["a"])(n["default"],i["b"],i["c"],!1,null,"23b2d473",null,!1,i["a"],r);e["default"]=l.exports},d5a4:function(t,e,a){"use strict";var i;a.d(e,"b",(function(){return n})),a.d(e,"c",(function(){return o})),a.d(e,"a",(function(){return i}));var n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return t.visibleSync?a("v-uni-view",{staticClass:"uni-drawer",class:{"uni-drawer--visible":t.showDrawer,"uni-drawer--right":t.rightMode},on:{touchmove:function(e){e.stopPropagation(),e.preventDefault(),arguments[0]=e=t.$handleEvent(e),t.moveHandle.apply(void 0,arguments)}}},[a("v-uni-view",{staticClass:"uni-drawer__mask",on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.close.apply(void 0,arguments)}}}),a("v-uni-view",{staticClass:"uni-drawer__content"},[t._t("default")],2)],1):t._e()},o=[]}}]);