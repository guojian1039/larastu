(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-user-address-address"],{"0ca5":function(t,e,a){"use strict";var i=a("5983"),n=a.n(i);n.a},"1c94":function(t,e,a){var i=a("24fb");e=i(!1),e.push([t.i,".gj-load-more[data-v-23b2d473]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;flex-direction:row;height:%?80?%;-webkit-box-align:center;-webkit-align-items:center;align-items:center;-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center\n\t/*position: fixed;*/\n\t/*bottom: 5upx;*/\n\t/*text-align: center;*/}.gj-load-more__text[data-v-23b2d473]{font-size:%?28?%;color:#999}.gj-load-more__img[data-v-23b2d473]{height:24px;width:24px;margin-right:10px}.gj-load-more__img > uni-view[data-v-23b2d473]{position:absolute}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]{width:6px;height:2px;border-top-left-radius:1px;border-bottom-left-radius:1px;background:#999;position:absolute;opacity:.2;-webkit-transform-origin:50%;transform-origin:50%;-webkit-animation:load-data-v-23b2d473 1.56s ease infinite;animation:load-data-v-23b2d473 1.56s ease infinite}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]:nth-child(1){-webkit-transform:rotate(90deg);transform:rotate(90deg);top:2px;left:9px}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]:nth-child(2){-webkit-transform:rotate(180deg);transform:rotate(180deg);top:11px;right:0}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]:nth-child(3){-webkit-transform:rotate(270deg);transform:rotate(270deg);bottom:2px;left:9px}.gj-load-more__img > uni-view uni-view[data-v-23b2d473]:nth-child(4){top:11px;left:0}.load1[data-v-23b2d473],\n.load2[data-v-23b2d473],\n.load3[data-v-23b2d473]{height:24px;width:24px}.load2[data-v-23b2d473]{-webkit-transform:rotate(30deg);transform:rotate(30deg)}.load3[data-v-23b2d473]{-webkit-transform:rotate(60deg);transform:rotate(60deg)}.load1 uni-view[data-v-23b2d473]:nth-child(1){-webkit-animation-delay:0s;animation-delay:0s}.load2 uni-view[data-v-23b2d473]:nth-child(1){-webkit-animation-delay:.13s;animation-delay:.13s}.load3 uni-view[data-v-23b2d473]:nth-child(1){-webkit-animation-delay:.26s;animation-delay:.26s}.load1 uni-view[data-v-23b2d473]:nth-child(2){-webkit-animation-delay:.39s;animation-delay:.39s}.load2 uni-view[data-v-23b2d473]:nth-child(2){-webkit-animation-delay:.52s;animation-delay:.52s}.load3 uni-view[data-v-23b2d473]:nth-child(2){-webkit-animation-delay:.65s;animation-delay:.65s}.load1 uni-view[data-v-23b2d473]:nth-child(3){-webkit-animation-delay:.78s;animation-delay:.78s}.load2 uni-view[data-v-23b2d473]:nth-child(3){-webkit-animation-delay:.91s;animation-delay:.91s}.load3 uni-view[data-v-23b2d473]:nth-child(3){-webkit-animation-delay:1.04s;animation-delay:1.04s}.load1 uni-view[data-v-23b2d473]:nth-child(4){-webkit-animation-delay:1.17s;animation-delay:1.17s}.load2 uni-view[data-v-23b2d473]:nth-child(4){-webkit-animation-delay:1.3s;animation-delay:1.3s}.load3 uni-view[data-v-23b2d473]:nth-child(4){-webkit-animation-delay:1.43s;animation-delay:1.43s}@-webkit-keyframes load-data-v-23b2d473{0%{opacity:1}100%{opacity:.2}}",""]),t.exports=e},"23b2":function(t,e,a){"use strict";a.r(e);var i=a("8e79"),n=a.n(i);for(var o in i)"default"!==o&&function(t){a.d(e,t,(function(){return i[t]}))}(o);e["default"]=n.a},"26b8":function(t,e,a){"use strict";var i=a("4ea4");Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var n=i(a("2909"));a("96cf");var o=i(a("1da1")),s=a("c24f"),r=i(a("d189")),d={components:{gjLoadMore:r.default},data:function(){return{timeOutEvent:0,source:0,page:1,loadingType:"more",addressList:[],loading:!0}},onPullDownRefresh:function(){this.page=1,this.addressList=[],this.getAddressList("refresh")},onReachBottom:function(){"nomore"!==this.loadingType&&(this.page++,this.getAddressList())},onLoad:function(t){this.source=t.source},onShow:function(){this.initData()},methods:{deleteAddress:function(t){var e=this;uni.showModal({content:"确定要删除该收货地址吗",success:function(a){a.confirm&&e.handleAddressDelete(t)}})},goTouchEnd:function(){clearTimeout(this.timeOutEvent)},goTouchMove:function(){clearTimeout(this.timeOutEvent),this.timeOutEvent=0},handleAddressDelete:function(){var t=(0,o.default)(regeneratorRuntime.mark((function t(e){var a=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,(0,s.deleteAddresses)({id:e}).then((function(){a.page=1,a.addressList.length=0,a.getAddressList()}));case 2:case"end":return t.stop()}}),t)})));function e(e){return t.apply(this,arguments)}return e}(),initData:function(){this.page=1,this.addressList.length=0,this.getAddressList()},getAddressList:function(){var t=(0,o.default)(regeneratorRuntime.mark((function t(e){var a=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,(0,s.getAddresses)({page:this.page}).then((function(t){a.loading=!1,"refresh"===e&&uni.stopPullDownRefresh(),a.loadingType=10===t.data.length?"more":"nomore",a.addressList=[].concat((0,n.default)(a.addressList),(0,n.default)(t.data))})).catch((function(){a.loading=!1,"refresh"===e&&uni.stopPullDownRefresh()}));case 2:case"end":return t.stop()}}),t,this)})));function e(e){return t.apply(this,arguments)}return e}(),checkAddress:function(t){1===parseInt(this.source,10)&&(this.$mHelper.prePage().addressData=t,this.$mRouter.back())},addAddress:function(t,e){this.$mRouter.push({route:"/pages/user/address/manage?type=".concat(t,"&id=").concat(e)})}}};e.default=d},2909:function(t,e,a){"use strict";function i(t,e){(null==e||e>t.length)&&(e=t.length);for(var a=0,i=new Array(e);a<e;a++)i[a]=t[a];return i}function n(t){if(Array.isArray(t))return i(t)}function o(t){if("undefined"!==typeof Symbol&&Symbol.iterator in Object(t))return Array.from(t)}function s(t,e){if(t){if("string"===typeof t)return i(t,e);var a=Object.prototype.toString.call(t).slice(8,-1);return"Object"===a&&t.constructor&&(a=t.constructor.name),"Map"===a||"Set"===a?Array.from(t):"Arguments"===a||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(a)?i(t,e):void 0}}function r(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}function d(t){return n(t)||o(t)||s(t)||r()}a.r(e),a.d(e,"default",(function(){return d}))},"3c11":function(t,e,a){var i=a("24fb");e=i(!1),e.push([t.i,"uni-page-body[data-v-e91fc080]{background-color:#f8f8f8}.address-list[data-v-e91fc080]{position:relative}.address-list .address-box[data-v-e91fc080]{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-align:center;-webkit-align-items:center;align-items:center}.address-list .address-box .tag[data-v-e91fc080]{font-size:%?24?%;margin-right:%?4?%;border:1px solid;border-radius:%?4?%;padding:0 %?4?%}.address-list .address-box .address[data-v-e91fc080]{font-size:%?30?%;color:#303133}.address-list .u-box[data-v-e91fc080]{font-size:%?28?%;color:#909399;margin-top:%?16?%}.address-list .u-box .name[data-v-e91fc080]{margin-right:%?30?%}body.?%PAGE?%[data-v-e91fc080]{background-color:#f8f8f8}",""]),t.exports=e},5369:function(t,e,a){"use strict";a.r(e);var i=a("83e1"),n=a("fd78");for(var o in n)"default"!==o&&function(t){a.d(e,t,(function(){return n[t]}))}(o);a("0ca5");var s,r=a("f0c5"),d=Object(r["a"])(n["default"],i["b"],i["c"],!1,null,"e91fc080",null,!1,i["a"],s);e["default"]=d.exports},5983:function(t,e,a){var i=a("3c11");"string"===typeof i&&(i=[[t.i,i,""]]),i.locals&&(t.exports=i.locals);var n=a("4f06").default;n("91686b30",i,!0,{sourceMap:!1,shadowMode:!1})},"83e1":function(t,e,a){"use strict";a.d(e,"b",(function(){return n})),a.d(e,"c",(function(){return o})),a.d(e,"a",(function(){return i}));var i={gjLoadMore:a("d189").default},n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("v-uni-view",{staticClass:"address-list"},[t.addressList.length>0?a("v-uni-view",{staticClass:"gj-list"},[t._l(t.addressList,(function(e,i){return a("v-uni-view",{key:i,staticClass:"gj-list-item",on:{click:function(a){arguments[0]=a=t.$handleEvent(a),t.checkAddress(e)}}},[a("v-uni-view",{staticClass:"mid",on:{longpress:function(a){arguments[0]=a=t.$handleEvent(a),t.deleteAddress(e.id)}}},[a("v-uni-view",{staticClass:"address-box"},[1===parseInt(e.is_default,10)?a("v-uni-text",{staticClass:"tag",class:"text-"+t.themeColor.name},[t._v("默认")]):t._e(),a("v-uni-text",{staticClass:"address in1line"},[t._v(t._s(e.full_address)+" "+t._s(e.zip))])],1),a("v-uni-view",{staticClass:"u-box"},[a("v-uni-text",{staticClass:"name"},[t._v(t._s(e.contact_name))]),a("v-uni-text",{staticClass:"mobile"},[t._v(t._s(e.contact_phone))])],1)],1),a("v-uni-view",{staticClass:"right"},[a("v-uni-text",{staticClass:"iconfont iconbianji",on:{click:function(a){a.stopPropagation(),arguments[0]=a=t.$handleEvent(a),t.addAddress("edit",e.id)}}})],1)],1)})),t.addressList.length>0?a("v-uni-text",{staticClass:"tips",class:"text-"+t.themeColor.name},[t._v("提示：长按可删除当前收货地址。最多只能存在一个默认地址。")]):t._e(),t.addressList.length>0?a("gj-load-more",{attrs:{status:t.loadingType}}):t._e()],2):t._e(),a("v-uni-view",{staticClass:"add-btn-wrapper"},[a("v-uni-button",{staticClass:"add-btn",class:"bg-"+t.themeColor.name,on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.addAddress("add")}}},[t._v("新增地址")])],1),0!==t.addressList.length||t.loading?t._e():a("gj-empty",{attrs:{info:"暂无收货地址，请添加地址"}}),a("gjLoading",{attrs:{isFullScreen:!0,active:t.loading}})],1)},o=[]},"8e79":function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i={name:"gj-load-more",props:{status:{type:String,default:"more"},width:{type:String,default:"100vw"},showIcon:{type:Boolean,default:!0},color:{type:String,default:"#777777"},contentText:{type:Object,default:function(){return{}}}},data:function(){return{}}};e.default=i},"9dfe":function(t,e,a){var i=a("1c94");"string"===typeof i&&(i=[[t.i,i,""]]),i.locals&&(t.exports=i.locals);var n=a("4f06").default;n("9208cb30",i,!0,{sourceMap:!1,shadowMode:!1})},a12f:function(t,e,a){"use strict";var i=a("9dfe"),n=a.n(i);n.a},a2e3:function(t,e,a){"use strict";var i;a.d(e,"b",(function(){return n})),a.d(e,"c",(function(){return o})),a.d(e,"a",(function(){return i}));var n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("v-uni-view",{staticClass:"load-more",style:{width:t.width}},["loading"===t.status&&t.showIcon?a("v-uni-view",{staticClass:"gj-load-more__img"},[a("v-uni-view",{staticClass:"load1"},[a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}})],1),a("v-uni-view",{staticClass:"load2"},[a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}})],1),a("v-uni-view",{staticClass:"load3"},[a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}}),a("v-uni-view",{style:{background:t.color}})],1)],1):t._e(),a("v-uni-view",{staticClass:"cu-load",class:"more"===t.status?"loading":"over"})],1)},o=[]},d189:function(t,e,a){"use strict";a.r(e);var i=a("a2e3"),n=a("23b2");for(var o in n)"default"!==o&&function(t){a.d(e,t,(function(){return n[t]}))}(o);a("a12f");var s,r=a("f0c5"),d=Object(r["a"])(n["default"],i["b"],i["c"],!1,null,"23b2d473",null,!1,i["a"],s);e["default"]=d.exports},fd78:function(t,e,a){"use strict";a.r(e);var i=a("26b8"),n=a.n(i);for(var o in i)"default"!==o&&function(t){a.d(e,t,(function(){return i[t]}))}(o);e["default"]=n.a}}]);