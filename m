Message-ID: <01FA7817D8EDD211BD9C00004B309A504D3AC8@defiant.sonera.se>
From: Fredrik Lindgren <fredrik@tfi.net>
Subject: [linux-lvm] LVM tool problems?
Date: Tue, 22 Feb 2000 09:56:52 +0100
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

Hi!

I just installed LVM on a newsfeed box jus to see
if it could take it. Filesystem is ReiserFS.

The machine crashed, I don't know which software
was at "fault" but the problem I have is that I
cannot get the LVM to start again.

This is what I get:

[root@newsfeed /root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "vg01"
vgscan -- ERROR -154: can't get data of volume group "vg01" from physical
volume(s)
vgscan -- ERROR -154 creating "/etc/lvmtab" and "/etc/lvmtab.d"

Also, this seems weird:

[root@newsfeed /root]# lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/sda1         [      39.19 MB] Primary  LINUX native
partition [0x83]
lvmdiskscan -- /dev/sda2         [       3.81 GB] Primary  LINUX native
partition [0x83]
lvmdiskscan -- /dev/sda3         [     196.11 MB] Primary  LINUX swap
partition [0x82]
lvmdiskscan -- /dev/sdb          [      31.97 GB] USED LVM whole disk
lvmdiskscan -- /dev/sdc          [      31.97 GB] USED LVM whole disk
lvmdiskscan -- /dev/sdd          [      31.97 GB] USED LVM whole disk
lvmdiskscan -- 4 disks
lvmdiskscan -- 3 whole disks
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 3 partitions
lvmdiskscan -- 0 LVM physical volume partitions

/dev/sd[b-d] is not 31Gb, they a 4Gb disks. I tried the 
vgcfgrestore command, but it says to use the vgscan tool, 
which fails.

Linux is 2.2.14 with LVM 0.8-pre02.10.1999 and ReiserFS 3.5.16.
Mandrake 7.0 system. Monolithic (no modules whatsoever) kernel.

Any ideas?

BTW, the LVM stuff is great! :)

Regards,
  Fredrik Lindgren
