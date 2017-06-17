'use strict';
define([], function() {
    function addCSS(url) {
        var head = document.querySelector('head');
        var link = document.createElement('link');
        link.setAttribute('rel', 'stylesheet');
        link.setAttribute('type', 'text/css');
        link.setAttribute('href', url);
        head.appendChild(link);
    }

    return {
        boot: function(el, context, config, mediator) {

            // Loading message while we fetch JS / CSS
            el.innerHTML = '<div style="font-size: 24px; text-align: center; padding: 72px 0; font-family: \'Guardian Egyptian Web\',Georgia,serif;">Loading…</div>';

            var interactiveConfig = {
                'assetPath': '<%= assetPath %>',
                // // Brexit Shorts — Manchester Remain voter
                // // Shattered
                // 'sheetId': '1yTsGNjQ6mHfnDSrdBwD0AXRYw5j-REOl46g051IERGk',
                // // Brexit Shorts — Mansfield ambiguous voter:
                // // Burn
                // 'sheetId': '1xE2oxEndiixxdUUhyToQB5VCV2yG-Mw5c-WeamHgq6g',
                // // Brexit Shorts — Abergevenny Leave voter:
                // // The Pines
                // 'sheetId': '1claeNsZaOJF7jPLYHLyJIt9yDnV4gOKuLpLe4uz4bXE',
                // // Brexit Shorts — London Remain voter:
                // // Better Together
                // 'sheetId': '100ODEcpoVHmEHkt5Q3SQfOtXuY65us77aeDrgfSatWM',
                // // Brexit Shorts — Wigan Leave voter:
                // // Go Home
                // 'sheetId': '1iMNjUcJAahucLXBfw_ZtTEetNXYZJPg2kDMNBHuLjVM',
                // // Brexit Shorts — Belfast Remain voter:
                // // Your Ma’s…
                // 'sheetId': '1K6q_7Omak9bI82NQ_267J8hVxT2CojlYyTUwxx66gBQ',
                // // Brexit Shorts — Wolverhampton Leave voter:
                // // Just a T-shirt
                // 'sheetId': '1nAuVXi-suIlGy7V6PGETTZChty27meEyDMv0toTpDbY',
                // // Brexit Shorts — Glasgow Remain voter:
                // // Permanent Sunshine
                // 'sheetId': '1UGSp7ZnS0ylOtNCuZlIq1iN8rLD2IdFTfJk_9xGWg3I',
                // // Brexit Shorts — Winchester Leave voter:
                // // Time to leave
                'sheetId': '1NRj-Qaz7ZpqHqegbGOcTFxMPPgw2wSdGa7v11timCPQ'
            };

            if (config) {
                if (typeof Object.assign != 'function') {
                  (function () {
                    Object.assign = function (target) {
                      'use strict';
                      // We must check against these specific cases.
                      if (target === undefined || target === null) {
                        throw new TypeError('Cannot convert undefined or null to object');
                      }

                      var output = Object(target);
                      for (var index = 1; index < arguments.length; index++) {
                        var source = arguments[index];
                        if (source !== undefined && source !== null) {
                          for (var nextKey in source) {
                            if (source.hasOwnProperty(nextKey)) {
                              output[nextKey] = source[nextKey];
                            }
                          }
                        }
                      }
                      return output;
                    };
                  })();
                }

                Object.assign(interactiveConfig, config);
            }

            //lifted from frontend
            //see: https://github.com/guardian/frontend/blob/master/common/app/views/support/GoogleAnalyticsAccount.scala
            if (! interactiveConfig.googleAnalytics) {
                Object.assign(interactiveConfig, {
                    googleAnalytics: {
                        trackers: {
                            editorial: 'allEditorialPropertyTracker',
                            editorialProd: 'allEditorialPropertyTracker',
                            editorialTest: 'guardianTestPropertyTracker'
                        }
                    }
                });
            }

            // Load CSS asynchronously
            window.setTimeout(function() {
                addCSS('<%= assetPath %>/main.css');
            }, 10);

            // Load JS and init
            require(['<%= assetPath %>/main.js'], function(main) {
                main.init(el, context, interactiveConfig, mediator);
            }, function(err) { console.error('Error loading boot.', err); });
        }
    };
});
