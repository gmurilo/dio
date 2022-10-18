import { Component, OnInit } from '@angular/core';

import quizz_questions from "../../../assets/data/quizz_questions.json";

@Component({
  selector: 'app-quizz',
  templateUrl: './quizz.component.html',
  styleUrls: ['./quizz.component.css']
})
export class QuizzComponent implements OnInit {
  title:string = ""
  resposta:string = ""

  quizzes:any
  selectedQuizz:any

  quizzIndex:number = 0
  quizzMaxIndex:number = 0
  
  questions:any
  questionSelected:any

  answers:string[] = []
  answerSelected:string = ""

  questionIndex:number = 0
  questionMaxIndex:number = 0
  
  results:any

  finished:boolean = false; //Caso tenha terminado de responder o quizz
  selected:boolean = false; //Caso tenha sido selecionado um quizz

  constructor() { }

  ngOnInit(): void {
    if ( quizz_questions ) {
      this.finished = false;
      this.selected = false;
      this.quizzes = quizz_questions;
    }
  }
  selectQuizz(value:number){
    for( let quizz in this.quizzes ){
      if ( value === this.quizzes[quizz].id ) {
        this.selectedQuizz = this.quizzes[quizz];
        console.log(this.selectedQuizz);
        
        this.selected = true;
        this.finished = false;
        
        this.quizzIndex = parseInt( quizz );
        
        this.questionIndex = 0;
        this.questions = this.selectedQuizz.questions;
        this.questionSelected = this.questions[this.questionIndex];
        this.questionMaxIndex = this.questions.length - 1;
        this.results = this.selectedQuizz.results;
      }
    }
  }
  resetQuizz(){
    this.selected = false;
    this.finished = false;
  }
  playerChoose(value:string){
    this.answers.push( value );
    this.questionIndex++;
    if( this.questionIndex > this.questionMaxIndex ) {
      this.finished = true;
      let arr = {"A": 0, "B": 0 };
      for( let i = 0; i < this.answers.length; i++ ) {
        if ( this.answers[i] === "A" ) {
          arr.A++;
        }
        else {
          arr.B++;
        }
      }
      this.resposta = ( arr.A > arr.B ) ? this.selectedQuizz.results.A : this.selectedQuizz.results.B.A;  
    }
    else {
      this.questionSelected = this.questions[this.questionIndex];
    }
  }

}
