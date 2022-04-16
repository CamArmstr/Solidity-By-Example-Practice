pragma solidity ^0.8.10;

contract Array {
    uint[] public arr;
    uint[] public arr2;
    // Fixed size array, all elements initialize to 0
    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    //Soldity can return the entire array, but infinite arrays will cause problems with that.
    function getArr() public view returns (uint[] memory) {
        return arr;
    } 

    function push(uint x) public {
        arr.push(x);
        //appends to array length by 1
    }

    function pop() public {
        arr.pop();
    //removes last element from the array
    }

    function getlength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        delete arr[index];

    }

    function examples() external {
        uint[] memory a = new uint[](5);
        //can create array in memory, only fixed sizes though. 
    }
}

contract ArrayRemoveByShifting {
    uint[] public arr;

    function remove(uint _index) public {
        require(_index<arr.length, "out of bounds");
        
        for (uint i=_index; i<=arr.length;i++) {
            arr[i] = arr[i+1];
        }

        arr.pop();

    }

    function test() external {
        arr=[1,2,3,4,5];
        remove(2);

        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        assert(arr.length == 0);
    }
}

contract ArrayReplaceFromEnd {
    uint[] public arr;

    function remove(uint index) public {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }

    function test() public {
        arr = [1,2,3,4];

        remove(1);

        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);

        assert(arr[0]==1);
        assert(arr[1]==4);

    }


}