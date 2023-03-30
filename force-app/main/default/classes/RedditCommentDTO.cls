public class RedditCommentDTO {

    public data data{get;set;}

	public class Subreddit{
		public String public_description{get;set;}
		public String display_name{get;set;}
		public String created_utc{get;set;}
		public String name{get;set;}
		public String subscribers{get;set;}
		public String id{get;set;}
	}
	public class Submission{
		public String author_name{get;set;}
		public String id{get;set;}
		public String name{get;set;}
		public String score{get;set;}
		public String num_comments{get;set;}
		public String url{get;set;}
		public String created_utc{get;set;}
		public String title{get;set;}
	}
	public class Data{
		public String parent_id{get;set;}
		public String score{get;set;}
		public author author{get;set;}
		public String permalink{get;set;}
		public subreddit subreddit{get;set;}
		public String has_replies{get;set;}
		public submission submission{get;set;}
		public String is_submitter{get;set;}
		public String link_id{get;set;}
		public String distinguished{get;set;}
		public String created_utc{get;set;}
		public String edited{get;set;}
		public String body{get;set;}
		public String stickied{get;set;}
		public String id{get;set;}
	}
	public class Author{
		public String link_karma{get;set;}
		public String created_utc{get;set;}
		public String icon_img{get;set;}
		public String name{get;set;}
		public String comment_karma{get;set;}
		public String id{get;set;}
	}

}