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

            const extraConfig = {
                'assetPath': '',
                'sheetName': 'gun-nation',
                'sheetChapter': 'gun-nation-chapters',
                'sheetId': '1NcSvccw77rHAncarwfeq7RGZF7yez9mP1Icf3oLMA7g',
                'emailListId': 3745
            };

            config !== undefined ? Object.assign(config, extraConfig) : config = extraConfig;

            // Load CSS asynchronously
            window.setTimeout(function() {
                addCSS('<%= assetPath %>/main.css');
            }, 10);

            // Load JS and init
            require(['<%= assetPath %>/main.js'], function(main) {
                main.init(el, context, config, mediator);
            }, function(err) { console.error('Error loading boot.', err); });
        }
    };
});
