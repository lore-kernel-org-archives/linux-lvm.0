From: "Christopher Briggs" <hpuxadm@choice.net>
Subject: RE: [linux-lvm] [Patch] lvchange better error reporting
Date: Sat, 15 Apr 2000 19:38:24 -0400
Message-ID: <NDBBKHFNKLCILCNALIHPGEIECBAA.hpuxadm@choice.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20000415203514.A21662@home.ds9a.nl>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: bert hubert <ahu@ds9a.nl>, mauelsha@ez-darmstadt.telekom.de, linux-lvm@msede.com

Quick question for Hubert "or" the general dist. list..

I've been watching the thread for about a week+ now, and am determined to go
with LVM, especially being so HPcentric and loving LVM for that platform.

With that in mind, I have a decision to make, which is(I think) switch to a
kernel other than Redhat's default 6.0/6.1 kernel(2.2.5).

What rev kernel would be best considering LVM and what is the best way to
get there(pointing me to a FAQ/www be more than appropriate.

Also, Heinz - What are you using to develop your GUI frontend?(just curious)

Thanks all,

Christopher.



-----Original Message-----
From: owner-linux-lvm@msede.com [mailto:owner-linux-lvm@msede.com]On
Behalf Of bert hubert
Sent: Saturday, April 15, 2000 2:35 PM
To: mauelsha@ez-darmstadt.telekom.de; linux-lvm@msede.com
Subject: [linux-lvm] [Patch] lvchange better error reporting


Heinz, people,

It annoyed me that lvchange sometimes reported that volume group "(null)"
was invalid. This patch fixes this behaviour. Please apply.

diff -u -r 0.8final.orig/tools/lvchange.c 0.8final/tools/lvchange.c
--- 0.8final.orig/tools/lvchange.c	Tue Feb 22 03:09:33 2000
+++ 0.8final/tools/lvchange.c	Sat Apr 15 20:32:34 2000
@@ -255,9 +255,15 @@
       /* does VG exist? */
       if ( opt_v > 0) printf ( "%s -- checking volume group existence\n",
cmd);
       if ( lvm_tab_vg_check_exist ( vg_name, NULL) != TRUE) {
-         fprintf ( stderr, "%s -- can't change logical volume: volume group
"
-                           "\"%s\" doesn't exist\n\n", cmd, vg_name);
-         return LVM_ELVCHANGE_VG_CHECK_EXIST;
+
+         if(vg_name)
+            fprintf ( stderr, "%s -- can't change logical volume: volume
group "
+                 "\"%s\" doesn't exist\n\n", cmd, vg_name);
+         else
+            fprintf ( stderr, "%s -- can't change logical volume: need to
specify "
+                              "volume group\n\n", cmd);
+
+         return LVM_ELVCHANGE_VG_CHECK_EXIST;
       }

       if ( opt_v > 0) printf ( "%s -- checking for active volume "

--
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
