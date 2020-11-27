function! s:FzfUrlView()
  let l:lines = s:GetAllLinesCurrentBuffer()
  let l:urls = s:MatchAllLinks(l:lines)
  if !len(l:urls)>0
    echo 'No URLs found in the buffer.'
    return -1
  else
    call fzf#run({
      \ 'source': l:urls,
      \ 'sink': function('s:OpenLink'),
      \ })
  endif
endfunction

function! s:GetAllLinesCurrentBuffer()
  return join(getline(1, '$'), "\n")
endfunction

function! s:MatchAllLinks(lines)
  let l:pattern_url = 'http[s]\?:\/\/[[:alnum:]\%\/_\#.-]*'
  let l:matched_urls = s:MatchAll(a:lines, l:pattern_url)
  let l:uniq_urls = uniq(filter(l:matched_urls, 'len(v:val)>0'))
  return l:uniq_urls
endfunction

" https://vi.stackexchange.com/a/16491/
function! s:MatchAll(str, pattern)
  let l:res = []
  call substitute(a:str, a:pattern, '\=add(l:res,submatch(0))', 'g')
  return l:res
endfunction

" Open links via netrw's gx functionality
function! s:OpenLink(url)
  call netrw#BrowseX(a:url, netrw#CheckIfRemote())
endfunction

command! FzfUrlView call s:FzfUrlView()
