Message-Id: <sf12bd11.080@gwia201.syr.edu>
From: "Stephen Fralich" <sjfralic@syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: [linux-lvm] pvmove error
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
Date: Mon Jul 14 13:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'm running RedHat 9.  pvmove works fine with the LVM and kernel that come =
with RH9.  I would like to use XFS in place of ext3 though, which means =
patching the kernel.  I'm using the vanilla kernel 2.4.21 and lvm 1.0.7 =
(tools and driver).  Everything goes fine until I use pvmove.  I haven't =
patched the kernel for XFS yet, so the LVM patch is the only change to the =
kernel.   I'm using an IBM ServeRAID-4H card with the ips driver v6.00.31. =
 Any suggestions?  Thanks.

[root@sauron root]# pvmove -vv /dev/sdb /dev/sdc
pvmove -- checking name of source physical volume "/dev/sdb"
pvmove -- locking logical volume manager
pvmove -- reading data of source physical volume from "/dev/sdb"
pvmove -- checking volume group existence
pvmove -- reading data of volume group "vg03" from lvmtab
pvmove -- checking volume group consistency of "vg03"
pvmove -- searching for source physical volume "/dev/sdb" in volume group =
"vg03"
pvmove -- building list of possible destination physical volumes
pvmove -- checking destination physical volume names in command line
pvmove -- checking volume group activity
pvmove -- moving physical extents in active volume group "vg03"
pvmove -- WARNING: if you lose power during the move you may need
        to restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- starting to move extents away from physical volume "/dev/sdb"
pvmove -- checking for enough free physical extents in "vg03"
lv: /dev/vg03/lv03[1]  old_dev: 08:16  new_dev: 08:32  old_pe_sector: =
33152  new_pe_sector: 33152
pvmove -- opening output physical volume "/dev/sdc"
pvmove -- llseeking input physical volume "/dev/sdb"
pvmove -- llseeking output physical volume "/dev/sdc"
pvmove -- /dev/sdb [PE 0 [lv03 [LE 0]] -> /dev/sdc [PE 0] [1/8677]
pvmove -- copying extent from /dev/sdb::/dev/vg03/lv03(0x0810):33152 to =
/dev/sdc(0x0820):33152 on disk
/dev/vg03/group::/dev/vg03/lv03: 0810 33152, 0820 33152
pvmove -- ERROR "Inappropriate ioctl for device" copying extent from =
"/dev/sdb"

pvmove -- ERROR "Inappropriate ioctl for device" moving physical extents

This appears on the console as well ::=20
lvm -- lvm_chr_ioctl: unknown command 0x4004fe51

Stephen

---------------------------------------------------------------------
Computer & Information Technology Group            help@ecs.syr.edu
College of Engineering & Computer Science          Link 204, 443-4308
Syracuse University
