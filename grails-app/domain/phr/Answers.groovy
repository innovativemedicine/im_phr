package phr



class Answers {
    String answerText
    
    String toString () {
        "${answerText}"
    }
    
    static mapping = {
        id column:'answer_id'
        answerText type:'text'
    }
    
    static constraints = {
        answerText(blank: false)
    }
}

