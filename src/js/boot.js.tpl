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
                  ["global/ng-interactive/2018/jan/04/stoke-series-1", "made-in-stoke"],
                  ["world/ng-interactive/2016/oct/14/desert-fire-the-world-cup-rebels-of-kurdistan-video", "desert-fire"],
                  ["world/ng-interactive/2017/jan/06/radical-brownies-berets-badges-and-social-justice-video", "radical-brownies"],
                  ["world/ng-interactive/2017/feb/10/quipu-the-phone-line-calling-for-justice-in-peru-video", "quipu"],
                  ["world/ng-interactive/2017/mar/10/the-internet-warriors-meet-the-trolls-in-their-own-homes-video", "the-internet-warriors"],
                  ["technology/ng-interactive/2017/apr/07/meet-erica-the-worlds-most-autonomous-android-video", "erica-man-made"],
                  ["sport/ng-interactive/2017/may/12/the-sprinters-factory-the-tournament-where-girls-compete-to-be-jamaicas-next-top-sprinters", "the-sprinter-factory"],
                  ["world/ng-interactive/2017/apr/28/the-valley-rebels-the-french-farmer-helping-refugees-cross-europe-video", "the-valley-rebels"],
                  ["world/ng-interactive/2017/apr/13/crossing-boundaries-crabs-asylum-seekers-and-therapy-on-christmas-island-video", "the-island"],
                  ["world/ng-interactive/2017/may/05/fighting-for-a-pension-disability-rights-protesters-in-bolivia-face-barricades", "the-fight"],
                  ["world/ng-interactive/2017/jun/16/chalk-girl-hong-kong-democracy-umbrella-movement-protester-china", "the-infamous-chalk-girl"],
                  ["film/ng-interactive/2017/jun/30/fish-story-anglesey-video-fish-surnames", "fish-story"],
                  ["world/ng-interactive/2017/jul/14/pitching-up-ancient-sports-for-children-in-irelands-most-ethnically-diverse-town", "pitching-up"],
                  ["us-news/ng-interactive/2017/aug/04/dearborn-michigan-divided-muslim-american-donald-trump-documentary", "dearborn-michigan"],
                  ["world/ng-interactive/2017/sep/07/second-innings-how-cricket-is-helping-three-afghan-boys-build-a-new-life-in-london", "second-innings"],
                  ["world/ng-interactive/2017/sep/22/qandeel-baloch-the-life-death-and-impact-of-pakistans-working-class-icon", "qandeel"],
                  ["world/ng-interactive/2017/oct/06/home-match-a-young-ukrainian-woman-torn-between-football-and-family", "home-match"],
                  ["world/ng-interactive/2017/oct/27/muxes-documentary-the-mexican-town-where-gender-is-fluid", "muxes"],
                  ["world/ng-interactive/2017/nov/24/on-the-road-living-and-working-on-the-italian-road-of-love", "on-the-road"],
                  ["global/ng-interactive/2017/dec/01/killing-gavle", "killing-gävle"],
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
