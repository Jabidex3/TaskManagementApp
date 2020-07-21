package com.jabid;

public class Tasks {

	private int task_id;
    private String title;
    private String message;
    private String importance_scale;
    
	public Tasks(int task_id, String title, String message, String importance_scale) {
		super();
		this.task_id = task_id;
		this.title = title;
		this.message = message;
		this.importance_scale = importance_scale;
	}

	public int getTask_id() {
		return task_id;
	}

	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getImportance_scale() {
		return importance_scale;
	}

	public void setImportance_scale(String importance_scale) {
		this.importance_scale = importance_scale;
	}
	
	
    
    
}
