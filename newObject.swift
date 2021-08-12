
import SwiftUI

struct newObject: View {
    @State var newAnimal : String = ""
    @State var newQuestion : String = ""
    @State var isToggle : Bool = false
    @State var showInfo : Bool = true
    @State var displayYN : String = "No"
  @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            
            TextField("Animal:", text: $newAnimal)
                .border(Color.black, width : 1)
            .textFieldStyle(RoundedBorderTextFieldStyle())
                .offset(y: -250)
            TextField("Question:", text: $newQuestion)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .textFieldStyle(RoundedBorderTextFieldStyle())
                .offset(y: -240)
            Button(action:
                {
                    //print(self.isToggle)
                    self.callForNode()
                self.presentationMode.wrappedValue.dismiss()
            })
            {
                Text("Submit")
            }
            .font(.title)
            .padding()
            .background(Color.green)
            .cornerRadius(360)
            .foregroundColor(.black)
            .padding(6.0)
            .alert(isPresented: $showInfo, content: {self.infoAlert})
          Toggle(isOn: $isToggle){
            Text(displayToggleYN(currentBool : isToggle))
                .font(.title)
          }
        .padding(10)
        .offset(y: -250)
          .frame(width: 200, height: 20, alignment: .leading)
        }
        
    }
    var infoAlert: Alert {
            Alert(title: Text("I lost"), message: Text("I need to learn about your animal, tell me the animal you were thinking of and a question I can use to distinguish it from other animals"), dismissButton: .default(Text("Dismiss"), action: {
                print("Hello")
            }))
           }
   func callForNode()
   {
        newNode(newObj: newAnimal, newQues: newQuestion, yOrN: isToggle)
    }
}
struct newObject_Previews: PreviewProvider {
    static var previews: some View {
        newObject()
    }
}
