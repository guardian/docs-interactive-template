# Process form start to finish

## Initial setup
Check they’ve filled out the spreadsheet: https://docs.google.com/spreadsheets/d/1jYb4okCk7I42wCoduH-o48DE-EKGajM8w-MTxQYxmck/edit

## Image work
We need to add images to the spreadsheet, these images are: 
1. a background image
2. a poster image
3. a header images
These may need to be squished.

## Documentary template
1. In the file SheetnamefromshortId change DefaultDoc to be the name of the documentary from the spreadsheet with hyphens ‘this-documentary’
2. boot.js should include all previous documentaries, to add an old documentary copy the url of the documentary, without guardian section
3. `nvm use v10` `npm start`
4. Run `grunt` or `./node_modules/.bin/grunt` and check that works 
Note: If you change the css in one you change it for all documentaries, so be careful 
5. To deploy run `grunt deploy`

## Making the article
1. Make a composer file, this should be an interactive article
2. Set it to display hint `immersive`
3. Embed the boot.js link you should have got when you ran `grunt deploy` into the article and set it to immersive
4. Publish the spreadsheet
5. Check the article

## Making the thrasher 
1. Using the previous article thrasher as a base create a new branch 
2. Replace the link to the previous link to old thrasher with the link to the new article. You should wait until the journalists have renamed the composer article before you do this
3. Replace the poster image
4. Replace the video if we are using a video
5. Replace the thraser on the preview front and send the link through to the journalists 
6. Send the embed link through to the journalists


Github: https://github.com/guardian/docs-interactive-template
Thrasher: https://github.com/guardian/interactive-atom-thrasher-template/tree/thrashers/2022-documentary-template
Image uploader: https://s3-uploader.gutools.co.uk/