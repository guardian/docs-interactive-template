import startsWith from 'lodash.startswith';

export function sheetToDomInnerHtml({el, docData, comingSoonSheetName}) {
    Array.from(el.querySelectorAll('[data-sheet-attribute]')).forEach(node => {
        const field = node.getAttribute('data-sheet-attribute');

        if(startsWith(field, `${comingSoonSheetName}-`)){
            //node.innerHTML = docData.comingNext[field.split(`${comingSoonSheetName}-`)[1]];
        }
        else {
            node.innerHTML = docData.getField(field);
        }


    });

    // const ar = docData._docName.split("-");
    // const len = ar.length - 1;

	//console.log("Made in Stoke-on-Trent: Episode "+docData._docData.episodeNumber );

}

export default sheetToDomInnerHtml;
