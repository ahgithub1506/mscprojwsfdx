({
	filter : function(component) {
		if (component.get("v.searchText")){
			let goodStuff = _.filter(component.get("v.allLeaves"), function(record){
				let contains = false;
				_.forEach(record, function(value){
        	contains = contains || _.includes(_.lowerCase(_.toString(value)), _.lowerCase(component.get("v.searchText")));
				});
				return contains;
			});
			component.set("v.filteredLeave", goodStuff);
		} else {
			//no searchText...just dump them in
			component.set("v.filteredLeave", component.get("v.allLeaves"));
		}
	}
})