import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentValue: Float= 300 ;
  currentValue:=300;
  // id are immutable while var are mutable
  // let id= 90876565543;
  stable var startTime= Time.now();
  startTime:= Time.now();

  // Debug.print("Hello");
  // Debug.print(debug_show(currentValue));

  public func topUp(amount: Float){
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float){
    let tempValue : Float = currentValue- amount;
    if(tempValue >= 0){
      currentValue-=amount;
      Debug.print(debug_show(currentValue));
    } else{
      Debug.print("Amount too large")
    }
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };

  public func compound(){
    let currentTime= Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedM= timeElapsedNS/1000000000;
    currentValue := currentValue* (1.01** Float.fromInt(timeElapsedM));
    startTime:= currentTime;
  }

  // topUp();
}