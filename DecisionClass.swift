//
import Foundation

class BinaryTree
{
    var guess : String
    var question : String
    
    var yesAns : BinaryTree?
    var noAns : BinaryTree?
    
    init(guess : String, question : String)
    {
        self.guess = guess
        self.question = question
    }
    func playGame(curNode : BinaryTree?)
    {
        if(curNode?.question == "")
        {
            makeGuess(curNode: curNode)
        }
        else
        {
            askQuestion(curNode: curNode)
        }
    }
    func askQuestion(curNode : BinaryTree?)
    {
        print(curNode!.question,"?")
        let answer = readLine()
        if(answer == "y" || answer == "Y")
        {
            playGame(curNode: curNode?.yesAns)
        }
        else
        {
            playGame(curNode : curNode?.noAns)
        }
    }
    func makeGuess(curNode : BinaryTree?)
    {
        print("Were you thinking of a", curNode!.guess)
        let answer = readLine()
        
        if(answer == "y" || answer == "Y")
        {
            print("Good! I guessed your animal")
        }
        else
        {
            newObject(curNode: curNode)
        }
    }
    func newObject(curNode : BinaryTree?)
    {
        print("What is your animal")
        let newAnimal = readLine()
        let previousGuess = curNode?.guess
        let leftChild = BinaryTree(guess : "", question : "")
        let rightChild = BinaryTree(guess : "", question : "")
        curNode?.yesAns = leftChild
        curNode?.noAns = rightChild
        
        print("What is a yes or no question I can use to tell a",curNode!.guess,"from a",newAnimal!)
        var newQues : String?
        newQues = readLine();
        
        curNode?.question = newQues!
        curNode?.guess = ""
        
        print("For",newAnimal!, "is the answer yes or no")
        let questionAns = readLine()
        
        if(questionAns == "y" || questionAns == "Y")
        {
            leftChild.guess = newAnimal!
            rightChild.guess = previousGuess!
        }
        else
        {
            rightChild.guess = newAnimal!
            leftChild.guess = previousGuess!
        }
        leftChild.yesAns = nil
        leftChild.noAns = nil
        rightChild.yesAns = nil
        rightChild.noAns = nil
    }
    func playAgain() -> Bool
    {
        print("Do you want to play again?")
        let answer = readLine()
        
        if(answer == "y" || answer == "Y")
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
func makeThisTree() -> BinaryTree?
     {
        var question1 : String = ""
        if(gameType == "Movie")
        {
            question1 = "Was the movie released in 2012"
        }
        else
        {
            question1 = "Does it have wings"
        }
         let root = BinaryTree(guess: "", question: question1)
         let node1 = BinaryTree(guess: "", question: "Is it small?")
         let node2 = BinaryTree(guess: "", question: "Does it swim?")
            root.yesAns = node1
            root.noAns = node2
            let node3 = BinaryTree(guess: "Were you thinking of a Pigeon?", question: "")
               let node4 = BinaryTree(guess: "Were you thinking of a GoldFish?", question: "")
               node1.yesAns = node3
               node1.noAns = BinaryTree(guess: "Were you thinking of an Eagle?", question: "")
               node2.yesAns = node4
               node2.noAns = BinaryTree(guess: "Were you thinking of a Dog?", question: "")
         return root
     }
func startGame() -> String
{
    if(root!.question == "")
    {
        return root!.guess
    }
    else
    {
        return  root!.question
    }
}
func newNode(newObj : String, newQues : String, yOrN : Bool)
{
    if(newObj == "" || newQues == "" || newObj == " " || newQues == " ")
    {
        return
    }
    let previousGuess = newNodeID2?.guess
    let leftChild = BinaryTree(guess : "", question : "")
    let rightChild = BinaryTree(guess : "", question : "")
    newNodeID2?.yesAns = leftChild
    newNodeID2?.noAns = rightChild
    newNodeID2?.question = newQues
    newNodeID2?.guess = ""
    if(yOrN == true)
    {
        leftChild.guess = newObj
        rightChild.guess = previousGuess!
    }
    else
    {
        rightChild.guess = newObj
        leftChild.guess = previousGuess!
    }
    leftChild.yesAns = nil
    leftChild.noAns = nil
    rightChild.yesAns = nil
    rightChild.noAns = nil
}
func displayToggleYN(currentBool : Bool) -> String
{
    if (currentBool == true)
    {
        return "Yes"
    }
    else
    {
        return "No"
    }
}
