import { LightningElement,track} from 'lwc';
export default class TrackDecorator extends LightningElement {

@track fullName = {firstname:'',lastname:''}

handlechange (event){
const fieldval= event.target.name
if(fieldval=== 'firstname'){
    console.log('aa',event.target.value)
    fullName.firstname = event.target.value
}
if(fieldval==='lastname'){
  fullName.lastname = event.target.value
}

}
}