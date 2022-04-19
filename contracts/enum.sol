pragma solidity ^0.8.10;

contract Enum {
    //Enum represents shipping status

    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    //Default value is the first element listened in definition of the type (in this case pending)
    Status public status; //defaulted to pending

    //Returns uint
    //Pending - 0
    //Shipped - 1
    // Accepted - 2
    // Rejected - 3
    // Cancelled - 4

    function get() public view returns (Status) {
        return status;
    }

    //Update status by passing uint into input

    function set(Status _status) public {
        status = _status;
    }
    // You can update to a specific enum like this

    function cancel() public {
        status = Status.Canceled;
    }

    // Delete sets enum to default value
    function reset() public {
        delete status;
    }

}   



