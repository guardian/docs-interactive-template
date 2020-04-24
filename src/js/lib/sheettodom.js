import startsWith from 'lodash.startswith';

export function sheetToDomInnerHtml({ el, docData, comingSoonSheetName }) {
    Array.from(el.querySelectorAll('[data-sheet-attribute]')).forEach(node => {
        console.log('node', node);
        const field = node.getAttribute('data-sheet-attribute');
        console.log('field', field);

        if (startsWith(field, `${comingSoonSheetName}-`) && docData.comingNext) {
            node.innerHTML = docData.comingNext[field.split(`${comingSoonSheetName}-`)[1]];
        }
        else {
            node.innerHTML = docData.getField(field);
        }
    });
}

export default sheetToDomInnerHtml;
