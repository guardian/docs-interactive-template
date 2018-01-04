import sheetUrl from './sheetURL';
import reqwest from 'reqwest';

const DEFAULT_SUPPORTED_DATA = {
    supportedBadgeUrl: 'https://uploads.guim.co.uk/2017/01/11/bertha-foundation-logo-grey.png',
    supportedSiteUrl: 'http://www.berthafoundation.org/',
    supportedInfo: `Not needed`
};

class DocumentaryMetadata {
    constructor({sheetId, docName, comingSoonSheetName}) {
        this._sheetId = sheetId;
        this._docName = docName;
        this._comingSoonSheetName = comingSoonSheetName;
    }

    getMetadata() {
        const url = sheetUrl(this._sheetId);

        return new Promise((resolve, reject) => {
            reqwest({
                url: url,
                type: 'json',
                crossOrigin: true,
                success: resp => {
                    const metadata = resp.sheets.documentaries.find(_ => _.docName === this._docName);

                    if (!metadata && window.console) {
                        // eslint-disable-next-line no-console
                        console.warn(`Unable to find sheet data for ${this._docName}`);
                    }

                    // supported columns are optional in the sheet, use defaults if not set
                    Object.keys(DEFAULT_SUPPORTED_DATA).forEach(supportedKey => {
                        if (metadata[supportedKey] === ''){
                            metadata[supportedKey] = DEFAULT_SUPPORTED_DATA[supportedKey];
                        }
                    });

                    const chapters = resp.sheets.chapters.filter(_ => _.docName === this._docName);
                    const comingSoon = resp.sheets[this._comingSoonSheetName];

                    this._docData = Object.assign(
                        {},
                        metadata,
                        {chapters: chapters, comingSoon: comingSoon}
                    );

                    resolve(this);
                },
                error: err => reject(err)
            });
        });
    }

    getField(field) {
        if (this._docData) {
            return this._docData[field];
        }
    }

    get title () {
        return this.getField('title');
    }

    get shortDescription () {
        return this.getField('shortDecription');
    }

    get longDescription () {
        return this.getField('longDescription');
    }

    get youtubeId () {
        return this.getField('youTubeId');
    }

    get credits () {
        return this.getField('credits');
    }

    get docDate () {
        return this.getField('docDate');
    }

    get backgroundImageUrl () {
        return this.getField('backgroundImageUrl');
    }

    get isBertha () {
        // is a Bertha doc unless explicitly set to `FALSE` in the sheet
        return this.getField('isBertha') !== 'FALSE';
    }

    get isSupported () {
        // is supported unless explicitly set to `FALSE` in the sheet
        return this.getField('showSupported') !== 'FALSE';
    }

    get supportedBadgeUrl () {
        return this.getField('supportedBadgeUrl');
    }

    get supportedSiteUrl () {
        return this.getField('supportedSiteUrl');
    }

    get supportedInfo () {
        return this.getField('supportedInfo');
    }

    get chapters () {
        return this.getField('chapters');
    }

    get comingSoon () {
        return this.getField('comingSoon');
    }

    get comingNext () {
        return this.comingSoon[0];
    }

    get onwardJourneyLinks () {
        return ['One', 'Two', 'Three', 'Four'].reduce((links, i) => {
            links.push({position: i, jsonUrl: this.getField(`jsonSnap${i}`)});
            return links;
        }, []);
    }
}

export default DocumentaryMetadata;
