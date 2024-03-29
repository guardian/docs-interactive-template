'use strict';
define([], function () {
    function addCSS(url) {
        var head = document.querySelector('head');
        var link = document.createElement('link');
        link.setAttribute('rel', 'stylesheet');
        link.setAttribute('type', 'text/css');
        link.setAttribute('href', url);
        head.appendChild(link);
    }

    return {
        boot: function (el, context, config, mediator) {

            console.log('1212');

            // Loading message while we fetch JS / CSS
            el.innerHTML = '<div style="font-size: 24px; text-align: center; padding: 72px 0; font-family: \'Guardian Egyptian Web\',Georgia,serif;">Loading…</div>';

            var interactiveConfig = {
                'assetPath': '<%= assetPath %>',
                'comingSoonSheetName': 'coming-soon',
                'sheetId': '1jYb4okCk7I42wCoduH-o48DE-EKGajM8w-MTxQYxmck',
                'docsArray':
                    [
                        ["world/ng-interactive/2016/sep/16/gun-nation-a-journey-to-the-heart-of-americas-gun-culture-video", "gun-nation"],
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
                        ["world/ng-interactive/2017/dec/15/killing-gavle-swedish-city-40ft-goat-battle-for-the-spirit-of-christmas", "killing-gavle"],
                        ["world/ng-interactive/2018/feb/02/pork-crackling-wifi-parks-havana-hotspot-conectifai-documentary", "conectifai"],
                        ["artanddesign/ng-interactive/2018/mar/02/how-to-make-a-pearl-the-san-francisco-man-who-lives-in-darkness", "how-to-make-a-pearl"],
                        ["world/ng-interactive/2018/mar/13/white-fright", "white-fright"],
                        ["environment/ng-interactive/2018/apr/13/the-climate-and-the-cross-us-evangelical-christians-tussle-with-climate-change", "the-climate-and-the-cross"],
                        ["news/ng-interactive/2018/may/14/four-weddings-four-alternative-nuptials-to-harry-and-meghans-video", "four-weddings"],
                        ["society/ng-interactive/2018/jun/01/our-house-the-homeless-man-the-hippy-and-the-property-developer", "our-house"],
                        ["uk-news/ng-interactive/2018/jun/14/the-tower-next-door-living-in-the-shadow-of-grenfell", "the-tower-next-door"],
                        ["us-news/ng-interactive/2018/jun/29/the-trap-sex-trafficking-american-prisons", "the-trap"],
                        ["world/ng-interactive/2018/jul/20/white-fright-the-plot-to-attack-muslims-that-the-us-media-ignored", "white-fright"],
                        ["world/ng-interactive/2018/aug/03/little-pyongyang-a-north-korean-in-south-london", "little-pyongyang"],
                        ["uk-news/ng-interactive/2018/sep/21/silent-sam-the-mute-punk-singer-video", "silent-sam"],
                        ["us-news/ng-interactive/2018/jul/27/cops-and-robbers-corey-pegues-new-york-documentary-video", "cops-and-robbers"],
                        ["news/ng-interactive/2018/oct/26/black-sheep-the-black-teenager-who-made-friends-with-racists-video", "black-sheep"],
                        ["world/ng-interactive/2018/oct/25/julians-wait-julian-cole-visiting-the-man-paralysed-after-police-incident-outside-a-nightclub-video", "julians-wait"],
                        ["news/ng-interactive/2018/nov/29/skip-day-high-school-friendship-and-everyday-racism-at-the-beach-in-florida-video", "skip-day"],
                        ["news/ng-interactive/2018/dec/18/crisanto-street-a-child-living-in-a-mobile-home-in-silicon-valley-video", "crisanto-street"],
                        ["world/ng-interactive/2018/dec/28/marielle-and-monica-the-lgbt-activists-resisting-bolsonaros-brazil", "marielle-and-monica"],
                        ["news/ng-interactive/2019/jan/25/fighting-shame-women-leeds-tell-stories-fighting-poverty", "fighting-shame"],
                        ["global-development/ng-interactive/2019/feb/15/the-breadmaker-frontline-venezuela-bakery-wars-video-la-minka", "the-breadmaker"],
                        ["us-news/ng-interactive/2019/feb/22/the-trial-inside-the-ammar-al-baluchi-guantanamo-trial-video", "the-trial"],
                        ["news/ng-interactive/2019/mar/25/where-the-river-runs-red-a-former-mining-community-caught-between-the-past-and-a-sustainable-future-video", "where-the-river-runs-red"],
                        ["world/ng-interactive/2019/apr/05/someone-elses-war-when-your-child-joins-the-war-against-isis-video", "someone-elses-war"],
                        ["society/ng-interactive/2019/apr/12/lasting-marks-16-men-put-on-trial-for-sadomasochism-video", "lasting-marks"],
                        ["news/ng-interactive/2019/apr/18/anonymous-comes-to-town-how-hackers-took-on-high-school-sexual-assault-in-ohio", "anonymous-comes-to-town"],
                        ["uk-news/ng-interactive/2019/may/03/sam-and-the-plant-next-door-growing-up-with-hinkley-point-video", "sam-and-the-plant-next-door"],
                        ["news/ng-interactive/2019/may/24/the-hour-of-lynching-vigilante-violence-against-muslims-in-india-video", "the-hour-of-lynching"],
                        ["news/ng-interactive/2019/jun/03/buyers-club-the-network-providing-people-with-affordable-hepatitis-c-medicine-video", "buyers-club"],
                        ["world/ng-interactive/2019/jun/14/trapped-in-the-city-of-a-thousand-mountains-video", "trapped-in-the-city-of-a-thousand-mountains"],
                        ["news/ng-interactive/2019/jun/28/the-waiting-room-single-parents-unflinching-account-living-with-cancer-video", "the-waiting-room"],
                        ['news/ng-interactive/2019/jul/12/crannog-the-woman-who-cares-for-animals-at-the-end-of-their-lives-video', 'crannog'],
                        ['society/ng-interactive/2019/jul/19/share-an-instagram-star-at-a-crossroads-video', 'share'],
                        ['news/ng-interactive/2019/oct/07/after-windrush-paulette-wilsons-visit-to-jamaica-50-years-on', 'windrush'],
                        ['world/ng-interactive/2019/oct/28/the-lost-rambos-of-papua-new-guinea-how-weapons-and-hollywood-changed-tribal-disputes-video', 'lost-rambos'],
                        ['world/ng-interactive/2019/nov/18/nowt-but-a-fleeting-thing-a-young-farmers-fight-for-survival-video', 'nowt-but-a-fleeting-thing'],
                        ['news/ng-interactive/2019/dec/02/open-water-lives-of-three-greenlanders-climate-crisis', 'open-water'],
                        ['news/ng-interactive/2020/jan/17/a-childhood-on-fire-documentary-video', 'a-childhood-on-fire'],
                        ['news/ng-interactive/2020/feb/07/teranga-the-migrant-run-afrobeat-nightclub-uniting-naples-video', 'teranga'],
                        ['news/ng-interactive/2020/apr/27/scars-how-our-wounds-make-us-who-we-are-video', 'scars'],
                        ['world/ng-interactive/2020/may/12/our-iranian-lockdown-how-coronavirus-changed-one-couples-life', 'quarantine-iranian-style'],
                        ['world/ng-interactive/2020/jul/15/the-circle-masculinity-racism-and-brotherhood-on-a-hackney-estate-video', 'the-circle'],
                        ['politics/ng-interactive/2020/aug/12/united-voices-outsourced-key-workers-fighting-for-equal-rights-video', 'united-voices'],
                        ['education/ng-interactive/2020/sep/02/somalinimo-somali-culture-blackness-and-islam-at-cambridge-university', 'somalinimo'],
                        ['society/ng-interactive/2020/oct/08/no-ball-games-life-and-play-through-the-eyes-of-children-across-the-uk-documentary', 'no-ball-games'],
                        ['uk-news/ng-interactive/2020/nov/02/daisy-chain-can-a-cornish-town-adapt-to-survive-another-lockdown', 'daisy-chain'],
                        ['world/ng-interactive/2020/nov/18/colette-a-former-french-resistance-member-confronts-a-family-tragedy-75-years-later', 'colette'],
                        ['film/ng-interactive/2020/dec/09/the-wolf-dividing-norway-the-hunter-v-the-environmentalist', 'the-wolf-dividing-norway'],
                        ['science/ng-interactive/2020/dec/29/covid-from-space-humans-furthest-from-the-pandemic-jessica-meir', '2020-a-covid-space-odyssey'],
                        ['world/ng-interactive/2021/jan/05/lupita-the-indigenous-activist-leading-a-new-generation-of-mexican-women', 'lupita'],
                        ['australia-news/ng-interactive/2021/jan/25/bright-lights-one-womans-devastating-25-year-addiction-to-gambling-video', 'bright-lights'],
                        ['world/ng-interactive/2021/feb/18/untold-chaos-living-through-libyas-wars-documentary', 'untold-chaos'],
                        ['world/ng-interactive/2021/feb/23/my-brothers-keeper-a-former-guantanamo-detainee-his-guard-and-their-unlikely-friendship', 'my-brothers-keeper'],
                        ['global/ng-interactive/2021/apr/16/space-to-be-documentary', 'space-to-be'],
                        ['world/ng-interactive/2021/jul/06/the-return-a-family-reconnects-with-the-amazon-as-covid-threatens-their-village-video', 'the-return'],
                        ['global/ng-interactive/2021/jul/29/this-body-black-america-hope-trust-and-covid-vaccine-trials-video', 'this-body'],
                        ['news/ng-interactive/2021/aug/12/rip-seni-racism-graffiti-and-the-uks-mental-health-crisis-video', 'rip-seni'],
                        ['uk-news/ng-interactive/2021/sep/22/saintmaking-the-canonisation-of-derek-jarman-by-queer-nuns-video', 'saintmaking'],
                        ['world/ng-interactive/2021/nov/11/sindicat-evading-eviction-barcelona-guardian-documentary', 'sindicat'],
                        ['environment/ng-interactive/2021/dec/02/unsafe-passage-on-board-a-refugee-rescue-ship-racing-for-europe-guardian-documentary', 'unsafe-passage'],
                        ['global/ng-interactive/2021/dec/21/happiness-is-a-journey-the-hidden-life-of-an-american-warehouse-worker-video', 'happiness-is-a-journey'],
                        ['world/ng-interactive/2022/jan/19/the-black-cop-a-police-officers-story-of-racism-remorse-and-resistance-documentary', 'the-black-cop'],
                        ['science/ng-interactive/2022/feb/15/lenka-methamphetamine-addiction-in-czech-republic-documentary', 'lenka'],
                        ['world/ng-interactive/2022/mar/31/cinema-of-ukraine-artists-reflect-on-modern-history-culture-and-people', 'cinema-of-ukraine'],
                        ['world/ng-interactive/2022/may/17/the-spider-man-of-sudan-the-real-life-superhero-of-the-protest-movement', 'the-\'spider-man\'-of-sudan'],
                        ['world/ng-interactive/2022/may/25/sending-aya-back-the-syrian-teen-facing-deportation-in-denmark-documentary', 'sending-aya-back'],
                        ['world/ng-interactive/2022/jun/22/one-good-song-can-do-more-than-5000-protests-the-queer-revolution-in-the-middle-east', 'beirut-dreams-in-color'],
                        ['world/ng-interactive/2022/aug/22/little-warrior-the-boxer-breaking-away-from-venezuelan-poverty-documentary', 'little-warrior'],
                        ['world/ng-interactive/2022/sep/29/lady-of-the-gobi-trucking-coal-across-the-desert-to-china', 'lady-of-the-gobi'],
                        ['global/ng-interactive/2022/nov/10/climate-carnage-whose-job-is-it-to-save-the-planet-documentary', 'whose-job-is-it-to-save-the-planet?'],
                        ['world/ng-interactive/2022/nov/23/the-great-abandonment-the-extraordinary-exodus-of-indias-migrant-labourers', 'the-great-abandonment'],
                        ['environment/ng-interactive/2022/dec/05/skyward-birdwatching-is-belonging-for-two-teenage-conservationists', 'skyward'],
                        ['world/ng-interactive/2023/jan/30/ghosts-of-moria-living-in-the-ashes-of-europes-largest-migrant-camp-documentary', 'ghosts-of-moria'],
                        ['world/ng-interactive/2023/feb/23/the-year-that-never-ended-how-a-ukrainian-comedian-rebuilt-a-strangers-house-documentary', 'the-year-that-never-ended'],
                        ['news/ng-interactive/2023/apr/05/born-in-damascus-the-legacy-of-syria-war-for-two-separated-cousins', 'born-in-damascus']
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
            if (!interactiveConfig.googleAnalytics) {
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
            window.setTimeout(function () {
                addCSS('<%= assetPath %>/main.css');
            }, 10);

            // Load JS and init
            if (typeof require === 'undefined' && typeof curl !== 'undefined') {
                window.require = curl;
            }

            require(['<%= assetPath %>/main.js'], function (main) {
                main.init(el, context, interactiveConfig, mediator);
            }, function (err) { console.error('Error loading boot.', err); });
        }
    };
});
