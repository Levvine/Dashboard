({
	init : function(cmp) {
		var action = cmp.get('c.generate');
        action.setCallback(this, function(response) {  
            let state = response.getState();  
            if ( state === "SUCCESS" ) {  
                let showToast = $A.get( "e.force:showToast" );
                showToast.setParams({
                    title : 'Success',
                    message : 'Tweets have been updated.',
                    type : 'success',
                    mode : 'dismissible',
                });
                showToast.fire();
            }  else {  
                let showToast = $A.get( "e.force:showToast" );
                showToast.setParams({
                    title : 'Error',
                    message : 'Could not retrieve Tweets.',
                    type : 'error',
                    mode : 'dismissible',
                });
                showToast.fire();
            }
            $A.get("e.force:closeQuickAction").fire();  
            $A.get('e.force:refreshView').fire();  
        });  
        $A.enqueueAction(action);
	}
})