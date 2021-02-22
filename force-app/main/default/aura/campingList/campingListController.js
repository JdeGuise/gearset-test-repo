({
    doInit: function(component, event, helper) {
        const action = component.get("c.getItems");
        action.setCallback(function(response) {
            const state = response.getState();

            if(state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    handleAddItem: function(component, event, helper) {
        const triggeringItem = event.getParam("item");

        const action = component.get("c.saveItem");
        const currentItems = component.get('v.items');

        action.setParams({
            "item":triggeringItem
        });
        action.setCallback(function(response) {
            const state = response.getState();
            if(state === 'SUCCESS') {
                currentItems.push(triggeringItem);
                component.set('v.items', currentItems);
                component.set('v.newItem', "{'sobjectType':'Camping_Item__c', 'Name': '', 'Quantity__c': 0, 'Price__c': 0, 'Packed__c': false}");
            }
        });
        // if(component.isValid()) {
        //     helper.createItem(component, JSON.serialize(triggeringItem));
        // }
    }
})