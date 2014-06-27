package im



class Questions {
    String questionText
    
    String toString () {
        "${questionText}"
    }
    
    static mapping = {
        id column:'question_id'
        questionText type:'text'
    }
    
    static constraints = {
        questionText(blank: false)
    }
}

