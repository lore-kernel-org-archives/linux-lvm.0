Message-Id: <00f401c1eb12$4df44f80$d204a8c0@pepper>
From: "Jim Pick" <jim@transvirtual.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [PATCH] vg_check_name.c
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
Date: Tue Apr 23 16:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 140957@bugs.debian.org
Cc: linux-lvm@sistina.com

This in regards to the following bug report I filed with Debian:


http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=140957&msg=4&repeatmerged=y
es

I did some more debugging to figure out what bit me, and it turns out that
my problem was that my volume group was named just "a", and there was a new
check added to 1.1rc1 in vg_check_name.c that matched it against "ataraid"
(defined in _devdir[] in lvm_dir_cache.c).  Very confusing.  I don't think
the check was intended to work that way, so here's a patch:

Index: vg_check_name.c
===================================================================
RCS file: /data/cvs/LVM/tools/lib/vg_check_name.c,v
retrieving revision 1.7
diff -u -r1.7 vg_check_name.c
--- vg_check_name.c 2002/03/12 13:58:04 1.7
+++ vg_check_name.c 2002/04/23 21:40:15
@@ -84,7 +84,7 @@
             else
                filter = _devdir[d];

-            if ( strncmp ( vg_name, filter, strlen ( vg_name)) == 0) {
+            if ( strncmp ( vg_name, filter, strlen ( filter)) == 0) {
                ret = -LVM_EVG_CHECK_NAME;
                break;
             }

This bit me on several machines, since I used the same naming convention.
:-(

Cheers,

 - Jim

BTW, I don't believe that the Debian bug severity should have been
downgraded to just "important", as I almost lost all my data.
