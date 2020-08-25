
export function initLiveEvent(builder, docData) {
    const hasLiveEvent = docData._docData.hasLiveEvent;
    const liveEl = builder.querySelector('.g-live');
    if (hasLiveEvent == 'TRUE' && liveEl) {
        liveEl.classList.add('has-event');
        fillInLiveEl(liveEl, {
            button: docData._docData.liveEventButton,
            date: docData._docData.liveEventDate,
            description: docData._docData.liveEventDescription,
            image: docData._docData.liveEventImage,
            link: docData._docData.liveEventLink,
            title: docData._docData.liveEventTitle
        });
    }

}

function fillInLiveEl(rootEl, data) {

    ['button', 'date', 'description', 'title'].forEach((label) => {
        const el = rootEl.querySelector([`[data-sheet="${label}"]`])
        el.innerText = data[label];
    })

    const linkEl = rootEl.querySelector('[data-sheet="button"]');
    linkEl.setAttribute('href', data.link);

    const imageEl = rootEl.querySelector('.g-live__image');
    imageEl.style.backgroundImage = `url(${data.image})`;

}

export default initLiveEvent;


// <section id='guardian-live-event' class='g-live'>
// <div class='g-live__title'>The Guardian Live</div>
// <div class='g-live__image'>
//     <div class='g-live__image__online'>Online</div>
// </div>
// <div class='g-live__info'>
//     <div class='g-live__copy'>
//         <div class='g-live__copy__title' data-sheet='title'></div>
//         <div class='g-live__copy__description' data-sheet='description'></div>
//         <div class='g-live__copy__date' data-sheet='date'></div>
//         <div class='g-live__copy__cta'>
//             <a href='' data-sheet='button'></a>
//             <svg width="30" height="30" viewBox="0 0 30 30" class="inline-arrow-right__svg inline-icon__svg">
//                 <path d="M22.8 14.6L15.2 7l-.7.7 5.5 6.6H6v1.5h14l-5.5 6.6.7.7 7.6-7.6v-.9"></path>
//             </svg>
//         </div>
//     </div>
// </div>
// </section>
