({
    createItem : function(component, newItemFromController) {
        const newItem = JSON.parse(newItemFromController);
        const action = component.get("c.saveItem");
        const currentItems = component.get('v.items');

        action.setParams({
            "item":newItem
        });
        action.setCallback(function(response) {
            const state = response.getState();
            if(state === 'SUCCESS') {
                currentItems.push(newItem);
                component.set('v.items', currentItems);
                component.set('v.newItem', "{'sobjectType':'Camping_Item__c', 'Name': '', 'Quantity__c': 0, 'Price__c': 0, 'Packed__c': false}");
            }
        });
    }
})