'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "fe93fb0ebcd8cef96f3be081ae3a0ca8",
".git/config": "22f8432d6915fb0556e80333eab973a0",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "753b0021d16807daef1aa159c7b5b1fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "6c7b8ab41b06ad221db5d58d2020f9d8",
".git/logs/refs/heads/gh-pages": "224d729ad53ddb5870fcb5aa1aa51400",
".git/logs/refs/remotes/origin/gh-pages": "47410a9ed6ce9b852ef2131399b864f4",
".git/objects/07/74c17c0fa7a7e87e24a6935830998d92b52c75": "cd62ee54b7ceea7b2a7804e69b1d9134",
".git/objects/0c/34bce79e27c9a5bfd328543d966e3ceb704c40": "0989b4e33fbba5bbd3f3cbc4626834fc",
".git/objects/12/2f5fe280c8d1d6675b9e6a41772b2f4d097731": "99561b9dbfaf08cff42671de65c5e9e8",
".git/objects/13/822387760a897bebef260feae285df093f3ab6": "cf5635c6a71ba0d95c14c67b49502ea5",
".git/objects/16/5ce0ddf03a820a38f48cba9aa0c9df9b6e6b79": "71df17c95c3124eada62b59e7dabda78",
".git/objects/19/9ce45d0cc5c2d74f65c33a4b416e686a99e14c": "af1840e4c430968088b5d7dabd0d9c25",
".git/objects/1a/7c39372a9612f035dc08019d72da4627ddc52c": "6f190dffb5659506f2c5b81311a39a3c",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/20/40ddf592db02ad843b196e82ca93b0ccfdf0c7": "59a01377163e6f62ea470044106f2b14",
".git/objects/2c/914f6512e03587cba55d2a18da8caa9abadd22": "7e22d9ba6acbd085ce0f6703697ff9fa",
".git/objects/2f/acff81d5c95cfb181146cdd8a92f07affd6b9a": "0928a3d0e94b68386bd17f0e3755a446",
".git/objects/36/930f6ecd24b3db094cb0a4e06c04b1e4f78463": "d0949880e8ecd22f68be34a1de5f9e8a",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/3d/7337844a8a2631e3ff03da318279609f293ed8": "c761f9354641101820cbdf147bcb66fc",
".git/objects/41/d89615058bb252067c8844ca903a1c7bf167e9": "a9db53a9d4da173e5eb0c7cc0540a5b6",
".git/objects/49/a0b4dd8cf9649d146e803319a34192234a4324": "0356917588e0519f8b5a748df8abb569",
".git/objects/4a/39079e580dc9be820cba2fae41238c49eaa798": "ada1a19fea32fbb6719120809b9eae60",
".git/objects/4b/8d685ac1c84b073b6d099780922e90a5e72f44": "c71bdd80095e2f88f59bed7a5d5b460e",
".git/objects/53/6354fcbcaff6248e7d3324d3c824866bbc3427": "a740b9bbd1f7751bb6817cedcdbb4930",
".git/objects/5a/7b05e1be311772247124911182fda78fde2cec": "d38bfbb93663df272dc4920186bd1040",
".git/objects/5c/05d0b730d2419cec11613fe902095439758a68": "9e06536a3c252300b36da44e431ad136",
".git/objects/66/ab41afb76f82adb7117c1dad0de8a7b9613a8e": "f0455b828bf3945351221cbf03089454",
".git/objects/6f/9cad4c116bc8d72e2497226abb5c05ee64982c": "0d104480d68c1652a53721377a02a882",
".git/objects/70/5bd88c97741814f3ff2c3551f6ab74bc05149b": "4683e7463a202aad0800007d56f1aa10",
".git/objects/71/7117947090611c3967f8681ab1ac0f79bca7fc": "ad4e74c0da46020e04043b5cf7f91098",
".git/objects/71/7809363ed19bdd7e1d78f6e421e40a96bc29e3": "9414a3044cb191cc3f57340f57c3dc93",
".git/objects/75/de5779d8182fa255bf309ff503985616e6a56a": "8a4e0b0cb258c1a9bfc29c13bef8614d",
".git/objects/81/81bbb43962c74a5abaa0bfd464894b00bbea04": "c3b4d72ac730da3bce8366fbea2abd77",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8d/705dd35e863202d6108b273fb26091f3a4251d": "c131eb26a3da2650564c0028782e5eda",
".git/objects/94/bfb1463ad8331bfd687bc751b8920b133da744": "fd2d8c0d844b234856b36b93f652048f",
".git/objects/98/b0a4bd152494fe29fc5e2b3639e98614f34fd1": "6cfca425b9a5f96a2e0143bb1119c514",
".git/objects/ad/fc8941688b15b4ba0f440f0214440823bf962d": "5fa0aa834b739a17aa8ec5c983c6ad0c",
".git/objects/af/742adee0a85dd21ea96cbd84182e30e085d6cf": "aa25b932ec40efacb1efe27e7cf25d82",
".git/objects/b2/551ff8b12223863ea939dfaa3fabc7fa51c5e3": "e786103b2b5d2cf72e0602473e4d902f",
".git/objects/b5/0254288cc6319d153c4af1d64870d95ee2436f": "468a6506934a07c970a4739eae75eedd",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c5/f4bc2a4da91586f3005813077f0d0aa9040f82": "3191028b787554cee4652f5050144bff",
".git/objects/c8/2e4383acdb64abebbd1cef179b93725810d711": "d238190b39b014ceec3f19321a266eff",
".git/objects/cf/596f72c0d01ab45d78be35309c1e61d9399adc": "1948e9180714ea928e973f81a752ff0d",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/e6/129d5033f4e7198193b0206f01e6164f89c472": "2c1d538688e5670cce5dd37c4b510aa8",
".git/objects/e8/2c5850db3a3482d0c954a4dc122c02de555ce7": "d357cd906b3805bf81477f5527cca086",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/eb/a9a3889aa188b49baa079defb12371f3e8cfe7": "f730a24277ec6792d684e0a516e211d4",
".git/objects/ec/5bd855f7b77b5afd9ba2baec3ac12d94883c33": "b5a47e0463e9b44f8a89a3a81a661126",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f3/8bd8bad77ca0fb37745edaf4d4feb1a16053fc": "1a73afb8ba39313ca2e32631392f98aa",
".git/objects/ff/6b2cd8ef6bf475cd1d698790c0b707516faf51": "4ea9f67a0854bf2523fc90c0b58b9728",
".git/refs/heads/gh-pages": "6199e802bc26cd9924e75dca65039cbe",
".git/refs/remotes/origin/gh-pages": "6199e802bc26cd9924e75dca65039cbe",
"assets/AssetManifest.bin": "8d8e334858fd5a71c140c32d985ef366",
"assets/AssetManifest.bin.json": "9dfa98f0724dd9d8bb1ba2e2cd026d56",
"assets/AssetManifest.json": "a952f1c1e3a2709643943cbbad3205a6",
"assets/assets/background.png": "af0547a480d0e7cb216a251885dd9fec",
"assets/assets/BB8.svg": "8c25c76ae929f6eb49b9cd67c015bb35",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "9855ba3f92bc854c40b24e3d321e2248",
"assets/NOTICES": "d8a7f2d61662630dc160c9da27cee933",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "5fd581eb443646a229ce2d737dba62b4",
"/": "5fd581eb443646a229ce2d737dba62b4",
"main.dart.js": "57ce1acb28e82cff638c5dcdd7cc4315",
"manifest.json": "dcae6f744eb14576c75321339341711c",
"version.json": "a0884baa103dff676f5f2dcc39fb5078"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
