public class TwitterUser {
    public cls_data[] data;
    public cls_includes includes;
    public cls_meta meta;
    public class cls_data {
        public cls_public_metrics public_metrics;
        public DateTime created_at;	//2022-02-25T08:04:55.000Z
        public String text;	//.@Wipro powered by Experience Command Center and #CustomerExperience focus has been recognized as a Leader in 2022 @Gartner® Magic Quadrant TM for Outsourced Digital Workplace Services. https://t.co/Z7tVcqus08
        public String author_id;	//14390109
        public String id;	//1497120411334877184
    }
    public class cls_public_metrics {
        public Integer retweet_count; //4
        public Integer reply_count;	//0
        public Integer like_count;	//10
        public Integer quote_count;	//0
    }
    public class cls_includes {
        public cls_users[] users;
    }
    public class cls_users {
        public String id;	//14390109
        public String name;	//Wipro
        public String username;	//Wipro
    }
    public class cls_meta {
        public String oldest_id;	//1495646023351672833
        public String newest_id;	//1497120411334877184
        public Integer result_count;	//10
        public String next_token;	//7140dibdnow9c7btw3z4kclrcpouo10r3t02vlmrsj777
    }   
    
    public static TwitterUser refresh(){
        Twitter_Callout_Settings__mdt WiproTwitterCallout = [Select Bearer_Token__c, Endpoint__c FROM Twitter_Callout_Settings__mdt LIMIT 1][0];
        String bearerToken = WiproTwitterCallout.Bearer_Token__c;
        String endpoint = WiproTwitterCallout.Endpoint__c;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setHeader('Authorization', 'Bearer ' + bearerToken);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        //if successful, parse json
        String json;
        if(response.getStatusCode() == 200){
            json = response.getBody();
        }
        return (TwitterUser) System.JSON.deserialize(json, TwitterUser.class);
    }
    
    
    
}