const DEFAULT_DOC = 'cinema-of-ukraine';

export default function sheetNameFromShortId(docsArray, shortUrl) {
    const map = new Map(docsArray);
    const docName = map.get(shortUrl);

    if (window.location.hostname == 'localhost') {
        return DEFAULT_DOC;
    } else {
        return docName ? docName : DEFAULT_DOC;
    }

}
