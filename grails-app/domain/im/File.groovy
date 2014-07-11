package im



class File {
    byte [] filePayload
    String fileType
    String fileName
    int    userId
    
    static mapping = {
        id column:'file_id'
    }
    
    static constraints = {
        filePayload (blank: true, maxSize: 1073741824, nullable: true)
        fileType (blank: true, nullable: true)
        fileName (blank: true, nullable: true)
        userId   (blank: true, nullable: true)
    }
}
