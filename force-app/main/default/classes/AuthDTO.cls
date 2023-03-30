public class AuthDTO {

    public class Request{

        public String grant_type{get; set;}
        public String username{get; set;}
        public String password{get; set;}
    }

    public class Response{
        public String access_token{get; set;}
        public String token_type{get; set;}
        public Integer expires_in{get; set;}
        public String scope{get; set;}
    }    

}