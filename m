Message-ID: <3BF14F8E.477BC73E@divsol.com>
From: Jim Cromie <jcromie@divsol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] patch to fix segfault complaints.
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
Date: Tue Nov 13 10:50:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

others have noted various segfaults,
ex:

>>vgextend -- extending volume group "vg01" by physical volume
"/dev/hde1"
>>in kernel
>>Segmentation fault (core dumped)


This patch fixes configure script to build good (no segfault) lvm tools
for me
theres probably a more comprehensive way to do this, ymmv.

note also that Im only checking for 2.96, not 2.96-85.  this may or may
not matter


[root@groucho 1.0.1-rc4]# diff -u configure configure~
--- configure Tue Nov 13 09:35:54 2001
+++ configure~ Thu Sep  6 07:02:34 2001
@@ -796,33 +796,22 @@

 fi

-${CC-cc} -v 2>&1 | grep -l 2.96
-if [ $? = 0 ] ; then
-    echo "this gcc version breaks with -g -O2"
-    optimize=1
-else
-    optimize=2
-fi
-
 echo "$ac_t""$ac_cv_prog_cc_g" 1>&6
 if test "$ac_test_CFLAGS" = set; then
   CFLAGS="$ac_save_CFLAGS"
 elif test $ac_cv_prog_cc_g = yes; then
   if test "$GCC" = yes; then
-    CFLAGS="-g -O$optimize"
+    CFLAGS="-g -O2"
   else
     CFLAGS="-g"
   fi
 else
   if test "$GCC" = yes; then
-    CFLAGS="-O$optimize"
+    CFLAGS="-O2"
   else
     CFLAGS=
   fi
 fi

 # Find a good install program.  We prefer a C program (faster),
 # so one script is as good as another.  But avoid the broken or
