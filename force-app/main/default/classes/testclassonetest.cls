@isTest
public class testclassonetest {

    @isTest
    public static void canBeCalled() {
        Test.startTest();
        
        TestClassOne obj = new TestClassOne();
        
        Test.stopTest();
    }
}