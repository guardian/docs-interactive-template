import sheetUrl from './sheetURL';
import reqwest from 'reqwest';
import startsWith from 'lodash.startswith';


export function sheetToDomInnerHtml(sheetID, sheetName, el, comingSoonSheetName, callback) {

    var sheet = sheetUrl(sheetID);

    reqwest({
        'url': sheet,
        'type': 'json',
        'crossOrigin': true,
        'success': resp => {

            //get list of elements with data-sheet-attribute
            for (const node of el.querySelectorAll('[data-sheet-attribute]')) {
                const value = node.getAttribute('data-sheet-attribute');

                if(startsWith(value, `${comingSoonSheetName}-`)){
                    node.innerHTML = resp.sheets[comingSoonSheetName][0][value.split(`${comingSoonSheetName}-`)[1]];
                }
                else {
                    node.innerHTML = resp.sheets[sheetName][0][value];
                }
            }

            setupCards(resp.sheets[sheetName][0]['idNumber']);


            callback(resp);

        }
    });


    function setupCards(idExcept) {
        var cardsSheet = 'https://interactive.guim.co.uk/docsdata-test/19y2reOvKzubGFcde_P3SUqKxkYZmPPOeEmMBfsttlxY.json';
        reqwest({
            'url': cardsSheet,
            'type': 'json',
            'crossOrigin': true,
            'success': resp => {
                var cardsData = resp.sheets.filmPages;


                var cardsWrapper = document.querySelector('#more-brexit-shorts .fc-container__body');
                for (var i = 0; i < cardsData.length; i++) {
                    var cardData = cardsData[i];
                    if (cardData.idNumber!=idExcept && cardData.status=='Show') {
                        var card = document.createElement('div');
                        card.classList.add('card');

                        card.innerHTML = "<a class='link' data-link-name='brexit shorts : film page : card-"+i+"' href="+cardData.link+"></a>";
                        card.innerHTML += "<img src='"+cardData.image+"' srcset='"+cardData.image+" 1x, "+cardData.image2x+" 2x'>"
                        card.innerHTML += "<div class='info'><div class='film-title'>"+cardData.title+"</div><div class='credit'>"+cardData.credit+"</div></div>";

                        cardsWrapper.appendChild(card);
                    }

                }
            }
        });
    }
}

export default sheetToDomInnerHtml;
