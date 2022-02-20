pragma solidity >=0.4.22 <0.9.0;

contract TodoList {

    constructor() {
        createTask("Task 001");
        createTask("Task 002");
    }

    uint256 public taskCount = 0;

    struct Task {
        uint256 id;
        string content;
        bool completed;
    }

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    mapping(uint256 => Task) public tasks;

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    event TaskCompleted(
        uint id,
        bool completed
    );

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
}
