abstract class InCompletedRepairsStates{}

class InCompletedRepairsInit extends InCompletedRepairsStates{}

class InCompletedRepairsLoadingTasks extends InCompletedRepairsStates{}
class InCompletedRepairsGetTasksSuccess extends InCompletedRepairsStates{}
class InCompletedRepairsGetTasksError extends InCompletedRepairsStates{
  final String error;

  InCompletedRepairsGetTasksError(this.error);
}