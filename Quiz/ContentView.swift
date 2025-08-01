//
//  ContentView.swift
//  Quiz Speedrun
//
//  Created by YJ Soon on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    
    // See QuizQuestion.swift for the struct definition
    let questions = [
        QuizQuestion(questionTitle: "What is the day today?", option1Title: "Monday", option2Title: "Wednesday", option3Title: "Friday", option4Title: "Saturday", correctOption: .option4),
        QuizQuestion(questionTitle: "Who is your instructor", option1Title: "ZJ", option2Title: "XZ", option3Title: "AB", option4Title: "YJ", correctOption: .option4),
        QuizQuestion(questionTitle: "Where are we having lessons?", option1Title: "Banana", option2Title: "Apple", option3Title: "Pineapple", option4Title: "Orange", correctOption: .option2)
    ]
    
    @State var questionIndex = 0
    @State var isAlertShown = false
    @State var isCorrect = true
    @State var score = 0
    @State var isSheetShown = false
    
    // This was refactored into its own function, so that in the
    // main quiz, you won't see so many lines of code.
    // Note how it returns `some View` as its return type, and
    // actually returns a Button (omitting the `return` keyword).
    // Name is lowercase because it's a function.
    func quizButton(label: String, color: Color, optionSelected: QuizQuestion.Option) -> some View {
        Button {
            isAlertShown = true
            
            // Check if matches the correctOption to set the
            // state variable
            if optionSelected == questions[questionIndex].correctOption {
                isCorrect = true
                score += 1
            } else {
                isCorrect = false
            }
        } label: {
            Text(label)
                .padding()
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
    
    var body: some View {
        VStack {
            Text(questions[questionIndex].questionTitle)
                .padding(40)
            
            // First row of quiz buttons are options 1 and 2
            HStack {
                quizButton(
                    label: questions[questionIndex].option1Title,
                    color: .pink,
                    optionSelected: .option1)
                quizButton(
                    label: questions[questionIndex].option2Title,
                    color: .teal,
                    optionSelected: .option2)
            }
            
            // Second row of quiz buttons are options 3 and 4
            HStack {
                quizButton(
                    label: questions[questionIndex].option3Title,
                    color: .purple,
                    optionSelected: .option3)
                quizButton(
                    label: questions[questionIndex].option4Title,
                    color: .yellow,
                    optionSelected: .option4)
            }
        }
        .alert(isCorrect ? "Well done!" : "Nope",
               isPresented: $isAlertShown) {
            Button("OK") {
                if questionIndex == questions.count - 1 {
                    isSheetShown = true
                } else {
                    questionIndex += 1
                }
            }
        }
       .sheet(isPresented: $isSheetShown) {
           VStack {
               Text("Congrats.")
               Text("Your score is \(score)/\(questions.count).")
               Text("Wow.")
           }
       }
    }
}

#Preview {
    ContentView()
}
