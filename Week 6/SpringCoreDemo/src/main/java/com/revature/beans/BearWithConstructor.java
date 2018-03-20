package com.revature.beans;

public class BearWithConstructor extends Bear {
	
	private Cave cave;
	
	public BearWithConstructor(Cave cave){
		this();
		this.cave = cave;
	}
	
	public BearWithConstructor(){
		super();
	}
	
	@Override
	public void methodInBear() {
		System.out.println("method in BearWithConstructor. this bear is: "+this.toString());
		System.out.println("cave: "+cave.toString());
		
	}

}
