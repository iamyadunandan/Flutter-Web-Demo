'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "3dc583d3ddfd779504e62e80f4580187",
"/manifest.json": "c171d393aab99f03a5b3bc431fd04eb9",
"/main.dart.js": "8f9c6c74b53b751df298a5a722ca5e15",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/FontManifest.json": "3fe4755cf7cfcbd8e65e644e5714b985",
"/assets/LICENSE": "7998cb9014babbe91646f68837ca1c64",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/assets/quick_kiss.ttf": "9a6ca307808e5b7ff1efe983307e39d0",
"/assets/assets/me.png": "4ab8078214b6c5e8ab367c08134c1f80",
"/assets/assets/leg.png": "7c6597592ab1ac97b760b67148d4703e",
"/assets/assets/pizza.png": "7f9ceee7e255e1027f72b0642aeb9aec",
"/assets/assets/ZillaSlab-Medium.ttf": "2164de8f7530fb8f529d2a3be0a34da6",
"/assets/assets/omlet.png": "5ee2f61f5f280cb19c1077ec8cc4b460",
"/assets/assets/melon.png": "3a6d6ddb899152802ce93c1078aab622",
"/assets/AssetManifest.json": "d2af45c5ab109fd2ce9e5b9d4ee42c4f",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
