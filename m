Message-ID: <3DA1C82F.5080406@mvista.com>
From: Steven Dake <sdake@mvista.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030507010902030307090007"
Subject: [linux-lvm] Broken compile scripts in LVM
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Oct  7 13:31:46 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.
--------------030507010902030307090007
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Folks,

Some of the scripts use echo "string" > /dev/stderr when instead they 
should be using echo "string" >&2.  I have attached a patch that fixes 
this problem.  The result is that in automated builds, the stdout gets 
stomped if you use the first technique (resulting in loss of logging data).

Thanks.

-steve

--------------030507010902030307090007
Content-Type: text/plain;
 name="lvm-echo-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lvm-echo-fix.patch"

diff -u3 lvm-1.0.5/scripts/iopver lvm-1.0.5-fixed/scripts/iopver
--- lvm-1.0.5/scripts/iopver	Tue Jan 22 06:54:13 2002
+++ lvm-1.0.5-fixed/scripts/iopver	Thu Oct  3 19:46:40 2002
@@ -48,21 +48,19 @@
 	sed -e 's/.*LVM_LIB_IOP_VERSION[[:space:]]*\([[:digit:]]*\).*/\1/'`;
 
 if [ -z "$ver1" ]; then
-	echo "Error: iopver can't determine the IOP version from $file1" > \
-		/dev/stderr;
+	echo "Error: iopver can't determine the IOP version from $file1" >&2 ;
 	exit -1;
 fi
 
 if [ -z "$ver2" ]; then
-        echo "Error: iopver can't determine the IOP version from $file2" > \    
-		/dev/stderr;
+        echo "Error: iopver can't determine the IOP version from $file2" >&2 ;
         exit -2;
 fi
 
 if [ "$ver1" != "$ver2" ]; then
-	echo -e "Error: iopver reading inconsistent IOP versions" > /dev/stderr
-	echo -e "IOP version $ver1 reported in $file1" > /dev/stderr
-	echo -e "IOP version $ver2 reported in $file2" > /dev/stderr
+	echo -e "Error: iopver reading inconsistent IOP versions" >&2
+	echo -e "IOP version $ver1 reported in $file1" >&2
+	echo -e "IOP version $ver2 reported in $file2" >&2
 	exit -3;
 fi	
 echo "$ver1"
diff -u3 lvm-1.0.5/scripts/linuxver lvm-1.0.5-fixed/scripts/linuxver
--- lvm-1.0.5/scripts/linuxver	Tue Jan 22 06:54:13 2002
+++ lvm-1.0.5-fixed/scripts/linuxver	Thu Oct  3 19:46:26 2002
@@ -42,7 +42,7 @@
 file="${linux_src}/Makefile";
 
 if [ ! -e $file ]; then
-	echo "linuxver - $file does not exist" > /dev/stderr;
+	echo "linuxver - $file does not exist" >&2;
 	exit -1;
 fi
 
@@ -69,7 +69,7 @@
 		echo "${major}.${minor}.${sublvl}";
 	fi;
 else
-	echo "linuxver: Unable to determine version of linux kernel in ${linux_src}" > /dev/stderr;
+	echo "linuxver: Unable to determine version of linux kernel in ${linux_src}" >&2;
 	exit -2;
 fi
 
diff -u3 lvm-1.0.5/scripts/lvmver lvm-1.0.5-fixed/scripts/lvmver
--- lvm-1.0.5/scripts/lvmver	Thu Aug 23 12:53:32 2001
+++ lvm-1.0.5-fixed/scripts/lvmver	Thu Oct  3 19:46:12 2002
@@ -46,8 +46,7 @@
 	sed -e 's/\(#define[[:blank:]]LVM_RELEASE_NAME[[:blank:]]*"\)\([-.[:alnum:]^\n]*\)\(".*\)/\2/'`;
 
 if [ -z "$ver" ]; then
-	echo "Error: iopver can't determine the IOP version from $file" > \
-		/dev/stderr;
+	echo "Error: iopver can't determine the IOP version from $file" >&2;
 	exit -1;
 fi
 
diff -u3 lvm-1.0.5/scripts/patch_fragment.sh lvm-1.0.5-fixed/scripts/patch_fragment.sh
--- lvm-1.0.5/scripts/patch_fragment.sh	Wed Aug 29 08:52:16 2001
+++ lvm-1.0.5-fixed/scripts/patch_fragment.sh	Thu Oct  3 19:44:37 2002
@@ -22,7 +22,7 @@
 relative=${orig:$((${#kernel_path} + 1))};
 
 if ! [ -a $new ]; then
-	echo "$new not found" > /dev/stderr
+	echo "$new not found" >&2
 	exit 2;
 fi
 

--------------030507010902030307090007--
