Return-Path: <claudio@conectiva.com>
Date: Fri, 22 Dec 2000 18:21:40 -0500 (EST)
From: Claudio Matsuoka <claudio@conectiva.com>
Message-ID: <Pine.LNX.4.30.0012221813290.1074-100000@pokey.distro.conectiva>
MIME-Version: 1.0
Subject: [linux-lvm] [PATCH] user check in lvmiopversion
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Quite trivial, but avoids misleading error messages like

  [claudio@pokey:/home/claudio] vgscan
  lvmiopversion -- LVM driver/module not loaded?

  vgscan: /lib/lvm-iop not found.  Is lvm-iop installed?

when running a wrapped tool. Also a test for the return value != 0 is
needed in the wrapper script:

IOP=`/sbin/lvmiopversion`
ret=$?
if [ $ret -ne 0 ]; then
    exit $ret
fi

---8<-----

--- lvmiopversion.c-orig	Fri Dec 22 18:06:14 2000
+++ lvmiopversion.c	Fri Dec 22 18:05:57 2000
@@ -19,6 +19,12 @@
  * Boston, MA 02111-1307, USA.
  */

+/*
+ * Changelog
+ *
+ *    22/12/2000 - added SUSER_CHECK to avoid complaints about module
+ *                 not loaded. --claudio
+ */
 #include <stdio.h>
 #include <lvm_user.h>

@@ -31,6 +37,8 @@
 int main(int argc, char *argv[])
 {
 	int ver = lvm_get_iop_version();
+
+	SUSER_CHECK;

 	if (ver < 0) {
 		fprintf(stderr, "%s -- LVM driver/module not loaded?\n\n", cmd);
