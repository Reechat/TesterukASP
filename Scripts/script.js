function countScore(login,test) {
    let inputs = document.getElementsByTagName('input');
    let count = 0;
    for (let input of inputs) 
    {
        if (input.checked == true) 
        {
            count+=Number(input.value);
        }
    }
    var req = { "id": login, "count": count, "test": test };
   $.ajax(
    {
        url: '/api/addhistory/post',
        async: false,
        type: "POST",
        data: req,
    });
}