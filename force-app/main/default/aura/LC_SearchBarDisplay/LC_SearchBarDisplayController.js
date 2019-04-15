({
    doInit : function(component, event, helper) {
        //get the product list
        let action = component.get("c.getLeaveDetails");
        action.setCallback(this, function(a){
            let state = a.getState();
            if (state === "SUCCESS") {
                let leave = JSON.parse(a.getReturnValue());
                component.set("v.allLeaves", leave);
                helper.filter(component);
            } else if (state === "ERROR") {
                console.log(a.getError());
            }
        });
        $A.enqueueAction(action);
    },
    
    callFilter : function(component, event, helper) {
        helper.filter(component);
    },
        
})