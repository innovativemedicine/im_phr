package phr



class Questions {
    String pageName
    int    pageId
    String questionText
    
    String toString () {
        "${pageName}"
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

