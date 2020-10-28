import ballerina/io;
import ballerina/test;
import ballerina/config;
//import ballerina/log;

DBConfig cconfig = {
        baseUrl: config:getAsString("BASE_URL"),
        secureSocket: true
    };

DBClient dbCli = new(cconfig);

@test:Config{}
function testCallGet(){
    
    io:println("\n ---------------------------------------------------------------------------");

    json|error result = dbCli.getRecord(1);

    if result is json{
            io:println(result);
            //test:assertEquals(result,51.51);

    }else{
        test:assertFail(result.message());
    }
}

@test:Config{}
function testCallPost(){
    
    io:println("\n ---------------------------------------------------------------------------");

    json|error result = dbCli.insertRecord({"name":"ruvi","age":34,"gender":"female"});

    if result is json{
            io:println(result);
            //test:assertEquals(result,51.51);

    }else{
        test:assertFail(result.message());
    }
}

@test:Config{}
function testCallPut(){
    
    io:println("\n ---------------------------------------------------------------------------");

    json|error result = dbCli.updateRecord({"name":"ruvini","age":34,"gender":"female","id":3});

    if result is json{
            io:println(result);
            //test:assertEquals(result,51.51);

    }else{
        test:assertFail(result.message());
    }
}

@test:Config{}
function deleteRecord(){
    
    io:println("\n ---------------------------------------------------------------------------");

    json|error result = dbCli.deleteRecord(3);

    if result is json{
            io:println(result);
            //test:assertEquals(result,51.51);

    }else{
        test:assertFail(result.message());
    }
}