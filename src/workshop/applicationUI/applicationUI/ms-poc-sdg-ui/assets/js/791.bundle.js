"use strict";(self.webpackChunk_dms_app_shell=self.webpackChunk_dms_app_shell||[]).push([[791],{7791:(e,t,n)=>{n.r(t),n.d(t,{Login:()=>M,bootstrap:()=>Q,mount:()=>T,unmount:()=>W});var r=n(2784),a=n(8316),c=n(3382),o=n(1031),s=n(6076),l=n(6164),i=(0,l.oM)({name:"fullscreenloader",initialState:{loading:!1},reducers:{setLoading:function(e,t){e.loading=t.payload}}}),u=i.actions.setLoading,m=function(e){return e.fullscreenloader.loading};const d=i.reducer;const p=function(e){var t=(0,o.v9)(m);return r.createElement(r.Fragment,null,t&&r.createElement("div",{className:"overlay"},r.createElement("div",{className:"text-center middleloader"},r.createElement("div",{className:"spinner-border spinner-border-sm spinner-size-alter me-1",role:"status"},r.createElement("span",{className:"visually-hidden"},"Loading...")),r.createElement("div",{className:"spinner-grow spinner-grow-sm spinner-size-alter me-1",role:"status"},r.createElement("span",{className:"visually-hidden"},"Loading...")),r.createElement("div",{className:"spinner-border spinner-border-sm spinner-size-alter me-1",role:"status"},r.createElement("span",{className:"visually-hidden"},"Loading...")),r.createElement("div",{className:"spinner-grow spinner-grow-sm spinner-size-alter me-1",role:"status"},r.createElement("span",{className:"visually-hidden"},"Loading...")))))};n(9431);var f=(0,l.oM)({name:"loginslice",initialState:{demo:"demo"},reducers:{setDemo:function(e,t){e.demo=t.payload}}});f.actions.setDemo;const b=f.reducer;var v=(0,l.oM)({name:"popupblock",initialState:{show:!1,type:"success",text:""},reducers:{setStatusOfPopup:function(e,t){e.show=t.payload.show,e.type=t.payload.type,e.text=t.payload.text}}}),y=v.actions.setStatusOfPopup,E=function(e){return e.popupblock};const g=v.reducer;var h=(0,l.xC)({reducer:{login:b,fullscreenloader:d,popupblock:g}}),w=n(7370),N=n(9725);function O(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var n=null==e?null:"undefined"!=typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null==n)return;var r,a,c=[],o=!0,s=!1;try{for(n=n.call(e);!(o=(r=n.next()).done)&&(c.push(r.value),!t||c.length!==t);o=!0);}catch(e){s=!0,a=e}finally{try{o||null==n.return||n.return()}finally{if(s)throw a}}return c}(e,t)||function(e,t){if(!e)return;if("string"==typeof e)return S(e,t);var n=Object.prototype.toString.call(e).slice(8,-1);"Object"===n&&e.constructor&&(n=e.constructor.name);if("Map"===n||"Set"===n)return Array.from(e);if("Arguments"===n||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n))return S(e,t)}(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function S(e,t){(null==t||t>e.length)&&(t=e.length);for(var n=0,r=new Array(t);n<t;n++)r[n]=e[n];return r}function j(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function k(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?j(Object(n),!0).forEach((function(t){P(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):j(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function P(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}const x=function(e){var t=(0,o.v9)(E),n=(0,o.I0)(),a=O((0,r.useState)("success-toast"),2),c=a[0],s=a[1];return(0,r.useEffect)((function(){"success"===t.type?s("success-toast"):"error"===t.type&&s("error-toast")}),[t]),r.createElement(r.Fragment,null,t.show&&r.createElement("div",{className:"position-fixed bottom-0 end-0 p-3"},r.createElement("div",{id:"liveToast",className:"toast show "+"".concat(c)},r.createElement("div",{className:"toast-header"},r.createElement(w.G,{icon:N.fV7,className:"FIcon"}),r.createElement("strong",{className:"me-auto toast-title-text ms-1"},t.type),r.createElement("small",null),r.createElement("button",{type:"button",className:"btn-close",onClick:function(){n(y(k(k({},t),{},{show:!1})))}})),r.createElement("div",{className:"toast-body"},t.text))))},C="lwmKV0Qhvo4YQwmCK_gk",L="bE7QEB5cEkbXfOPCDp4F",A="Wf3GFGUqGW4pIsgVyFFQ",I="IuriWVre8h4QFnNmhLBB",D="TFmV6BRwb5vnDtho_I4g",F="o0P2yfVqiVkCbn2nt8mZ",_="dLDwAj4O8wHM5k3R7tGk";var V=n(3376),z=new V.Lx({auth:{authority:"https://login.microsoftonline.com/{replace_tenantid}",clientId:"{replace_clientid}",redirectUri:"https://{replace_prefix}sdg-ui.azurewebsites.net/login",postLogoutRedirectUri:"https://{replace_prefix}sdg-ui.azurewebsites.net/login",navigateToLoginRequestUrl:!0},cache:{cacheLocation:"localStorage",storeAuthStateInCookie:!0}});z.getAllAccounts();z.addEventCallback((function(e){if(e.eventType===V.tw.LOGIN_SUCCESS&&e.payload){var t=e.payload.account;z.setActiveAccount(t)}}));const G=function(e){return r.createElement(r.Fragment,null,r.createElement("div",{className:C},r.createElement("div",{className:L},r.createElement("div",{className:"container"},r.createElement("div",{className:"row"},r.createElement("div",{className:"col-md-12"},r.createElement("div",{className:"".concat(I," my-4 pb-3")},r.createElement("div",{className:"text-center"},r.createElement("img",{className:A,src:n(9437)})),r.createElement("div",{className:"text-center"},r.createElement("p",{className:"mb-0 ".concat(D)},"Smart Search")))),r.createElement("div",{className:"col-md-12 text-center"},r.createElement("button",{className:"btn customBtn-1 ".concat(F),onClick:function(e){try{z.loginRedirect()}catch(e){}}},"Login")),r.createElement("div",{className:"col-md-12 my-3 text-center"},r.createElement("p",{className:"mb-0 ".concat(_)},"Copyright 2022 | Emtec Inc.")))))))};var R="/login",B="/error";const M=function(e){return r.createElement(c.VK,null,r.createElement(o.zt,{store:h},r.createElement(c.rs,null,r.createElement(c.AW,{exact:!0,path:R},r.createElement(G,null)),r.createElement(c.AW,null,r.createElement(c.l_,{to:B}))),r.createElement(p,null),r.createElement(x,null)))};!function(e){var t=e.dispatch;s.ZP.interceptors.request.use((function(e){return t(u(!0)),e}),(function(e){return t(u(!1)),Promise.reject(e)})),s.ZP.interceptors.response.use((function(e){return t(u(!1)),e}),(function(e){return t(u(!1)),Promise.reject(e)}))}(h);var U=(0,n(6630).Z)({React:r,ReactDOM:a,rootComponent:M,domElementGetter:function(){var e="login",t=document.getElementById(e);return t||((t=document.createElement("div")).id=e,document.body.appendChild(t)),t}}),Q=[U.bootstrap],T=[U.mount],W=[U.unmount]},9437:(e,t,n)=>{e.exports=n.p+"assets/images/32c88171f1515fb98825.ico"}}]);