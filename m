From: Bradley M Alexander <storm@tux.org>
Message-ID: <20011119010011.A891@sonsofthunder.yi.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] More research on lvm problems
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
Date: Sun Nov 18 23:59:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all,

I still have not gotten lvm to work as advertised. I used the old /var
partition since it would hang the machine because it could not mount the
/var partition in the volgroup.

The machine booted and I ran vgscan and vgchange -a y, and got the drive
errors prior to it finding and activating the volume group. I logged in and
tried to mount -a, and got the following:

[defiant /home/storm]# mount -a
mount: special device /dev/vg01/lvm_tmp does not exist
mount: special device /dev/vg01/lvm_home does not exist
mount: special device /dev/vg01/lvm_usrlocal does not exist
mount: special device /dev/vg01/lvm_opt does not exist
mount: special device /dev/vg01/lvm_backup does not exist
mount: special device /dev/vg01/lvm_archive does not exist

But looking in /dev:

[defiant /home/storm]# ls -l /dev/vg01
total 0
crw-r-----    1 root     root     109,   0 Dec 31  1969 group
brw-r-----    1 root     root      58,   0 Dec 31  1969 lv_archive
brw-r-----    1 root     root      58,   6 Dec 31  1969 lv_backup
brw-r-----    1 root     root      58,   3 Dec 31  1969 lv_home
brw-r-----    1 root     root      58,   5 Dec 31  1969 lv_opt
brw-r-----    1 root     root      58,   2 Dec 31  1969 lv_tmp
brw-r-----    1 root     root      58,   4 Dec 31  1969 lv_usrlocal
brw-r-----    1 root     root      58,   1 Dec 31  1969 lv_var

And finally, I can mount the filesystems individually:

[defiant /home/storm]# mount /dev/vg01/lv_usrlocal /usr/local
[defiant /home/storm]# mount /dev/vg01/lv_opt /opt           
[defiant /home/storm]# mount /dev/vg01/lv_tmp /tmp
[defiant /home/storm]# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda3              1542188   1069696    472492  70% /
/dev/hda1                 7746      3512      3834  48% /boot
/dev/hda5              1517920    768924    718156  52% /var
/dev/vg01/lv_archive  15728156  13261664   2466492  85% /archive
/dev/vg01/lv_home      1048540    877700    170840  84% /home
/dev/vg01/lv_usrlocal
                       1572812    965736    607076  62% /usr/local
/dev/vg01/lv_opt        511980    286836    225144  57% /opt
/dev/vg01/lv_tmp        155636     32848    122788  22% /tmp

Can anyone tell me why this is happening? The only time the drive errors
happen is when I vgscan, and not when the drive is in normal use. But why
must I manually mount the drives instead of using a mount -a (or better
yet, why can't the mount -a in the bootup make it happen)? Is it possible
that somewhere along the line, devfs is not properly registering the device
entries?

Thanks,
-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm@debian.org
                                         |   storm@tux.org
============================================================================
Try to look unimportant, they may be low on ammo.
						--Murphy's Laws of Combat
