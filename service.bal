import ballerina/http;
import ballerina/log;
//import ballerina/grpc;

listener http:Listener helloWorldEP = new(9091
);

@http:ServiceConfig {
      basePath: "/helloWorld"
}
service helloWorld on helloWorldEP {
    resource function sayHello(http:Caller caller, http:Request request) {
        http:Response response = new;
        response.setTextPayload("Hello, World from service helloWorld ! \n");
        var responseResult = caller->respond(response);
        if (responseResult is error) {
            log:printError("error responding back to client.", err = responseResult);
        }
    }
}
