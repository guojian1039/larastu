(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-user-address-manage"],{"0308":function(t,e,a){"use strict";var i;a.d(e,"b",(function(){return n})),a.d(e,"c",(function(){return r})),a.d(e,"a",(function(){return i}));var n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("v-uni-view",{staticClass:"address-manage gj-row-wrapper"},[a("v-uni-view",{staticClass:"row b-b"},[a("v-uni-text",{staticClass:"tit"},[t._v("联系人")]),a("v-uni-input",{staticClass:"input",attrs:{type:"text",placeholder:"收货人姓名","placeholder-class":"placeholder"},on:{blur:function(e){arguments[0]=e=t.$handleEvent(e),t.handleRealNameChange.apply(void 0,arguments)}},model:{value:t.addressData.contact_name,callback:function(e){t.$set(t.addressData,"contact_name",e)},expression:"addressData.contact_name"}})],1),a("v-uni-view",{staticClass:"row b-b"},[a("v-uni-text",{staticClass:"tit"},[t._v("手机号")]),a("v-uni-input",{staticClass:"input",attrs:{type:"number",placeholder:"收货人手机号码","placeholder-class":"placeholder"},on:{blur:function(e){arguments[0]=e=t.$handleEvent(e),t.handleMobileChange.apply(void 0,arguments)}},model:{value:t.addressData.contact_phone,callback:function(e){t.$set(t.addressData,"contact_phone",e)},expression:"addressData.contact_phone"}})],1),a("v-uni-view",{staticClass:"row b-b"},[a("v-uni-text",{staticClass:"tit"},[t._v("选择地址")]),a("gj-pick-regions",{attrs:{addressData:t.addressData},on:{getRegions:function(e){arguments[0]=e=t.$handleEvent(e),t.handleGetRegions.apply(void 0,arguments)}}})],1),a("v-uni-view",{staticClass:"row b-b"},[a("v-uni-text",{staticClass:"tit"},[t._v("详细地址")]),a("v-uni-input",{staticClass:"input",attrs:{type:"text",placeholder:"请输入详细地址","placeholder-class":"placeholder"},on:{blur:function(e){arguments[0]=e=t.$handleEvent(e),t.bindAddressDetailsChange.apply(void 0,arguments)}},model:{value:t.addressData.address,callback:function(e){t.$set(t.addressData,"address",e)},expression:"addressData.address"}})],1),a("v-uni-view",{staticClass:"row b-b"},[a("v-uni-text",{staticClass:"tit"},[t._v("详细地址")]),a("v-uni-input",{staticClass:"input",attrs:{type:"text",placeholder:"请输入邮编","placeholder-class":"placeholder"},on:{blur:function(e){arguments[0]=e=t.$handleEvent(e),t.bindAddressZipChange.apply(void 0,arguments)}},model:{value:t.addressData.zip,callback:function(e){t.$set(t.addressData,"zip",e)},expression:"addressData.zip"}})],1),a("v-uni-view",{staticClass:"row default-row"},[a("v-uni-text",{staticClass:"tit"},[t._v("设为默认")]),a("v-uni-switch",{attrs:{checked:!!t.addressData.is_default,color:t.themeColor.color},on:{change:function(e){arguments[0]=e=t.$handleEvent(e),t.switchChange.apply(void 0,arguments)}}})],1),a("v-uni-button",{staticClass:"add-btn",class:"bg-"+t.themeColor.name,attrs:{disabled:t.btnLoading,loading:t.btnLoading},on:{click:function(e){arguments[0]=e=t.$handleEvent(e),t.confirm.apply(void 0,arguments)}}},[t._v("提交")]),a("gjLoading",{attrs:{isFullScreen:!0,active:t.loading}})],1)},r=[]},"135e":function(t,e,a){var i=a("aa21");"string"===typeof i&&(i=[[t.i,i,""]]),i.locals&&(t.exports=i.locals);var n=a("4f06").default;n("c0d5f598",i,!0,{sourceMap:!1,shadowMode:!1})},"1c40":function(t,e,a){"use strict";var i;a.d(e,"b",(function(){return n})),a.d(e,"c",(function(){return r})),a.d(e,"a",(function(){return i}));var n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("v-uni-picker",{attrs:{mode:"multiSelector",value:t.multiIndex,"range-key":"title",range:t.multiArray},on:{columnchange:function(e){arguments[0]=e=t.$handleEvent(e),t.bindMultiPickerColumnChange.apply(void 0,arguments)}}},[t._v(t._s(t.multiStr))])},r=[]},"42bb":function(t,e,a){"use strict";a.r(e);var i=a("1c40"),n=a("48f4");for(var r in n)"default"!==r&&function(t){a.d(e,t,(function(){return n[t]}))}(r);var s,d=a("f0c5"),u=Object(d["a"])(n["default"],i["b"],i["c"],!1,null,null,null,!1,i["a"],s);e["default"]=u.exports},"48f4":function(t,e,a){"use strict";a.r(e);var i=a("ce34"),n=a.n(i);for(var r in i)"default"!==r&&function(t){a.d(e,t,(function(){return i[t]}))}(r);e["default"]=n.a},"7d57":function(t,e,a){"use strict";a.r(e);var i=a("0308"),n=a("b162");for(var r in n)"default"!==r&&function(t){a.d(e,t,(function(){return n[t]}))}(r);a("ae67");var s,d=a("f0c5"),u=Object(d["a"])(n["default"],i["b"],i["c"],!1,null,"0d7919dd",null,!1,i["a"],s);e["default"]=u.exports},"834e":function(t,e,a){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.getCaptchas=n,e.getVerificationCodes=r,e.getArea=s,e.getAnnouces=d,e.getAnnouce=u,e.getSitehelps=c,e.getSitehelp=l,e.uploadImage=o;var i=a("dc40");function n(){return i.http.post("/captchas")}function r(t){return i.http.put("/verificationCodes",t)}function s(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.get("/comm/getArea",t)}function d(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.get("/annouces",t)}function u(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.get("/annouces/"+t.id,t)}function c(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.get("/sitehelps",t)}function l(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.get("/sitehelps/"+t.id,t)}function o(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};return i.http.upload("/upload",t)}},aa21:function(t,e,a){var i=a("24fb");e=i(!1),e.push([t.i,"uni-page-body[data-v-0d7919dd]{background:#f8f8f8}.address-manage[data-v-0d7919dd]{padding-top:%?16?%}body.?%PAGE?%[data-v-0d7919dd]{background:#f8f8f8}",""]),t.exports=e},ae67:function(t,e,a){"use strict";var i=a("135e"),n=a.n(i);n.a},b162:function(t,e,a){"use strict";a.r(e);var i=a("f0a5"),n=a.n(i);for(var r in i)"default"!==r&&function(t){a.d(e,t,(function(){return i[t]}))}(r);e["default"]=n.a},ce34:function(t,e,a){"use strict";var i=a("4ea4");Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0,a("ac6a"),a("96cf");var n=i(a("1da1"));a("c5f6");var r=a("834e"),s={props:{defaultLevel:{type:Number,default:3},addressData:{type:Object,default:function(){return{}}}},data:function(){return{multiArray:[],multiIndex:[0,0,0],multiStr:""}},mounted:function(){this.$mHelper.log(this.addressData),this.getProvinceList()},methods:{getProvinceList:function(){var t=(0,n.default)(regeneratorRuntime.mark((function t(){var e,a,i,s,d,u,c=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return e=0,a=0,i=0,s=null,d=null,u=null,t.next=8,(0,r.getArea)().then(function(){var t=(0,n.default)(regeneratorRuntime.mark((function t(l){return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return c.multiArray[0]=l.data,console.log(l.data),c.addressData.province?l.data.forEach((function(t,a){t.title==c.addressData.province&&(e=a,c.addressData.province=t.title,c.addressData.province_id=t.id,s=t.title)})):(c.addressData.province=c.multiArray[0][0].title,c.addressData.province_id=c.multiArray[0][0].id,s=c.multiArray[0][0].title),t.next=5,(0,r.getArea)({pid:c.addressData.province_id}).then(function(){var t=(0,n.default)(regeneratorRuntime.mark((function t(n){return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return c.multiArray[1]=n.data,c.addressData.title?n.data.forEach((function(t,e){t.title==c.addressData.city&&(a=e,c.addressData.city=t.title,c.addressData.city_id=t.id,d=t.title)})):(c.addressData.city=c.multiArray[1][0].title,c.addressData.city_id=c.multiArray[1][0].id,d=c.multiArray[1][0].title),t.next=4,(0,r.getArea)({pid:c.addressData.city_id}).then((function(t){c.multiArray[2]=t.data,c.addressData.district?t.data.forEach((function(t,e){t.title==c.addressData.district&&(i=e,c.addressData.district=t.title,c.addressData.area_id=t.id,u=t.title)})):(c.addressData.district=c.multiArray[2][0].title,c.addressData.area_id=c.multiArray[2][0].id,u=c.multiArray[2][0].title),c.multiIndex=[e,a,i],c.multiStr="".concat(s,", ").concat(d,", ").concat(u),c.$emit("getRegions",c.addressData)}));case 4:case"end":return t.stop()}}),t)})));return function(e){return t.apply(this,arguments)}}());case 5:case"end":return t.stop()}}),t)})));return function(e){return t.apply(this,arguments)}}());case 8:case"end":return t.stop()}}),t)})));function e(){return t.apply(this,arguments)}return e}(),bindMultiPickerColumnChange:function(){var t=(0,n.default)(regeneratorRuntime.mark((function t(e){var a,i,s,d,u,c,l=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:this.multiIndex[e.detail.column]=e.detail.value,a=0,i=0,s=0,d=null,u=null,c=null,t.t0=e.detail.column,t.next=0===t.t0?10:1===t.t0?17:2===t.t0?30:32;break;case 10:if(this.multiIndex[0]!==this.multiIndex[0]){t.next=16;break}return this.addressData.province_id=this.multiArray[0][e.detail.value].id,this.addressData.province=this.multiArray[0][e.detail.value].title,d=this.multiArray[0][e.detail.value].title,t.next=16,(0,r.getArea)({pid:this.multiArray[0][e.detail.value].id}).then(function(){var t=(0,n.default)(regeneratorRuntime.mark((function t(i){return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return l.multiArray[1]=i.data,l.addressData.city_id=l.multiArray[1][0].id,l.addressData.city=l.multiArray[1][0].title,u=l.multiArray[1][0].title,a=e.detail.value,t.next=7,(0,r.getArea)({pid:l.multiArray[1][e.detail.column].id}).then((function(t){l.multiArray[2]=t.data,l.addressData.district=l.multiArray[2][0].title,l.addressData.area_id=l.multiArray[2][0].id,c=l.multiArray[2][0].title,l.multiIndex=[a,0,0],l.multiStr="".concat(d,", ").concat(u,", ").concat(c)}));case 7:case"end":return t.stop()}}),t)})));return function(e){return t.apply(this,arguments)}}());case 16:return t.abrupt("break",32);case 17:if(this.multiIndex[0]!==this.multiIndex[0]){t.next=29;break}if(this.multiIndex[1]!==this.multiIndex[1]){t.next=29;break}return this.addressData.province_id=this.multiArray[0][this.multiIndex[0]].id,this.addressData.province=this.multiArray[0][this.multiIndex[0]].title,d=this.multiArray[0][this.multiIndex[0]].title,this.addressData.city=this.multiArray[1][e.detail.value].title,this.addressData.city_id=this.multiArray[1][e.detail.value].id,u=this.multiArray[1][e.detail.value].title,i=e.detail.value,t.next=29,(0,r.getArea)({pid:this.multiArray[1][e.detail.value].id}).then((function(t){l.multiArray[2]=t.data,l.addressData.district=l.multiArray[2][0].title,l.addressData.area_id=l.multiArray[2][0].id,c=l.multiArray[2][0].title,l.multiIndex=[l.multiIndex[0],i,0],l.multiStr="".concat(d,", ").concat(u,", ").concat(c)}));case 29:return t.abrupt("break",32);case 30:return this.multiIndex[0]===this.multiIndex[0]&&this.multiIndex[1]===this.multiIndex[1]&&this.multiIndex[2]===this.multiIndex[2]&&(this.addressData.province=this.multiArray[0][this.multiIndex[0]].title,this.addressData.province_id=this.multiArray[0][this.multiIndex[0]].id,d=this.multiArray[0][this.multiIndex[0]].title,this.addressData.city_id=this.multiArray[1][this.multiIndex[1]].id,this.addressData.city=this.multiArray[1][this.multiIndex[1]].title,u=this.multiArray[1][this.multiIndex[1]].title,this.addressData.area_id=this.multiArray[2][e.detail.value].id,this.addressData.district=this.multiArray[2][e.detail.value].title,c=this.multiArray[2][e.detail.value].title,s=e.detail.value,this.multiIndex=[this.multiIndex[0],this.multiIndex[1],s],this.multiStr="".concat(d,", ").concat(u,", ").concat(c)),t.abrupt("break",32);case 32:this.$emit("getRegions",this.addressData);case 33:case"end":return t.stop()}}),t,this)})));function e(e){return t.apply(this,arguments)}return e}()}};e.default=s},f0a5:function(t,e,a){"use strict";var i=a("4ea4");Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0,a("96cf");var n=i(a("1da1")),r=a("c24f"),s=i(a("42bb")),d={components:{gjPickRegions:s.default},data:function(){return{addressData:{contact_name:"",contact_phone:"",zip:"",address_name:"请选择地址",address:"",is_default:!1,province_id:"",city_id:"",area_id:"",province:"",city:"",district:"",id:0},btnLoading:!1,multiArray:[[],[],[]],multiIndex:[0,0,0],loading:!0}},onLoad:function(t){this.initData(t)},methods:{handleGetRegions:function(t){this.addressData.province=t.province,this.addressData.city=t.city,this.addressData.district=t.district},initData:function(){var t=(0,n.default)(regeneratorRuntime.mark((function t(e){var a,i=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:if(a="新增收货地址","edit"!==e.type){t.next=7;break}return a="编辑收货地址",t.next=5,this.getAddressDetail(e.id);case 5:t.next=8;break;case 7:setTimeout((function(){i.loading=!1}),1e3);case 8:this.manageType=e.type,uni.setNavigationBarTitle({title:a});case 10:case"end":return t.stop()}}),t,this)})));function e(e){return t.apply(this,arguments)}return e}(),getAddressDetail:function(){var t=(0,n.default)(regeneratorRuntime.mark((function t(e){var a=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,(0,r.getAddress)(e).then(function(){var t=(0,n.default)(regeneratorRuntime.mark((function t(e){return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,e.data;case 2:a.addressData=t.sent,a.loading=!1;case 4:case"end":return t.stop()}}),t)})));return function(e){return t.apply(this,arguments)}}()).catch((function(){a.loading=!1}));case 2:case"end":return t.stop()}}),t)})));function e(e){return t.apply(this,arguments)}return e}(),handleRealNameChange:function(t){this.addressData.contact_name=t.detail.value},bindAddressDetailsChange:function(t){this.addressData.address=t.detail.value},handleMobileChange:function(t){this.addressData.contact_phone=t.detail.value},bindAddressZipChange:function(t){this.addressData.zip=t.detail.value},switchChange:function(t){this.addressData.is_default=t.detail.value},confirm:function(){var t=this.addressData;t.contact_name?/^(?:(?:\+|00)86)?1[3-9]\d{9}$/.test(t.contact_phone)?(this.btnLoading=!0,"edit"===this.manageType?this.handleAddressUpdate(t):this.handleAddressCreate(t)):this.$mHelper.toast("请输入正确的手机号码"):this.$mHelper.toast("请填写收货人姓名")},handleAddressUpdate:function(){var t=(0,n.default)(regeneratorRuntime.mark((function t(e){var a,i=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return a={contact_name:e.contact_name,contact_phone:e.contact_phone,address:e.address,is_default:e.is_default?1:0,province:e.province,city:e.city,district:e.district,zip:e.zip,id:e.id},t.next=3,(0,r.updateAddresses)(a).then((function(){i.btnLoading=!1,i.$mHelper.toast("收货地址修改成功！"),i.$mRouter.back()})).catch((function(){i.btnLoading=!1}));case 3:case"end":return t.stop()}}),t)})));function e(e){return t.apply(this,arguments)}return e}(),handleAddressCreate:function(){var t=(0,n.default)(regeneratorRuntime.mark((function t(e){var a=this;return regeneratorRuntime.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,(0,r.storeAddresses)({contact_name:e.contact_name,contact_phone:e.contact_phone,address:e.address,is_default:e.is_default?1:0,province:e.province,city:e.city,district:e.district,zip:e.zip}).then((function(){a.btnLoading=!1,a.$mHelper.toast("收货地址保存成功！"),a.$mRouter.back()})).catch((function(){a.btnLoading=!1}));case 2:case"end":return t.stop()}}),t)})));function e(e){return t.apply(this,arguments)}return e}()}};e.default=d}}]);