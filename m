From: Steve_J_Brueggeman@notes.seagate.com
Message-ID: <88256797.005B400D.00@sv-gw1.stsv.seagate.com>
Date: Mon, 21 Jun 1999 11:32:31 -0500
Subject: Re: [linux-lvm] pvcreate once more
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


Oops, I forgot to copy the list.
---------------------- Forwarded by Steve J Brueggeman on 06/21/99 11:34 AM
---------------------------


Steve J Brueggeman
06/21/99 11:30 AM

To:   Udo Weber <udo.weber@mainz.ibm.de> @ INTERNET
cc:

Subject:  Re: [linux-lvm] pvcreate once more  (Document link not converted)


Yep, you've found a bug.  The problem is that you've got a Win-98 extended
partition, (ID=0x0f).

When LVM goes through to determine the validity of the partition you
specified, it does not recognize that  you have any extended partitions,
thusly, does not scan for any logical partions on an extended partition.

Try this patch.  (WARNING!! I have not tried this patch, so use at your own
risk!!!))
To apply this patch, cut-it-out of your E-Mail, and type the following
cd {your-lvm-source-tree}; patch -p1 <{win98-patch-filename}

Where {your-lvm-source-tree} is the name of the directory you untared the
LVM sources, and {win98-patch-filename} is the directory/filename of the
patch file listed below.  (don't type the braces in the command line above)


Steve Brueggeman

-------------Cut here--------------
diff -Naur 0.6.new.b/tools/lib/pv_get_size.c
0.6.new.c/tools/lib/pv_get_size.c
--- 0.6.new.b/tools/lib/pv_get_size.c    Thu Feb 25 18:46:28 1999
+++ 0.6.new.c/tools/lib/pv_get_size.c    Mon Jun 21 11:19:39 1999
@@ -111,10 +111,11 @@
                  i, part[i].sys_ind, i, part[i].nr_sects);
 #endif
          /* is it a welcome extended partition? */
-         if ( part[i].sys_ind == DOS_EXTENDED_PARTITION ||
+         if ( part[i].sys_ind == DOS_EXTENDED_PARTITION   ||
+          part[i].sys_ind == WIN98_EXTENDED_PARTITION ||
               part[i].sys_ind == LINUX_EXTENDED_PARTITION) {
 #ifdef DEBUG
-            debug ( "pv_get_size -- DOS/LINUX_EXTENDED_PARTITION\n");
+            debug ( "pv_get_size --
DOS/LINUX/WIN98_EXTENDED_PARTITION\n");
 #endif
             extended_flag = 1;
             offset = extended_offset + part[i].start_sect;
diff -Naur 0.6.new.b/tools/pvcreate.c 0.6.new.c/tools/pvcreate.c
--- 0.6.new.b/tools/pvcreate.c     Thu Feb 25 18:46:29 1999
+++ 0.6.new.c/tools/pvcreate.c     Mon Jun 21 11:22:55 1999
@@ -199,6 +199,11 @@
                               "\"%s\"\n",
                               cmd, pv_name);
             continue;
+         } else if ( part.sys_ind == WIN98_EXTENDED_PARTITION) {
+            fprintf ( stderr, "%s -- can't use Win-98 extended partition "
+                              "\"%s\"\n",
+                              cmd, pv_name);
+            continue;
          } else if ( part.sys_ind != LVM_PARTITION) {
             fprintf ( stderr, "%s -- invalid partition type 0x%x for
\"%s\""
                               " (must be 0x%x)\n", cmd, part.sys_ind,
-------------Cut here--------------







Udo Weber <udo.weber@mainz.ibm.de> on 06/21/99 09:30:16 AM

To:   linux-lvm@msede.com
cc:    (bcc: Steve J Brueggeman)

Subject:  [linux-lvm] pvcreate once more




Hi,
sorry for the last mail, I don't know why but something was left of this
mail.
Here now (I hope so) the complete mail once more and for insurence also
the same as
attachment:
******************************************************************
Hi LVM-specialists,

<Snippage>
mumpel:~ # fdisk -l

Disk /dev/hda: 240 heads, 63 sectors, 1058 cylinders
Units = cylinders of 15120 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1       271   2048728+   b  Win95 FAT32
/dev/hda2           272      1057   5942160    f  Win95 Extended (LBA)
/dev/hda5           272       548   2094088+   6  DOS 16-bit >=32M
/dev/hda6           549       687   1050808+   6  DOS 16-bit >=32M
/dev/hda7           688       705    136048   82  Linux swap
/dev/hda8           706       841   1028128   83  Linux native
/dev/hda9           842       977   1028128+  83  Linux native
/dev/hda10          978      1057    604768   fe  Unknown

mumpel:~ # pvcreate /dev/hda10
pvcreate -- extended partition "/dev/hda10" doesn't exist


and here now the debug-info from pvcreate:
mumpel:~ # pvcreate -d /dev/hda10
lvm_iop_version -- CALLED
lv_status_internal -- AFTER ioctl ret: 0
lvm_iop_version -- LEAVING with ret: 0
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda10"
pv_check_name -- LEAVING with ret: 0
pv_get_size -- CALLED with /dev/hda10 and BFFFF70C
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda10"
pv_check_name -- LEAVING with ret: 0
pv_check_part -- CALLED with /dev/hda10
pv_check_name -- CALLED
lvm_check_chars -- CALLED
lvm_check_chars -- LEAVING
pv_check_name -- CALLED  pv_name: "/dev/hda10"
pv_check_name -- LEAVING with ret: 0
pv_check_part -- LEAVING with 10
pv_get_size -- BEFORE llseek 0:0
pv_get_size -- part[0].sys_ind: B  part[0].nr_sects: 4097457
pv_get_size -- first == 1
pv_get_size -- part[1].sys_ind: F  part[1].nr_sects: 11884320
pv_get_size -- first == 1
pv_get_size -- part[2].sys_ind: 0  part[2].nr_sects: 0
pv_get_size -- first == 1
pv_get_size -- part[3].sys_ind: 0  part[3].nr_sects: 0
pv_get_size -- first == 1
pv_get_size -- LEAVING with ret: -242
pvcreate -- extended partition "/dev/hda10" doesn't exist

The same on RedHat 6.0 - same config.
only one different output:
[root@mumpel 0.6]# fdisk -l
Disk /dev/hda: 240 heads, 63 sectors, 1058 cylinders
Units = cylinders of 15120 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1       271   2048728+   b  Win95 FAT32
/dev/hda2           272      1057   5942160    f  Win95 Ext'd (LBA)
/dev/hda5           272       548   2094088+   6  FAT16
/dev/hda6           549       687   1050808+   6  FAT16
/dev/hda7           688       705    136048   82  Linux swap
/dev/hda8           706       841   1028128   83  Linux
/dev/hda9           842       977   1028128+  83  Linux
/dev/hda10          978      1057    604768   fe  LANstep

##########################################################################

What was going wrong here ?
What should I do ?

I'd like to use the LVM for testing. I'm primary working in the
AIX-support-center.
My special field there are LVM-problems :)


Thanks with warm regards,
Udo Weber
***************************************************************************

Maybe I put a dot (".") too much between the lines in the last email :)

But the prob should be the same, I read the answers from Heinz, now I
think here is realy
a problem.

Thanks,
Udo




Welcome to SuSE Linux 6.1 (i386) - Kernel 2.2.10 (tty4).
