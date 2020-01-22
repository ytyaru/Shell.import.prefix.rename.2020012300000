ShowHead() { echo "===== ${FUNCNAME[1]} ====="; }
TestImports() {
	ShowHead
	. ./moduled_imports.sh lib.sh sub/lib2.sh 'sub/su b/li b3.sh'
	#MyLib
	lib.MyLib
	lib.MyLibA
	sub.lib2.MyLib2
	sub.su-b.li-b3.MyLib3
	unset -f lib.MyLib; unset -f lib.MyLibA; unset -f sub.lib2.MyLib2; unset -f sub.su-b.li-b3.MyLib3;
}
TestImport() {
	ShowHead
	. ./moduled_import.sh lib.sh 
	lib.MyLib
	lib.MyLibA
	. ./moduled_import.sh sub/lib2.sh
	sub.lib2.MyLib2
	. ./moduled_import.sh 'sub/su b/li b3.sh'
	sub.su-b.li-b3.MyLib3
}
TestImportAliasPrefixShallow() {
	ShowHead
	. ./moduled_import.sh lib.sh as L
	L.MyLib
	L.MyLibA
	. ./moduled_import.sh sub/lib2.sh as L2
	L2.MyLib2
	. ./moduled_import.sh 'sub/su b/li b3.sh' as L3
	L3.MyLib3
}
TestImportAliasPrefixDeep() {
	ShowHead
	. ./moduled_import.sh lib.sh as A.B.C
	A.B.C.MyLib
	A.B.C.MyLibA
	. ./moduled_import.sh sub/lib2.sh as A.B.C
	A.B.C.MyLib2
	. ./moduled_import.sh 'sub/su b/li b3.sh' as A.B.C
	A.B.C.MyLib3
}
TestImportPartialPrefix0() {
	ShowHead
	. ./moduled_import.sh lib.sh -0
	MyLib
	MyLibA
	. ./moduled_import.sh sub/lib2.sh -0
	MyLib2
	. ./moduled_import.sh 'sub/su b/li b3.sh' -0
	MyLib3
	. ./moduled_import.sh 'sub/su b/sub4/lib4.sh' -0
	MyLib4
}
TestImportPartialPrefix1() {
	ShowHead
	. ./moduled_import.sh lib.sh -1
	lib.MyLib
	lib.MyLibA
	. ./moduled_import.sh sub/lib2.sh -1
	lib2.MyLib2
	. ./moduled_import.sh 'sub/su b/li b3.sh' -1
	li-b3.MyLib3
	. ./moduled_import.sh 'sub/su b/sub4/lib4.sh' -1
	lib4.MyLib4
}
TestImportPartialPrefix2() {
	ShowHead
	. ./moduled_import.sh lib.sh -2
	lib.MyLib
	lib.MyLibA
	. ./moduled_import.sh sub/lib2.sh -2
	sub.lib2.MyLib2
	. ./moduled_import.sh 'sub/su b/li b3.sh' -2
	su-b.li-b3.MyLib3
	. ./moduled_import.sh 'sub/su b/sub4/lib4.sh' -2
	sub4.lib4.MyLib4
}
TestImportPartialPrefix3() {
	ShowHead
	. ./moduled_import.sh lib.sh -3
	lib.MyLib
	lib.MyLibA
	. ./moduled_import.sh sub/lib2.sh -3
	sub.lib2.MyLib2
	. ./moduled_import.sh 'sub/su b/li b3.sh' -3
	sub.su-b.li-b3.MyLib3
	. ./moduled_import.sh 'sub/su b/sub4/lib4.sh' -3
	su-b.sub4.lib4.MyLib4
}
TestImportPartialPrefix4() {
	ShowHead
	. ./moduled_import.sh lib.sh -4
	lib.MyLib
	lib.MyLibA
	. ./moduled_import.sh sub/lib2.sh -4
	sub.lib2.MyLib2
	. ./moduled_import.sh 'sub/su b/li b3.sh' -4
	sub.su-b.li-b3.MyLib3
	. ./moduled_import.sh 'sub/su b/sub4/lib4.sh' -4
	sub.su-b.sub4.lib4.MyLib4
}
TestImports
TestImport
TestImportAliasPrefixShallow
TestImportAliasPrefixDeep
TestImportPartialPrefix0
TestImportPartialPrefix1
TestImportPartialPrefix2
TestImportPartialPrefix3
