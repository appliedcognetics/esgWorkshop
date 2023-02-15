"use strict";(self.webpackChunk_dms_app_shell=self.webpackChunk_dms_app_shell||[]).push([[515],{1515:(e,t,n)=>{n.r(t),n.d(t,{NavBar:()=>$,bootstrap:()=>te,mount:()=>ne,unmount:()=>re});var r=n(2784),a=n(8316),c=n(3382),o=n(1031),l=n(6178),s=n(6164),i=(0,s.oM)({name:"fullscreenloader",initialState:{loading:!1},reducers:{setLoading:function(e,t){e.loading=t.payload}}}),u=i.actions.setLoading,m=function(e){return e.fullscreenloader.loading};const f=i.reducer;const d=function(e){var t=(0,o.v9)(m);return r.createElement(r.Fragment,null,t&&r.createElement("div",{className:"overlay"},r.createElement("div",{className:"text-center middleloader"},r.createElement("div",{className:"imageAnim"}))))};var p=(0,s.oM)({name:"navbar",initialState:{demo:!0},reducers:{setDemo:function(e,t){e.demo=t.payload}}});p.actions.setDemo;const b=p.reducer;var v=(0,s.oM)({name:"popupblock",initialState:{show:!1,type:"success",text:""},reducers:{setStatusOfPopup:function(e,t){e.show=t.payload.show,e.type=t.payload.type,e.text=t.payload.text}}}),y=v.actions.setStatusOfPopup,g=function(e){return e.popupblock};const E=v.reducer;var h=(0,s.xC)({reducer:{navbar:b,fullscreenloader:f,popupblock:E}}),N=n(7370),w=n(9725);function x(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var n=null==e?null:"undefined"!=typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null==n)return;var r,a,c=[],o=!0,l=!1;try{for(n=n.call(e);!(o=(r=n.next()).done)&&(c.push(r.value),!t||c.length!==t);o=!0);}catch(e){l=!0,a=e}finally{try{o||null==n.return||n.return()}finally{if(l)throw a}}return c}(e,t)||function(e,t){if(!e)return;if("string"==typeof e)return S(e,t);var n=Object.prototype.toString.call(e).slice(8,-1);"Object"===n&&e.constructor&&(n=e.constructor.name);if("Map"===n||"Set"===n)return Array.from(e);if("Arguments"===n||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n))return S(e,t)}(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function S(e,t){(null==t||t>e.length)&&(t=e.length);for(var n=0,r=new Array(t);n<t;n++)r[n]=e[n];return r}function O(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function j(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?O(Object(n),!0).forEach((function(t){A(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):O(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function A(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}const k=function(e){var t=(0,o.v9)(g),n=(0,o.I0)(),a=x((0,r.useState)("success-toast"),2),c=a[0],l=a[1];return(0,r.useEffect)((function(){"success"===t.type?l("success-toast"):"error"===t.type&&l("error-toast")}),[t]),r.createElement(r.Fragment,null,t.show&&r.createElement("div",{className:"position-fixed bottom-0 end-0 p-3"},r.createElement("div",{id:"liveToast",className:"toast show "+"".concat(c)},r.createElement("div",{className:"toast-header"},r.createElement(N.G,{icon:w.fV7,className:"FIcon"}),r.createElement("strong",{className:"me-auto toast-title-text ms-1"},t.type),r.createElement("small",null),r.createElement("button",{type:"button",className:"btn-close",onClick:function(){n(y(j(j({},t),{},{show:!1})))}})),r.createElement("div",{className:"toast-body"},t.text))))},P="Yq7I7H9VC5ZTxyM7foGL",I="rN3gAnbGTYWbvD2Aa8Nx",C="VWXa9l80L_pNTm30scwE",L="MCSPwaEOLn8ZzDoENYG6",T="W74iekZ2S2RLjvLv2_gU",D="Fy7Zn9UcEnDhce_miQZW",U="oJ4LJRRlTmnpJjEjpDz2",V="RtmmSygeWo30DVwsB8xI",Z="dmzxVusftkHEWFoJ18Q8",_="O8hV9TjUcRLiFw5FXaaE",M="aLta8lu1Vc1Ne4lztAsg",R="YTD_p9S0pcaGi87Xfvgk",F="ToFcNZi91ZJV_e9SKvvs",z="dHhrxX5yhnHmQE3UacC1",B="AjQVv6opZWYdTgiUXEhX",W="cw7lhfi23IITrIbkBU7A",X="hMFP0Trbilvwt0VOEBUf",G="QtVv5k35D8h40w9MzUoX";var J=n(3376);function Q(e){return function(e){if(Array.isArray(e))return q(e)}(e)||function(e){if("undefined"!=typeof Symbol&&null!=e[Symbol.iterator]||null!=e["@@iterator"])return Array.from(e)}(e)||H(e)||function(){throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function Y(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){var n=null==e?null:"undefined"!=typeof Symbol&&e[Symbol.iterator]||e["@@iterator"];if(null==n)return;var r,a,c=[],o=!0,l=!1;try{for(n=n.call(e);!(o=(r=n.next()).done)&&(c.push(r.value),!t||c.length!==t);o=!0);}catch(e){l=!0,a=e}finally{try{o||null==n.return||n.return()}finally{if(l)throw a}}return c}(e,t)||H(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function H(e,t){if(e){if("string"==typeof e)return q(e,t);var n=Object.prototype.toString.call(e).slice(8,-1);return"Object"===n&&e.constructor&&(n=e.constructor.name),"Map"===n||"Set"===n?Array.from(e):"Arguments"===n||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)?q(e,t):void 0}}function q(e,t){(null==t||t>e.length)&&(t=e.length);for(var n=0,r=new Array(t);n<t;n++)r[n]=e[n];return r}const K=function(e){var t=(0,c.k6)(),a=Y((0,r.useState)({}),2),o=a[0],l=a[1],s=Y((0,r.useState)(!1),2),i=s[0],u=s[1],m=new J.Lx({auth:{authority:"https://login.microsoftonline.com/{replace_tenantid}",clientId:"{replace_clientid}",redirectUri:"https://{replace_prefix}sdg-ui.azurewebsites.net/login",postLogoutRedirectUri:"https://{replace_prefix}sdg-ui.azurewebsites.net/login",navigateToLoginRequestUrl:!0},cache:{cacheLocation:"localStorage",storeAuthStateInCookie:!0}}),f=Y((0,r.useState)([{route:"/v2-library",name:"Library"}]),2),d=f[0],p=f[1];(0,r.useEffect)((function(){var e;e=m.getAllAccounts(),l(e.length>0?e[0]:{}),v()}),[]);var b=function(e){var n;n=e.route,t.push(n),p([].concat(Q(d),[]))},v=function(e){return window.location.pathname.includes(e)};return r.createElement("div",{className:"row ".concat(P)},r.createElement("div",{className:"col-md-12 d-flex"},r.createElement("div",{className:"flex-8 align-self-center"},r.createElement("div",{className:"d-flex align-self-center p-1"},r.createElement("div",{className:"d-inline-flex ".concat(C)},r.createElement("img",{className:I,src:n(7446)})),r.createElement("div",{className:"d-inline-flex align-self-center p-1 ".concat(L)},r.createElement("p",{className:"mb-0"},"Smart Search")))),r.createElement("div",{className:"flex align-self-center"},r.createElement("ul",{className:"".concat(X)},d.map((function(e,t){return r.createElement("li",{key:t,className:"d-flex ".concat(T," ").concat(v(e.route)?Z:""),onClick:function(){b(e)}},r.createElement("div",{className:"d-inline-flex align-self-center ".concat(U)},r.createElement("img",{src:n(1418)})),r.createElement("div",{className:"d-inline-flex align-self-center ".concat(D)},r.createElement("p",{className:"mb-0 align-self-center ".concat(G)},e.name)),r.createElement("div",{className:"d-inline-flex align-self-center ".concat(V)},r.createElement("img",{src:n(6466)})))})))),r.createElement("div",{className:"flex align-self-center"},r.createElement("div",{className:"d-inline-block align-self-center"},r.createElement("img",{onClick:function(){u(!i)},className:R,src:n(9705)})),i&&r.createElement("div",{className:"overlay",onClick:function(e){e.stopPropagation(),p([].concat(Q(d),[])),u(!1)}},r.createElement("div",{id:"profileBlock",onClick:function(e){e.stopPropagation()},className:_},r.createElement("div",{className:"d-flex mb-3"},r.createElement("div",{className:"d-inline-flex align-self-center"},r.createElement("img",{className:M,src:n(8601)})),r.createElement("div",{className:"d-inline align-self-center"},r.createElement("div",null,r.createElement("p",{className:"mb-0 ".concat(F)},o.name)),r.createElement("div",null,r.createElement("p",{className:"mb-0 ".concat(B)},"Admin")),r.createElement("div",null,r.createElement("p",{className:"mb-0 ".concat(W)},o.username)))),r.createElement("div",null,r.createElement("button",{className:" ".concat(z," btn customBtn-1"),onClick:function(){m.logoutRedirect()}},"Logout")))))))};const $=function(e){return r.createElement(c.VK,null,r.createElement(o.zt,{store:h},r.createElement(K,null),r.createElement(d,null),r.createElement(k,null)))};!function(e){var t=e.dispatch;l.ZP.interceptors.request.use((function(e){return t(u(!0)),e}),(function(e){return t(u(!1)),Promise.reject(e)})),l.ZP.interceptors.response.use((function(e){return t(u(!1)),e}),(function(e){return t(u(!1)),Promise.reject(e)}))}(h);var ee=(0,n(6630).Z)({React:r,ReactDOM:a,rootComponent:$,domElementGetter:function(){var e="navbar-ui",t=document.getElementById(e);return t||((t=document.createElement("div")).id=e,document.body.appendChild(t)),t}}),te=[ee.bootstrap],ne=[ee.mount],re=[ee.unmount]},1418:(e,t,n)=>{e.exports=n.p+"assets/images/6d0aa38d2fbe513cc19a.svg"},6466:(e,t,n)=>{e.exports=n.p+"assets/images/103653bb48b1250e90d5.svg"},7446:(e,t,n)=>{e.exports=n.p+"assets/images/23b9dc37cf64257c8d84.svg"},9705:(e,t,n)=>{e.exports=n.p+"assets/images/9bbc5f6d909aad6af41d.svg"},8601:(e,t,n)=>{e.exports=n.p+"assets/images/a5bf130b5a5bd5d08bb6.svg"}}]);