public class DataFactory {
    
    public static void generate() {
        TwitterUser tu = TwitterUser.parse();
        List<Tweet__c> tweets = new List<Tweet__c>();
        for(TwitterUser.cls_data data:tu.data){
            Tweet__c tweet = new Tweet__c();
            tweet.Likes__c = data.public_metrics.like_count;
            tweet.Retweet_Count__c = data.public_metrics.retweet_count;
            tweet.Reply_Count__c = data.public_metrics.reply_count;
            tweet.Text__c = data.text;
            tweet.Tweet_Id__c = data.id;
            tweet.Created_At__c = datetime.valueOf(data.created_at);
            tweets.add(tweet);
        }
        upsert tweets Tweet_Id__c;
        
    }
    
}