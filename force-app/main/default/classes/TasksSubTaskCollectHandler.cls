public class TasksSubTaskCollectHandler {
    public Static void projectDuration (map<id,SubTask__c>newTaskMap){
        list<Id>closedSubTaskId =new list<Id>();
        for(SubTask__c checkSubTaskStatus:newTaskMap.values()){
            if(checkSubTaskStatus.Status__c=='Closed'&& checkSubTaskStatus.SubDuration__c!=Null){
                closedSubTaskId.add(checkSubTaskStatus.Tasks_Id__c);
            }
        }
        list<Tasks__c> storeTasksAndProject = [Select Project_Id__c,Name from Tasks__c where Id IN: closedSubTaskId];
        list<Id>projectId =new list<Id>();
        for(Tasks__c taskProjectId :storeTasksAndProject){ 
            projectId.add(taskProjectId.Project_Id__c);
        }
        list<Id>allTaskId =new list<Id>();
        Map<Id,Project__c>projectIdDatas =new Map<Id,Project__c>();
        list<Project__c>projectData =[select Id,TotalDuration__c From Project__c where Id IN: projectId];
        for(Project__c assignTotalDuration :projectData){
            allTaskId.add(assignTotalDuration.Id);
            projectIdDatas.put(assignTotalDuration.Id,assignTotalDuration);
        }
        list<Tasks__c>getTaskAndSub =[Select Project_Id__c ,(Select SubDuration__c From SubTask__r) From Tasks__c where Project_Id__c IN:allTaskId];
        for(Tasks__c itrateForSubtask :getTaskAndSub){
            integer hourInternal=0;
            integer  mintute =0;         
            for(SubTask__c itrateForDuration :itrateForSubtask.SubTask__r){             
                list<string>str =String.valueOf(itrateForDuration.SubDuration__c).split('\\.');
                hourInternal += integer.valueOf(str[0]);
                mintute  += integer.valueOf(str[1]);               
            }
            integer extraHour =   mintute/60;
            integer extraMin= mintute-(extraHour*60);
            hourInternal= hourInternal+extraHour;
            double totalDuration=  double.valueOf(string.valueOf(hourInternal)+'.'+string.valueOf(extraMin));  
            projectIdDatas.get(itrateForSubtask.Project_Id__c).TotalDuration__c =  totalDuration; 
        }        
        update projectIdDatas.values();        
    }
}