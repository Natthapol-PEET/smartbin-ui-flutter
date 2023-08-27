'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "046bb01fffed7dedb568e1cd6ada3c4b",
"index.html": "358ece21a30aad4c5ff84a58c2712a84",
"/": "95a47e5ddbd736d2d87c28197fd36f7b",
"main.dart.js": "d471aa2232b7de5a60104c8c801f9910",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "4d7622f488f6e587fb03812b3563c357",
"assets/AssetManifest.json": "ab1c47b07fc5a70283e7489cac7e0c3d",
"assets/NOTICES": "a4f2d0c43d23e30c820e318969c7089f",
"assets/FontManifest.json": "e7046d53694f6b70cce785f65af60237",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/awesome_dialog/assets/rive/info_reverse.riv": "c6e814d66c0e469f1574a2f171a13a76",
"assets/packages/awesome_dialog/assets/rive/question.riv": "00f02da4d08c2960079d4cd8211c930c",
"assets/packages/awesome_dialog/assets/rive/warning.riv": "0becf971559a68f9a74c8f0c6e0f8335",
"assets/packages/awesome_dialog/assets/rive/info.riv": "2a425920b11404228f613bc51b30b2fb",
"assets/packages/awesome_dialog/assets/rive/success.riv": "73618ab4166b406e130c2042dc595f42",
"assets/packages/awesome_dialog/assets/rive/error.riv": "e74e21f8b53de4b541dd037c667027c1",
"assets/packages/awesome_dialog/assets/flare/succes.flr": "ebae20460b624d738bb48269fb492edf",
"assets/packages/awesome_dialog/assets/flare/succes_without_loop.flr": "3d8b3b3552370677bf3fb55d0d56a152",
"assets/packages/awesome_dialog/assets/flare/error.flr": "e3b124665e57682dab45f4ee8a16b3c9",
"assets/packages/awesome_dialog/assets/flare/info2.flr": "21af33cb65751b76639d98e106835cfb",
"assets/packages/awesome_dialog/assets/flare/warning_without_loop.flr": "c84f528c7e7afe91a929898988012291",
"assets/packages/awesome_dialog/assets/flare/info_without_loop.flr": "cf106e19d7dee9846bbc1ac29296a43f",
"assets/packages/awesome_dialog/assets/flare/warning.flr": "68898234dacef62093ae95ff4772509b",
"assets/packages/awesome_dialog/assets/flare/info.flr": "bc654ba9a96055d7309f0922746fe7a7",
"assets/packages/awesome_dialog/assets/flare/question.flr": "1c31ec57688a19de5899338f898290f0",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "1780c2f564503e8046b64dd01478bd58",
"assets/fonts/MaterialIcons-Regular.otf": "1b4dc172bdc1ffa7b84ddc0ebd2e9625",
"assets/assets/images/KUSE-SmartBin-Survey.jpg": "530dbde09b6f9a0d247e87bc4b613476",
"assets/assets/images/buttons/howto-back.png": "9552c315b06bb308f1af71b79365d868",
"assets/assets/images/buttons/exchange.png": "c858dbbfbdfc5d83f68e14f1d59c1030",
"assets/assets/images/buttons/look-score.png": "c4190dc575c31fe52ea34c068923c71a",
"assets/assets/images/buttons/back-short.png": "00edd9fdb27d4271453fd19075ad858f",
"assets/assets/images/buttons/submit.png": "fa6ebceed457fd3bcdd29fdb8452684d",
"assets/assets/images/buttons/howto.png": "34a7093619dd61883549c20292a6ce7e",
"assets/assets/images/buttons/start.png": "ca1ff579c8091cd20b4305c0a9e20016",
"assets/assets/images/powered-by-KUSE-Startup-House.png": "de1ac32adf01b2e6d7b4f59a79d223d8",
"assets/assets/images/qr-code.png": "8622a2769dec239d429032d370cd7909",
"assets/assets/images/bin_full.png": "412d8e7f1bde2dedceee8c44bffa9ea7",
"assets/assets/images/screens/thanks.png": "7d8b5c687d25544345854951d258867e",
"assets/assets/images/screens/howto.png": "110859866a5315e752d513db8726f6ae",
"assets/assets/images/icons/coffee.png": "598f370301e6b84f840f44a81cf24c22",
"assets/assets/images/icons/beer-can.png": "5ce5498e2b3c334bda72959a323e3bc1",
"assets/assets/images/icons/non-recycle.png": "58921d54effa1ebfa71865fcbe5c45aa",
"assets/assets/images/icons/plastic.png": "cee2720d0051c94b9d20ed108501a498",
"assets/assets/images/icons/relax.png": "63dbd9231afb402cf911071dbc8a2eb0",
"assets/assets/images/icons/qr-code.png": "de958ba8228da75e5e5656bbb92e22ec",
"assets/assets/images/icons/waste.png": "83870df422a5e745cd4652ce62c9fac7",
"assets/assets/images/icons/recycle.png": "eb2f2ca4b8f4cabe45f9895f2e910b5a",
"assets/assets/images/icons/user.png": "5bfb28ab533677833d23c65281337830",
"assets/assets/images/icons/wine.png": "e91fa1d0fbe65ffaf48349abc47c7f4c",
"assets/assets/images/icons/KUSE-logo.png": "d6fe44a1c4e69dffb88b399f1da56a20",
"assets/assets/images/icons/id.png": "4b1bf7bf40ebf4ed61527f254187f62b",
"assets/assets/images/icons/calendar.png": "e457eb8a0470bcae544ce0e1e1cbc012",
"assets/assets/images/icons/clock.png": "46ef2fc0e832b54cbab18de012a8705b",
"assets/assets/images/icons/saving.png": "d32a255893f3c72ef31c0dcdd0f229ab",
"assets/assets/images/icons/donate.png": "eba33472a76fb39e64e78ae509750631",
"assets/assets/images/bg.png": "070f120b423802aa43f76bf9828a55b1",
"assets/assets/images/gif/cant-thankyou-enough.gif": "00f6d8fa6b76db7905195764c349bf08",
"assets/assets/images/gif/thank-you.gif": "453380402609b9c46a98ac3f8824769c",
"assets/assets/sounds/gun.mp3": "473d244d45b235b6911937afd31dd724",
"assets/assets/videos/index.html": "95a47e5ddbd736d2d87c28197fd36f7b",
"assets/assets/videos/smart-bin.mp4": "a26bfb31a3196b2802bb9de9ecbb3b16",
"assets/assets/videos/introduction-smartbin.mp4": "8b6c35d35ca9532a0f4ec33ae31cdf0a",
"assets/assets/fonts/kanit/Kanit-ExtraLight.ttf": "8b786d6635f731d5bfe226e9f776531b",
"assets/assets/fonts/kanit/Kanit-SemiBold.ttf": "efc1b35c18175cae0b8a3d06e3025cbe",
"assets/assets/fonts/kanit/Kanit-Black.ttf": "98e93fc09832d3891a57162b83ecb930",
"assets/assets/fonts/kanit/Kanit-Regular.ttf": "ba95370355da928d1c09da6a0a49a1d6",
"assets/assets/fonts/kanit/Kanit-Thin.ttf": "c0b1b7e615614217544a2f588cc18188",
"assets/assets/fonts/kanit/Kanit-ExtraBold.ttf": "41df63b2d1938bf065ba71700f32b623",
"assets/assets/fonts/kanit/Kanit-Bold.ttf": "69646b07726772636b613cc5e12a1f28",
"assets/assets/fonts/kanit/Kanit-Light.ttf": "eb18967912c9c66c98deec24bfe1efbd",
"assets/assets/fonts/kanit/Kanit-Medium.ttf": "2fedce7deb446c41cc5274c226b43c04",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "89e7a5192ac57cc4a99334142c80d546",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "da6a55f713a56c43ddbea232df4926a5",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "4c9d551b2f568feeefa320e57a0d83fc",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
