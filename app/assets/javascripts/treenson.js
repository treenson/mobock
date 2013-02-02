function fillValuesInTextBoxes()
{
	var text=document.getElementById("content").value;
	document.getElementById("content").value="\<img src= \" \"\> \<br\> "+text;
}
