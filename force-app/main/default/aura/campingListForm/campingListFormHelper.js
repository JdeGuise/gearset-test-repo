({
    createItem : function(component, newItem) {
        const item = component.get("v.item");
        const updateEvent = component.getEvent("addItemEvent");
        updateEvent.setParams({ "item": item });
        updateEvent.fire();

        component.set('v.newItem', "{'sobjectType':'Camping_Item__c', 'Price__c':0, 'Quantity__c':0}");
    }
})