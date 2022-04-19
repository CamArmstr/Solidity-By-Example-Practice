pragma solidity ^0.8.10;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }


    //An Array of Todo structs
    Todo[] public todos;

    function create(string memory _text) public {
        // 3 ways to initialize a struct
        //  Call it like a function

        todos.push(Todo(_text, false));

        // key value mapping
        todos.push(Todo({text: _text, completed:false}));

        // initialize an empty struct and update it
        Todo memory todo;
        todo.text = _text;

        todos.push(todo);

    }

    // A getter is automatically created for structs so you don't need this getter we're about to write

    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);

    }

    // Update text
    function update(uint _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed

    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;

    }

}
