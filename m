Date: Thu, 5 Oct 2000 19:39:34 +0100 (IST)
From: Paul Jakma <paulj@itg.ie>
Subject: [linux-lvm] lv inactive after reboot
Message-ID: <Pine.LNX.4.21.0010051925000.1212-100000@rossi.itg.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

hi,

I have an LV which i have made active with lvchange -ay, however after
a reboot it is inactive again (even though the rest of the LV's in
the VG start up fine with vgchange -ay).

the only difference between this LV and the rest that comes to mind is
that i had renamed it, and to do so i had to make the LV inactive.

what am i doing wrong?

[root@rossi /root]# lvdisplay /dev/Main_VG/games_xmame_lv 
lvdisplay -- logical volume "/dev/Main_VG/games_xmame_lv" is not
active; try -D


[root@rossi /root]# lvdisplay -D /dev/Main_VG/games_xmame_lv 
--- Logical volume ---
LV Name               /dev/Main_VG/games_xmame_lv
VG Name               Main_VG
LV Write Access       read/write
LV Status             NOT available
LV #                  7
# open                0
LV Size               400 MB
Current LE            100
Allocated LE          100
Allocation            next free
Read ahead sectors    120
Block device          58:6


[root@rossi /root]# fsck /dev/Main_VG/games_xmame_lv 
Parallelizing fsck version 1.18 (11-Nov-1999)
e2fsck 1.18, 11-Nov-1999 for EXT2 FS 0.5b, 95/08/09
fsck.ext2: Operation not permitted while trying to open
/dev/Main_VG/games_xmame_lv
You must have r/w access to the filesystem or be root
[root@rossi /root]# mount /usr/lib/games/xmame
mount: permission denied
[root@rossi /root]# lvchange -ay /dev/Main_VG/games_xmame_lv 
lvchange -- logical volume "/dev/Main_VG/games_xmame_lv" changed
lvchange -- doing automatic backup of volume group "Main_VG"

[root@rossi /root]# mount /usr/lib/games/xmame
<no error>

however on reboot, i will get the fsck "Op.. not permitted" error
because the LV isn't active. How do i make it permanently active
again???

regards,

paul jakma.
