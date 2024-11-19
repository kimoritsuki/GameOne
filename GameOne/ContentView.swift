import SwiftUI

struct ContentView: View {
    @State private var userGuess = ""
    @State private var targetNumber = Int.random(in: 1...100)
    @State private var message = "Guess a number between 1 and 100"
    @State private var attempts = 0
    @State private var showAlert = false
    @State private var gameOver = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("The Just Price Game")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(message)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            TextField("Your number", text: $userGuess)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(10)
                .padding()
            
            Button(action: checkGuess) {
                Text("Valider")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(20)
            }
            
            Text("Attemps: \(attempts)")
                .padding()
            
            if gameOver {
                Button(action: resetGame) {
                    Text("Nouvelle partie")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.brown)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"),
                  message: Text("Veuillez entrer un nombre valide entre 1 et 100"),
                  dismissButton: .default(Text("OK")))
        }
    }
    
    func checkGuess() {
        guard let guess = Int(userGuess) else {
            message = "Veuillez entrer un nombre valide"
            showAlert = true
            return
        }
        
        guard guess >= 1 && guess <= 100 else {
            message = "Le nombre doit être entre 1 et 100"
            showAlert = true
            return
        }
        
        attempts += 1
        
        if guess < targetNumber {
            message = "C'est plus !"
        } else if guess > targetNumber {
            message = "C'est moins !"
        } else {
            message = "Bravo ! Vous avez trouvé en \(attempts) essais !"
            gameOver = true
        }
        
        userGuess = ""
    }
    
    func resetGame() {
        targetNumber = Int.random(in: 1...100)
        message = "Devinez un nombre entre 1 et 100"
        attempts = 0
        gameOver = false
        userGuess = ""
    }
}

#Preview {
    ContentView()
}
