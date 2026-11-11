import { LightningElement } from 'lwc';
export default class QuizApp extends LightningElement {
    selected={}
    correctAnswers = 0
    isSubmitted = false
    myQuestions=[
       {
        id:"Question1",
        question:"Which one of the following is not a template loop",
        answer:{
            a:"for:each",
            b:"itreator",
            c:"map loop"
        },
        correctAnswer:"c"
       },
        {
        id:"Question2",
        question:"Which of the file is invalid in LWC component folder",
        answer:{
            a:".svg",
            b:".apex",
            c:".js"
        },
        correctAnswer:"b"
       },
        {
        id:"Question3",
        question:"Which one of the following is not a directive",
        answer:{
            a:"for:each",
            b:"if:true",
            c:"@track"
        },
        correctAnswer:"c"
       },
   ]

selections=[
]
//to disable submit button 
get allNotSelected(){
    return !(Object.keys(this.selected).length === this.myQuestions.length)
}
//for dynamic resut styling to result 
get isScoredFull(){
     return`slds-text-heading_large ${this.myQuestions.length === this.correctAnswers?
      'slds-text-color_succes':'slds-text-color_error'}`
}
//changeHandler get's called on every click on options
changeHandler(event){
    const  {name,value} = event.target
    this.selected= {...this.selected,[name]:value}
}
//form submit handler 
submitHandler(event){
    event.preventDefault();
       let correct =  this.myQuestions.filter(item=>this.selected[item.id] === item.correctAnswer)
       this.correctAnswers = correct.length
       this.isSubmitted =true
}  
//form reset handler     
resetHandler(){
    this.selected = {}
    this.correctAnswers =0
    this.isSubmitted =false

}
}