Return-Path: <penguin_master_2000@yahoo.com>
Message-ID: <20010126114139.86952.qmail@web10904.mail.yahoo.com>
Date: Fri, 26 Jan 2001 03:41:39 -0800 (PST)
From: "Mr. Penguin" <penguin_master_2000@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Various strangeness (beta3,2.4.0/devfs)
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi

I'm getting a few strange things happening which may
be related to devfs. I'm running 2.4.0 with
0.9.1beta3, and reiserfs 3.6.26. My root filesystem is
on LVM so I'm using an initial ramdisk.

1. When my initrd does a vgscan it works OK with no
errors.

2. When it does vgchange, it works but i get this
error:
devfs: devfs_register(): device already registered:
"group"
(not important, i know, but I like a tidy bootup :) )

3. When the system has booted, doing any vgscans
produces this output:

[root@fuse /root]# vgscan
vgscan -- reading all physical volumes (this may take
a while...)
vgscan -- found active volume group "vg00"
vgscan -- problem creating volume group directory
/dev/vg00
vgscan -- ERROR "vg_create_dir_and_group(): mkdir"
creating volume group directory and special files
vgscan -- ERROR "vg_create_dir_and_group(): mkdir"
creating "/etc/lvmtab" and "/etc/lvmtab.d"

4. If I "lvremove" an LV, the block special device is
not removed:
[root@fuse /root]# lvremove /dev/vg00/new_lvol3 
lvremove -- do you really want to remove
"/dev/vg00/new_lvol3"? [y/n]: y
lvremove -- doing automatic backup of volume group
"vg00"
lvremove -- logical volume "/dev/vg00/new_lvol3"
successfully removed

[root@fuse /root]# lvcreate -nnew_lvol3 -l24 vg00
lvcreate -- block special /dev/vg00/new_lvol3 already
exists

[root@fuse /root]# ls -l /dev/vg00/new_lvol3 
brw-rw----    1 root     root      58,  21 Jan 26
11:43 /dev/vg00/new_lvol3

That's about all I've found so far. Please let me know
if you require any debugging output!

Thanks

James


__________________________________________________
Do You Yahoo!?
Yahoo! Auctions - Buy the things you want at great prices. 
http://auctions.yahoo.com/
