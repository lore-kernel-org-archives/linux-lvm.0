Message-ID: <20031207011848.16285.qmail@web21005.mail.yahoo.com>
From: John Cheng <john_cheng71@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] lvdisplay
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
Date: Mon Dec  8 07:24:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

hi all guru:

  Just writing a script now and confused by the output from different option.
first LVM is striped over 2 PV, lvdisplay -v report a size of 500M and -c option
report 1032192 kb. and second LVM is a linear LVM, while -v report size of 300M
and -c report 614400 kb. read through MAN page a few rounds and google over the net,
did not get too much detail of the formula for the computation. seek help from any
one here. thanks

-------------------first lvm output
-v option
--- Logical volume ---
LV Name                /dev/vg01/lvol1
VG Name                vg01
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                504 MB
Current LE             126
Allocated LE           126
Stripes                2
Stripe size (KByte)    4
Allocation             next free
Read ahead sectors     1024
Block device           58:0

   --- Distribution of logical volume on 2 physical volumes  ---
   PV Name                  PE on PV     reads      writes
   /dev/hdb1                63           0          2
   /dev/hdb2                63           0          0

   --- logical volume i/o statistic ---
   0 reads  2 writes

   --- Logical extents ---
   LE    PV                        PE     reads      writes
   00000 /dev/hdb1                 00000  0          2
   00001 /dev/hdb1                 00001  0          0
   00002 /dev/hdb1                 00002  0          0
   .....................................
  
-c option
/dev/vg01/lvol1:vg01:3:1:0:0:1032192:126:126:0:1024:58:0

---------------------------second LVM
--- Logical volume ---
LV Name                /dev/vg45/lv45
VG Name                vg45
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                300 MB
Current LE             75
Allocated LE           75
Allocation             next free
Read ahead sectors     1024
Block device           58:1

   --- Distribution of logical volume on 1 physical volume  ---
   PV Name                  PE on PV     reads      writes
   /dev/hdb4                75           0          2

   --- logical volume i/o statistic ---
   0 reads  2 writes

   --- Logical extents ---
   LE    PV                        PE     reads      writes
   00000 /dev/hdb4                 00000  0          2
   00001 /dev/hdb4                 00001  0          0
   00002 /dev/hdb4                 00002  0          0
   00003 /dev/hdb4                 00003  0          0
...................................................
-c option output
/dev/vg45/lv45:vg45:3:1:0:0:614400:75:75:0:1024:58:1


__________________________________
Do you Yahoo!?
New Yahoo! Photos - easier uploading and sharing.
http://photos.yahoo.com/
