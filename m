Message-ID: <3BF2C5C3.944FCBBE@divsol.com>
From: Jim Cromie <jcromie@divsol.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 1.0.1-rc4 and kernel 2.4.14
References: <3BF19929.959A3055@phor.com>
Content-Transfer-Encoding: 7bit
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
Date: Wed Nov 14 13:26:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Darin Perusich wrote:

> "lvcreate -L5G -ntestlv test", or "vgextend test
> /dev/sdd" core dump

others have recommended -g -O0
I succeeded with -O1, with rh 7.1, gcc 2.96-85, using following patch to
configure


[root@groucho 1.0.1-rc4]# diff -u configure~ configure
--- configure~ Thu Sep  6 07:02:34 2001
+++ configure Tue Nov 13 10:49:31 2001
@@ -796,18 +796,26 @@

 fi

+${CC-cc} -v 2>&1 | grep -l 2.96
+if [ $? = 0 ] ; then
+    echo "this gcc version breaks with -g -O2"
+    optimize=1
+else
+    optimize=2
+fi
+
 echo "$ac_t""$ac_cv_prog_cc_g" 1>&6
 if test "$ac_test_CFLAGS" = set; then
   CFLAGS="$ac_save_CFLAGS"
 elif test $ac_cv_prog_cc_g = yes; then
   if test "$GCC" = yes; then
-    CFLAGS="-g -O2"
+    CFLAGS="-g -O$optimize"
   else
     CFLAGS="-g"
   fi
 else
   if test "$GCC" = yes; then
-    CFLAGS="-O2"
+    CFLAGS="-O$optimize"
   else
     CFLAGS=
   fi
[root@
