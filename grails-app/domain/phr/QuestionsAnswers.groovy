package phr

import java.util.Date;

class QuestionsAnswers {
	Long questionId
	Long answerId
	Long qaId
	String other
	String answerValue


	static constraints = {
		questionId(blank: true, nullable: true)
		answerId(blank: true, nullable: true)
		qaId(blank: true, nullable: true)
		other(blank: true, nullable: true)
		answerValue (blank: true, nullable: false)
	}
}

