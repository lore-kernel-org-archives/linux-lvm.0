Date: Fri, 4 Aug 2000 12:00:38 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: [linux-lvm] [patch] bug in lvm_remove_recursive.c
Message-ID: <20000804120038.A1069@gondor.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com
Cc: Linux-LVM-Bug@ez-darmstadt.telekom.de


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

I found a malloc size off-by-one bug in lvm_remove_recursive.c.
file_name is allocated with size strlen (dir) + strlen (dir_ent->d_name) + 2,
and then used with sprintf ( file_name, "%s/%s%c", dir, dir_ent->d_name, 0);
As sprintf automatically appends another 0 byte, the allocated memory is one
byte too short.

Normaly this doesn't hurt, but today, after I created a lv with the
relatively long name 'reisertest', I got a segmentation fault in vgscan.
Applying the attached patch cured that. 

Please note that I simply increase the malloc size. Now file_name is 
terminated by two 0 bytes. It may be better to remove the manually added
0, or to switch to snprintf (snprintf doesn't add a 0 byte, IIRC).

Jan



--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=diff

--- 0.8final/tools/lib/lvm_remove_recursive.c	Tue Feb 22 03:09:32 2000
+++ 0.8final-changed/tools/lib/lvm_remove_recursive.c	Fri Aug  4 11:07:04 2000
@@ -44,7 +44,7 @@
                     strcmp ( dir_ent->d_name,"..") == 0) continue;
                if ( ( file_name = malloc ( strlen (dir) +
                                            strlen (dir_ent->d_name) +
-                                           2)) == NULL) {
+                                           3)) == NULL) {
                   ret = -LVM_EREMOVE_RECURSIVE_MALLOC;
                   goto lvm_remove_recursive_end;
                }

--n8g4imXOkfNTN/H1--
