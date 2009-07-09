function toggleDescriptionClass(id) {
	e = document.getElementById('checkbox_description_' + id);
	if (e.className == "incomplete") {
		e.className = "complete";
	} else {
		e.className = "incomplete";
	}
}