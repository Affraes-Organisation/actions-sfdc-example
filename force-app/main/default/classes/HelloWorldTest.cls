@isTest
public class HelloWorldTest {
    @isTest
    static void checkMessage() {
        final String name = 'Jeff';
        final String expectedMessage = 'Hello, Jeff - how are you?';

        HelloWorld myHelloWorld = new HelloWorld();
        String message = myHelloWorld.hey(name);

        System.assertEquals(expectedMessage, message);
    }
}
