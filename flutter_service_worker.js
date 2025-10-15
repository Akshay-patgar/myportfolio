'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "a8297d555dd34879e8e48e1cf12acefa",
".git/config": "9886c62289064872ba666a50db3ac01b",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "ea5fe7a86f712b524063a60116e3cd30",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "104f927e644396b68ba350068283a2dd",
".git/logs/refs/heads/main": "bf510f0bb80b814d017d32775ab77c11",
".git/logs/refs/remotes/origin/main": "e6e168cfee963190144896cbf3e0f599",
".git/objects/02/1d4f3579879a4ac147edbbd8ac2d91e2bc7323": "9e9721befbee4797263ad5370cd904ff",
".git/objects/07/9c7695eaa1bfebdc7dd7f28cfdccaa8cadecf2": "826d9488e9c92b4f594fa0551a3beaf1",
".git/objects/0d/6b5fbd85e612eea4051d21a9e90f91db6d5be8": "af3f2c71301a9e3230e2d13d5482dc9f",
".git/objects/1b/6d346896ec52da7f59fdc10bf108a9e1f430c7": "2f0b03fb3684363f18a7f2031d112216",
".git/objects/1d/72a688db5545a1977f4dfc65cd671d14529fd8": "058a09a13fbae14edc7eb06284ad2c38",
".git/objects/20/3a3ff5cc524ede7e585dff54454bd63a1b0f36": "4b23a88a964550066839c18c1b5c461e",
".git/objects/29/f22f56f0c9903bf90b2a78ef505b36d89a9725": "e85914d97d264694217ae7558d414e81",
".git/objects/32/8d8e4eb905ca692f985d8c7b8db20407c436f3": "4653d78c8b0e485b629f453e213039f1",
".git/objects/43/a07191825c43824934034ccfb0fb01bceb55c6": "0ac3aeafee6b731921e2cb3dae4ca3f8",
".git/objects/43/f566a980f03430a783f6ace30a63dbbb80e1e1": "97a697044752504f74cbe35fbf9e65b3",
".git/objects/4b/825dc642cb6eb9a060e54bf8d69288fbee4904": "75589287973d2772c2fc69d664e10822",
".git/objects/4c/51a45db6bc20f2c5e7ed056124fd1c0b4a1f71": "b5f05f77c45181f6716393d00315c048",
".git/objects/4d/bf9da7bcce5387354fe394985b98ebae39df43": "534c022f4a0845274cbd61ff6c9c9c33",
".git/objects/4f/fbe6ec4693664cb4ff395edf3d949bd4607391": "2beb9ca6c799e0ff64e0ad79f9e55e69",
".git/objects/66/fc3b84b4cc6f1cce286ac4b55415c9a18d3298": "07f25a5813c13eb8399e341580c24237",
".git/objects/69/1ce28cf25e723c35b09bbd07cf4de698979e93": "9168181022e5ac5c3881f0a58a5e2a50",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/7a/6c1911dddaea52e2dbffc15e45e428ec9a9915": "f1dee6885dc6f71f357a8e825bda0286",
".git/objects/7b/d3ae7528e01f9558f839e4dfbc46b29dbb90ed": "06780128ff3fba7f9381fd2bee8717ff",
".git/objects/80/3417a1a9a439e905a2d86685b41fced6362976": "02fb10b7f88537689a6735584716cf35",
".git/objects/86/3a91ac3e4f442a8bb8d36d8a5fc28572ce5023": "a4a1e2371288afc919fac07975b88f6e",
".git/objects/87/14ccbfed99e9d345fed464dfbf3dbc1ae7837a": "98c5af417006b02b364c5d9d73d69641",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/98/0d49437042d93ffa850a60d02cef584a35a85c": "8e18e4c1b6c83800103ff097cc222444",
".git/objects/9b/3ef5f169177a64f91eafe11e52b58c60db3df2": "91d370e4f73d42e0a622f3e44af9e7b1",
".git/objects/9c/e2bfe36aa534a7ef3d1dbae8b1d47005ee3f04": "d5b80b6f097d968b5322881cd1ff298a",
".git/objects/9e/3b4630b3b8461ff43c272714e00bb47942263e": "accf36d08c0545fa02199021e5902d52",
".git/objects/a1/9b20038a387240aa3cf9ab3d272ef8a1190952": "81d011df47f5a7c860eecffd4c8da1e7",
".git/objects/a3/d6c650bbe25aaa2603b0df439b4df4d02853e7": "08b82833858184f51b1866e1b5932adc",
".git/objects/a7/c81230e11ea4f683a302a00b7b095e0f63ef0d": "cde9b6f3978e6d7e6f41f4fb82881a29",
".git/objects/ad/c3f44683e33607083f4d560d97820fddd83399": "7b8f37c34e830d84587b7fa00d0272e1",
".git/objects/b6/b8806f5f9d33389d53c2868e6ea1aca7445229": "b14016efdbcda10804235f3a45562bbf",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c0/041aa2c4604ffbd561daa5c33b407894c4daf2": "8b292498ce68d01509d45f33fb3db8d5",
".git/objects/c4/016f7d68c0d70816a0c784867168ffa8f419e1": "fdf8b8a8484741e7a3a558ed9d22f21d",
".git/objects/c4/ad78cee00c9d1d4c64034177cf55f02eafe374": "ae4c2698e888fd384881ee9d3cfe6c38",
".git/objects/ca/3bba02c77c467ef18cffe2d4c857e003ad6d5d": "316e3d817e75cf7b1fd9b0226c088a43",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/de/3712a05122064e187c51b696b3c9e612084df0": "a9bf690b4bdc6e518dccbc63c8411e3a",
".git/objects/e0/5fa7d175b844dacb434871ff363a10b4393d5e": "f5ba0833160857d3f7e1291e45e158c3",
".git/objects/e3/e9ee754c75ae07cc3d19f9b8c1e656cc4946a1": "14066365125dcce5aec8eb1454f0d127",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/ea/78a50a39985c1fdfadc4d136fa16d24d79402f": "6cafd02846acf60ccda83e7487d29a24",
".git/objects/ea/ba0c5e088000b49012647832aaabe5da3afba3": "ad22838b8bc6a7175af573d164ec20be",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ed/9a38337e9b1757bc3e18940d8938e26853c4fc": "36034ff6099fc061f0d8efd343880a26",
".git/objects/ed/b55d4deb8363b6afa65df71d1f9fd8c7787f22": "886ebb77561ff26a755e09883903891d",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f5/d89c2beae71afeeecba8d57490316c0ca27758": "c8d02cb826b786420b3b3d9359aafe6b",
".git/objects/fe/3b987e61ed346808d9aa023ce3073530ad7426": "dc7db10bf25046b27091222383ede515",
".git/objects/ff/8ccb6efe0a01e378d8acd4d97fdb8f9f3bfe30": "fdf40cf8d579934e6340a938f7ed6160",
".git/refs/heads/main": "7a6c84341426b367eb5185983876828e",
".git/refs/remotes/origin/main": "7a6c84341426b367eb5185983876828e",
"assets/AssetManifest.bin": "3d30786e338e5c1175336fb794427a18",
"assets/AssetManifest.bin.json": "611222a4c5cfefc109d9fcf443696cc6",
"assets/AssetManifest.json": "6af7c691d6ef2025cb817b54e0812e80",
"assets/assets/profile.png": "8f38b3fbdb2d9873fc1df08562a14b6a",
"assets/FontManifest.json": "97c2528ecc2fbf4093965257fdba1854",
"assets/fonts/MaterialIcons-Regular.otf": "7ae9286017600813fdb3f876bef07fae",
"assets/NOTICES": "2897e4d79445d298ac1aeba72470f731",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/Font%2520Awesome%25207%2520Brands-Regular-400.otf": "e0d4029b5ee47981b2e0e2bfe31bf707",
"assets/packages/font_awesome_flutter/lib/fonts/Font%2520Awesome%25207%2520Free-Regular-400.otf": "df86a1976d76bd04cf3fcaf5add2dd0f",
"assets/packages/font_awesome_flutter/lib/fonts/Font%2520Awesome%25207%2520Free-Solid-900.otf": "e939cd2e1825bd79cc22193c1df67f32",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "d82644ee0bf9373428468dbacad27a0e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "cc63311221a4bad5875830d0159c3eef",
"/": "cc63311221a4bad5875830d0159c3eef",
"main.dart.js": "ab3a25024c94ea7c07731dc3519c3dce",
"manifest.json": "07f66434d604ccac1b4d5244f35598aa",
"version.json": "7367c9ca1c69727a8bb09a7d2d21d48c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
