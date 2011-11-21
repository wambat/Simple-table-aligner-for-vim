" autoload/table-aligner.vim
" " Author:       Mike Konkov <http://chiefcoder.com/>
"
" " Install this file as autoload/table-aligner.vim.
"
function! AlignTable() range
	if a:lastline > a:firstline
ruby << EOF
		firstline =  VIM::evaluate('a:firstline')
		lastline = VIM::evaluate('a:lastline')
		align_table(firstline,lastline)
EOF
	endif
endfunction
map <silent> ttt :call AlignTable()<CR>
ruby << EOF
def length_utf8(s)
  count = 0
  s.scan(/./mu) { count += 1 }
  count
end
def ljust_utf8(s,len)
  ilen=length_utf8(s)
  if(len>ilen)
    return s+' '*(len-ilen)
  end
  s
end
def align_table(start, stop)
  maxcol=0
  lines=[]
  linelens=[]
  (start..stop).each do |line|
    str=$curbuf[line]+' '
    if cols=str.split("|").map{|str| str.strip}
      maxcol=cols.count if cols.count > maxcol
      lines << cols      # get max col lenght
      cols.each_with_index do |col,ind|
        linelens[ind]=0 unless linelens[ind]
	linelens[ind]=length_utf8(col) if length_utf8(col) > linelens[ind]
      end
    end
  end
  lines.each_with_index do |line,ind|
    str= line.each_with_index.map{|col,coli| ljust_utf8(col,linelens[coli])}.join("|")
    $curbuf[start+ind]=str
    #linelens[ind].to_s
  end
end
EOF
