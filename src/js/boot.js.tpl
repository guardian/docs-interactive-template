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
                'comingSoonSheetName': 'coming-soon',
                'sheetId': '1sOLD9mq0B_yIqmCxbeIyI4lp48qgoAWx8aJJVoEj2v8',
                'docsArray':
                [
                  ["world/ng-interactive/2016/sep/16/gun-nation-a-journey-to-the-heart-of-americas-gun-culture-video", "gun-nation"],
                  ["world/ng-interactive/2017/mar/10/the-internet-warriors-meet-the-trolls-in-their-own-homes-video", "the-internet-warriors"],
                  ["uk-news/ng-interactive/2018/jan/08/made-in-stoke-on-trent-episode-1-the-plate-turners-club", "made-in-stoke-episode-1"],
                  ["uk-news/ng-interactive/2018/jan/08/made-in-stoke-on-trent-episode-2-1-for-a-house", "made-in-stoke-episode-2"],
                  ["uk-news/ng-interactive/2018/jan/08/made-in-stoke-on-trent-episode-3-prevail", "made-in-stoke-episode-3"],
                  ["uk-news/ng-interactive/2018/jan/08/made-in-stoke-on-trent-episode-4-a-potted-history", "made-in-stoke-episode-4"],
                  ["uk-news/ng-interactive/2018/jan/08/made-in-stoke-on-trent-episode-5-salvage-operation", "made-in-stoke-episode-5"],
                  ["uk-news/ng-interactive/2018/jan/08/made-in-stoke-on-trent-episode-6-the-mother-town", "made-in-stoke-episode-6"],
                  ["uk-news/ng-interactive/2018/jan/08/made-in-stoke-on-trent-episode-7-two-sides-to-every-story", "made-in-stoke-episode-7"],
                  ["uk-news/ng-interactive/2018/jan/08/made-in-stoke-on-trent-episode-8-judgment-day", "made-in-stoke-episode-8"],
                ],
                'emailListId': 3745
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
