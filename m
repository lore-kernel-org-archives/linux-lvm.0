Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9VLAvV17069
	for <linux-lvm@redhat.com>; Mon, 31 Oct 2005 16:10:57 -0500
Received: from web32814.mail.mud.yahoo.com (web32814.mail.mud.yahoo.com
	[68.142.206.44])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id j9VLAeaA009892
	for <linux-lvm@redhat.com>; Mon, 31 Oct 2005 16:10:45 -0500
Message-ID: <20051031211035.92110.qmail@web32814.mail.mud.yahoo.com>
Date: Mon, 31 Oct 2005 13:10:35 -0800 (PST)
From: LeRrA <lerra@rocketmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Problem with moving lvm to a new box
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Good evening, I got a realy big problem.
I tryed to move my lvm to a new box, I followd 
http://www.tldp.org/HOWTO/LVM-HOWTO/recipemovevgtonewsys.html

but when I add my 2 disks to the new system I don't get anything buy pvscan
gatekeeper:/etc/rc2.d# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- no valid physical volumes found

gatekeeper:/etc/rc2.d#

And lvmdiskscan gives
gatekeeper:/etc/rc2.d# lvmdiskscan
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/hda   [     108.28 MB] free whole disk
lvmdiskscan -- no valid disks / partitions found
lvmdiskscan -- please check your disk device special files!

vgscan gives
gatekeeper:/etc/rc2.d# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group


The hds is shown buy the system and I see with cfdisk that the partition is still lvm.
    hdd3                    Primary   Linux LVM                       151007.92
    hdb3                    Primary   Linux LVM                       151007.92

I tested the disks at the oldsystem and they still work there but not on the new system.
Both systems is debian sarge (stable)

Thes are the output buy lsmod
Module                  Size  Used by    Not tainted
ipt_MASQUERADE          1496   1  (autoclean)
ipt_mac                  696   4  (autoclean)
ipt_REJECT              3832   4  (autoclean)
ipt_LOG                 3480  11  (autoclean)
ipt_state                568  14  (autoclean)
ipt_pkttype              504   4  (autoclean)
ipt_recent              7908   0  (autoclean)
ipt_multiport            696   0  (autoclean)
ipt_conntrack           1112   3  (autoclean)
iptable_mangle          2200   0  (autoclean) (unused)
ip_nat_irc              2320   0  (unused)
ip_nat_tftp             1744   0  (unused)
ip_nat_ftp              2928   0  (unused)
iptable_nat            17486   4  [ipt_MASQUERADE ip_nat_irc ip_nat_tftp ip_nat_ftp]
ip_conntrack_irc        2896   1
ip_conntrack_tftp       1680   1
ip_conntrack_ftp        3920   1
ip_conntrack           19528   3  [ipt_MASQUERADE ipt_state ipt_conntrack ip_nat_irc ip_nat_tftp
ip_nat_ftp iptable_nat ip_con
ntrack_irc ip_conntrack_tftp ip_conntrack_ftp]
iptable_filter          1772   1
ip_tables              12192  14  [ipt_MASQUERADE ipt_mac ipt_REJECT ipt_LOG ipt_state ipt_pkttype
ipt_recent ipt_multiport ip
t_conntrack iptable_mangle iptable_nat iptable_filter]
af_packet              13000   2  (autoclean)
hw_random               2808   0  (unused)
i810_rng                2656   0  (unused)
tuner                  10344   1
bttv                   95840   0  (unused)
i2c-algo-bit            7588   0  [bttv]
i2c-core               15844   0  [tuner bttv i2c-algo-bit]
videodev                6464   2  [bttv]
ehci-hcd               18412   0  (unused)
usb-uhci               23344   0  (unused)
usbcore                62924   1  [ehci-hcd usb-uhci]
i810_audio             24444   0  (unused)
ac97_codec             13300   0  [i810_audio]
soundcore               3940   2  [bttv i810_audio]
ide-scsi               10032   0
scsi_mod               95108   1  [ide-scsi]
r8169                  10124   1
crc32                   2912   0  [r8169]
sk98lin               153480   1
loop                   48848   0  (autoclean)
dm-mod                 46808   0  (unused)
lvm-mod                60960   0
ide-cd                 31296   0
cdrom                  29828   0  [ide-cd]
rtc                     6440   0  (autoclean)
ext3                   81068   1  (autoclean)
jbd                    42468   1  (autoclean) [ext3]
ide-detect               288   0  (autoclean) (unused)
piix                    9096   2  (autoclean)
ide-disk               16800   2  (autoclean)
ide-core              108568   2  (autoclean) [ide-scsi ide-cd ide-detect piix ide-disk]
unix                   14960  15  (autoclean)



		
__________________________________ 
Yahoo! FareChase: Search multiple travel sites in one click.
http://farechase.yahoo.com
