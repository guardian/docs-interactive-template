import reqwest from 'reqwest'
import formSerialize from 'form-serialize'


export default function emailsignup(formNode) {
    formNode.addEventListener("submit", function(event){
        event.preventDefault();
        console.log(formSerialize(formNode));
    });

}
