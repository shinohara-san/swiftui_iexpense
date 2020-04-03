//struct ContentView: View {
//    struct User: Codable {
//        var firstName: String
//        var lastName: String
//    }
//    @State private var user = User(firstName: "Taylor", lastName: "Swift")
//    var body: some View {
//        Button("Save User") {
//            let encoder = JSONEncoder()
//
//            if let data = try? encoder.encode(self.user) {
//                UserDefaults.standard.set(data, forKey: "UserData")
//            }
//
//        }
//    }
//        @State private var tapCount = 0
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
//
//        var body: some View {
//            Button("Tap count: \(tapCount)") {
//                self.tapCount += 1
//                UserDefaults.standard.set(self.tapCount, forKey: "Tap")
//            }
//        }

//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
//
//    var body: some View {
//        NavigationView{
//            VStack {
//                    List {
//                        ForEach(numbers, id: \.self) {
//                            Text("\($0)")
//                        }.onDelete(perform: removeRows)
//                    }
//
//                    Button("Add Number") {
//                        self.numbers.append(self.currentNumber)
//                        self.currentNumber += 1
//                    }
//                }.navigationBarItems(leading: EditButton())
//            }
//        }

//}

//class User: ObservableObject {
//    @Published var firstName = "Bilbo"
//    @Published var lastName = "Baggins"
//}

//struct SecondView: View {
//    var name: String
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        Button("Dismiss") {
//            self.presentationMode.wrappedValue.dismiss()
//        }
//    }
//}
//
//struct ContentView: View {
//    @State private var showingSheet = false
//    var body: some View {
//        Button("Show Sheet") {
//          self.showingSheet.toggle()
//        }.sheet(isPresented: $showingSheet) {
//           SecondView(name: "@twostraws")
//        }
//    }
//}

//struct ContentView: View {
//    @ObservedObject var user = User()
//
//    var body: some View {
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName).")
//
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//        }
//    }
//}
