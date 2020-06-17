let s:repoPath=expand('<sfile>:p:h:h')
function! s:dbInit()
    let repoPath = s:repoPath
    let dbFile = '/misc/pyim-greatdict.txt'
    let dbCountFile = '/misc/pyim-greatdict_count.txt'

    let db = ZFVimIM_dbInit({
                \   'name' : 'great',
                \ })
    call ZFVimIM_cloudRegister({
                \   'repoPath' : repoPath,
                \   'dbFile' : dbFile,
                \   'dbCountFile' : dbCountFile,
                \   'gitUserEmail' : get(g:, 'ZFVimIM_pinyin_gitUserEmail', get(g:, 'zf_git_user_email', '')),
                \   'gitUserName' : get(g:, 'ZFVimIM_pinyin_gitUserName', get(g:, 'zf_git_user_name', '')),
                \   'gitUserToken' : get(g:, 'ZFVimIM_pinyin_gitUserToken', get(g:, 'zf_git_user_token', '')),
                \   'dbId' : db['dbId'],
                \ })
endfunction

augroup ZFVimIM_pinyin_augroup
    autocmd!
    autocmd User ZFVimIM_event_OnDbInit call s:dbInit()
augroup END

