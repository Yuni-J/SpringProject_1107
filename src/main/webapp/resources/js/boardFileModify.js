console.log("boardModify in")

// 삭제
document.addEventListener('click', (e)=>{
    console.log(e.target);
    if(e.target.classList.contains('fdel')){
        // let li = e.target.closest('li');
        let uuid = e.target.dataset.uuid;
        removeFileToServer(uuid).then(result => {
            if(result == '1'){
                e.target.closest('li').remove();
                alert("파일 삭제 성공");
            } else{
                alert("파일 삭제 실패");
            }
            // // 파일 뿌리기
            // spreadFileList(bnoVal);
        })
    }
})

//delete 메서드
async function removeFileToServer(uuid) {
    try {
        const url = "/board/file/" + uuid;
        const config ={
            method: 'delete'
        }
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;        
    } catch (error) {
        console.log(error);
    }
}