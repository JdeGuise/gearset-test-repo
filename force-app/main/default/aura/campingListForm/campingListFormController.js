({
    clickCreateItem : function(component, event, helper) {
        // const validItem = component.find('itemform').reduce(function(stillValid, inputComponent) {
        //     return stillValid && inputComponent.get('v.validity').valid;
        // }, true);

        // if(validItem) {
        const newItem = component.get("v.newItem");
        console.log("create item: " + JSON.stringify(newItem));

        helper.createItem(component, JSON.stringify(newItem));
        // }
    }
})