package dto;

public class Board {
	//어떤 데이타 가지고 있으면 되나? -> 테이블과 같은 요소
	//멤버 변수 선언
	private String num;
	private String title;
	private String content;
	private String id;
	private String visitcount;
	private String postdate;

	public Board() {
		// TODO Auto-generated constructor stub

	}

	public Board(String num, String title, String content, String id, String visitcount, String postdate) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
		this.visitcount = visitcount;
		this.postdate = postdate;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getVisitcount() {
		return visitcount;
	}

	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}

	public String getPostdate() {
		return postdate;
	}

	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}

}
