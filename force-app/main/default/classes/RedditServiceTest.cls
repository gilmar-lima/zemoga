@isTest
public class RedditServiceTest {

    private static final String REDDIT_AUTH = 'RedditAuth';
    private static final String REDDIT_COMMENT = 'RedditComment';
    
    @IsTest
    static void postCommentTest(){

        RedditCommentDTO comment = (RedditCommentDTO) JSON.deserialize(getResourceString('redditComment'), RedditCommentDTO.class);
                
        Test.setMock(HttpCalloutMock.class, getMock(200));
        Test.startTest();
        Boolean success = true;
        try {
            RedditService.postComment(comment);            
        } catch (Exception e) {
            success = false;            
        }        
        Test.stopTest();

        Assert.isTrue(success);        
    }

    @IsTest
    static void postCommentErrorTest(){        

        RedditCommentDTO comment = (RedditCommentDTO) JSON.deserialize(getResourceString('redditComment'), RedditCommentDTO.class);

        Test.setMock(HttpCalloutMock.class, getMock(500));
        Test.startTest();
        Boolean success = true;
        try {
            RedditService.postComment(comment);            
        } catch (Exception e) {
            success = false;            
        }        
        Test.stopTest();

        Assert.isFalse(success);        
    }

    private static MultiStaticResourceCalloutMock getMock(Integer statusCode){

        WebServiceConfiguration__mdt serviceConfig = WebServiceConfiguration__mdt.getInstance(REDDIT_COMMENT);
        WebServiceConfiguration__mdt authConfig = WebServiceConfiguration__mdt.getInstance(REDDIT_AUTH);

        MultiStaticResourceCalloutMock mock = new MultiStaticResourceCalloutMock();
        mock.setStaticResource(authConfig.Endpoint__c, 'mockRedditToken');
        mock.setStaticResource(serviceConfig.Endpoint__c, 'redditComment'); //Just for testing purpose
        mock.setStatusCode(statusCode);

        return mock;
    }

    private static String getResourceString(String resourceName){

        return [SELECT Body 
                FROM StaticResource 
                WHERE Name =: resourceName][0].Body.toString();

    }
}