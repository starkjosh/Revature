package com.revature.flashcard.card2.bean;

public class FlashCard {

	private int id;
	private String question;
	private String answer;
	
	public FlashCard() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public FlashCard(int id, String question, String answer) {
		super();
		this.id = id;
		this.question = question;
		this.answer = answer;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "FlashCard [id=" + id + ", question=" + question + ", answer=" + answer + "]";
	}
	
	
	
}
