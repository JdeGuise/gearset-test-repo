({
    packItem : function(component, event, helper) {
        const btnClicked = event.getSource();

        if(btnClicked) {
            component.set("v.name.Packed__c", true);
            event.getSource("v.disabled", true);
        }

    }
})