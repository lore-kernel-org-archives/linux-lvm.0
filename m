Date: Sat, 25 Sep 1999 00:49:15 +0200 (CEST)
From: Andreas Kostyrka <andreas@mtg.co.at>
Subject: [linux-lvm] LVM 0.7: optimization bug
Message-ID: <Pine.LNX.4.10.9909250041580.8042-100000@gatekeeper.zwax.mtg.co.at>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Mailinglist <linux-lvm@msede.com>

Hi!

I've found some buggy assumptions (in my case, like that I do have
16 loop devices. RH6 comes with loop0-loop7).

The following patch fixes this:
diff -uNr LVM.org/0.7/tools/lib/pv_read_all_pv.c
LVM/0.7/tools/lib/pv_read_all_pv.c
--- LVM.org/0.7/tools/lib/pv_read_all_pv.c      Mon Jul 12 23:21:26 1999
+++ LVM/0.7/tools/lib/pv_read_all_pv.c  Sat Sep 25 03:19:51 1999
@@ -99,13 +99,6 @@
          debug ( "pv_read_all_pv -- calling pv_read with \"%s\"\n",
                   dev_name);
 #endif
-         if ( ( tst = open ( dev_name, O_RDONLY)) == -1) {
-            if ( MAJOR ( dir_cache[n].st_rdev) != MD_MAJOR &&
-                 MINOR ( dir_cache[n].st_rdev) % 16 == 0) {
-               n += 15;
-               continue;
-            }
-         } else close ( tst);
 
          pv_read_errno = 0;
          if ( ( ret = pv_read ( dev_name, &pv_tmp, &pv_read_errno)) == 0
||


Andreas
--
Andreas Kostyrka                     | andreas@mtg.co.at
phone: +43/1/7070750                 | phone: +43/676/4091256   
MTG Handelsges.m.b.H.                | fax:   +43/1/7065299
Raiffeisenstr. 16/9                  | 2320 Zwoelfaxing AUSTRIA        
