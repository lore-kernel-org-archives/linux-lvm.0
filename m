Message-Id: <6.0.0.22.2.20031111224443.02452ef0@quake.swe.net>
From: Hjalmar =?iso-8859-1?Q?W=E5hlander?= <grazzy@quake.swe.net>
Mime-Version: 1.0
Subject: [linux-lvm] pvscan cant find my volume..
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
Date: Tue Nov 11 15:50:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

This started out when I rebooted my machine. Prior to the reboot I ran fsck 
on the lvm-filesystem and got quite alot of errors.

My vg contains three hdds:
hdc, hde and hdf.

----------------
[root@mircosoft /mnt]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
volume group "the_data" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group
-----------------

This error I've seen quite a few times in this list, however, as many 
replies are suggesting - running "pvcreate -ff" - does not help.
Why?

--------------
[root@mircosoft /mnt]# pvcreate -ff /dev/hdc
pvcreate -- device "/dev/hdc" has a partition table
---------------

And, to my surprise, dmesg, reports that hdc has a hdc1 (not that I can 
remember ever creating one... ), but anyway, how can I bypass this?

Some extras:

[root@mircosoft /mnt]# pvdisplay /dev/hdc
pvdisplay -- no physical volume identifier on "/dev/hdc"


(But it works fine on hde and hdf).


Im very grateful for any help!

--grazzy.
