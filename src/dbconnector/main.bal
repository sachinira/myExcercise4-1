//import ballerina/auth;
///import ballerina/config;
import ballerina/http;
//import ballerina/log;
//import balerina/system;
import ballerina/io;

public class DBClient{

    public string baseUrl;
    public http:Client basicClient;

    function init(DBConfig opConf){
        self.baseUrl = opConf.baseUrl;

        self.basicClient = new (self.baseUrl, {
            secureSocket: {
                trustStore: {
                    path: "/usr/lib/ballerina/distributions/ballerina-slp4/bre/security/ballerinaTruststore.p12",
                    password: "ballerina"
                }
            }
            });
    }

    public function getRecord(int id) returns  @tainted json|error{

        var response = self.basicClient->get(string `/customer/${id}`);

        http:Response getresponse = <http:Response>response;

            if (getresponse.statusCode == http:STATUS_OK) {

                var payload = getresponse.getJsonPayload(); 

                if payload is json{
                    return payload;

                }else{
                    error err = error("error occurred while retriving data not json");
                    io:println(err.message(),
                    ", status code: ", getresponse.statusCode,
                    ", reason: ", payload);
                    return err;
                }
               
            } else {
                
                json payload = <json>getresponse.getJsonPayload(); 

                error err = error("error occurred while sending GET request");
                io:println(err.message(),
                ", status code: ", getresponse.statusCode,
                ", reason: ", payload);
                return err;
            }
    }



    public function insertRecord(Customer customer) returns @tainted json|error{

        var response = self.basicClient->post("/customer",customer);

        http:Response getresponse = <http:Response>response;
            if (getresponse.statusCode == http:STATUS_OK) {

                var payload =  getresponse.getJsonPayload(); 

                if payload is json{
                    return payload;
                }else{
                    error err = error("error occurred while retriving data not json");
                    io:println(err.message(),
                    ", status code: ", getresponse.statusCode,
                    ", reason: ", payload);
                    return err;
                }
               
            } else {
                
                json payload = <json>getresponse.getJsonPayload(); 

                error err = error("error occurred while sending GET request");
                io:println(err.message(),
                ", status code: ", getresponse.statusCode,
                ", reason: ", payload);
                return err;
            }
    }

    public function updateRecord(UpdateCustomer customer)returns @tainted json|error{
        var response = self.basicClient->put("/customer",customer);

        http:Response getresponse = <http:Response>response;
            if (getresponse.statusCode == http:STATUS_OK) {

                var payload =  getresponse.getJsonPayload(); 

                if payload is json{
                    return payload;
                }else{
                    error err = error("error occurred while retriving data not json");
                    io:println(err.message(),
                    ", status code: ", getresponse.statusCode,
                    ", reason: ", payload);
                    return err;
                }
               
            } else {
                
                json payload = <json>getresponse.getJsonPayload(); 

                error err = error("error occurred while sending GET request");
                io:println(err.message(),
                ", status code: ", getresponse.statusCode,
                ", reason: ", payload);
                return err;
            }
    }

    public function deleteRecord(int id) returns @tainted json|error{
    var response = self.basicClient->delete(string `/customer/${id}`);

        http:Response getresponse = <http:Response>response;

            if (getresponse.statusCode == http:STATUS_OK) {

                var payload = getresponse.getJsonPayload(); 

                if payload is json{
                    return payload;

                }else{
                    error err = error("error occurred while retriving data not json");
                    io:println(err.message(),
                    ", status code: ", getresponse.statusCode,
                    ", reason: ", payload);
                    return err;
                }
               
            } else {
                
                json payload = <json>getresponse.getJsonPayload(); 

                error err = error("error occurred while sending GET request");
                io:println(err.message(),
                ", status code: ", getresponse.statusCode,
                ", reason: ", payload);
                return err;
            }
    }

}


public type DBConfig record {
    string baseUrl;
    boolean secureSocket?;
};

public type Customer record {|
    string name;
    int age;
    string gender;
|};

public type UpdateCustomer record {|
    int id;
    string? name;
    int? age;
    string? gender;
|};