public with sharing class RedditService {

    private static final String REDDIT_AUTH = 'RedditAuth';
    private static final String REDDIT_COMMENT = 'RedditComment';
    private static final String AUTH_ERROR = Label.AuthErrorMessage;
    private static final String COMMENT_ERROR = Label.RedditCommentError;
    private static final Integer SUCCESS_CODE = 200;

    private RedditService(){}

    /*
    * Posts a comment to Reddit.
    *
    * @param comment  the comment object
    */
    public static void postComment(RedditCommentDTO comment){
        
        WebServiceConfiguration__mdt serviceConfig = WebServiceConfiguration__mdt.getInstance(REDDIT_COMMENT);
        WebServiceConfiguration__mdt authConfig = WebServiceConfiguration__mdt.getInstance(REDDIT_AUTH);

        AuthDTO.Response token = getAuthToken(authConfig);

        HttpRequest request = new HttpRequest();
        request.setEndpoint(serviceConfig.Endpoint__c);
        request.setHeader('Authorization', 'Bearer ' + token.access_token);
        request.setHeader('User-Agent', authConfig.Username__c);
        request.setMethod('POST'); 
        request.setBody(JSON.serialize(comment));

        HttpResponse response = send(request);

        if(response.getStatusCode() != SUCCESS_CODE){
            throw new RedditException(COMMENT_ERROR.replace('{0}', String.valueOf(response.getStatusCode())));
        }        
    }

    /*
    * Performs the token retrieval using Basic Authentication.
    *
    * @param authconfig  the custom metadata with configuration details
    */
    private static AuthDTO.Response getAuthToken(WebServiceConfiguration__mdt authConfig){
        
        
        AuthDTO.Request authBody = new AuthDTO.Request();
        authBody.grant_type = 'password';
        authBody.username = authConfig.Username__c;
        authBody.password = authConfig.Password__c;

        HttpRequest request = new HttpRequest();
        request.setEndpoint(authConfig.Endpoint__c);
        request.setHeader('Authorization', getBasicAuthHeader(authConfig));
        request.setHeader('User-Agent', authConfig.Username__c);
        request.setMethod('POST'); 
        request.setBody(JSON.serialize(authBody));
               
        HttpResponse response = send(request);

        if(response.getStatusCode() != SUCCESS_CODE){
            throw new RedditException(AUTH_ERROR);
        }

        return (AuthDTO.Response) JSON.deserialize(response.getBody(), AuthDTO.Response.class);
    }

    private static String getBasicAuthHeader(WebServiceConfiguration__mdt config){

        Blob headerValue = Blob.valueOf(config.AppId__c + ':' + config.Secret__c);
        String authHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);

        return authHeader;
    }

    private static HttpResponse send(HttpRequest request){
        Http h = new Http();
        return h.send(request);
    }

    public class RedditException extends Exception{}
}