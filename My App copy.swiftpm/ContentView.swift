import SwiftUI

struct ContentView: View {
    @State private var playerChoice = ""
    @State private var computerChoice = ""
    @State private var result = ""
    @State private var showResult = false
    
    let gameLogic = GameLogic()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Taş Kağıt Makas Oyunu")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            // Choices Section
            Text("Bir seçim yap:")
                .font(.title2)
            
            HStack(spacing: 20) {
                ForEach(gameLogic.choices, id: \.self) { choice in
                    Button(action: {
                        playGame(with: choice)
                    }) {
                        Text(choice)
                            .font(.title2)
                            .frame(width: 100, height: 50)
                            .background(Color.blue.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
            
            // Results Section
            if showResult {
                VStack(spacing: 10) {
                    Text("Sonuçlar:")
                        .font(.title3)
                        .bold()
                        .padding(.top)
                    
                    Text("Senin seçimin: \(playerChoice)")
                        .font(.body)
                    
                    Text("Bilgisayarın seçimi: \(computerChoice)")
                        .font(.body)
                    
                    Text(result)
                        .font(.headline)
                        .foregroundColor(result.contains("Kazandın") ? .green : result.contains("Kaybettin") ? .red : .orange)
                        .padding()
                }
            }
            
            Spacer()
        }
        .padding()
    }
    
    func playGame(with choice: String) {
        playerChoice = choice
        computerChoice = gameLogic.getComputerChoice()
        result = gameLogic.determineWinner(playerChoice: playerChoice, computerChoice: computerChoice)
        showResult = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
