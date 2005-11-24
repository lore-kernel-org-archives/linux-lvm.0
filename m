Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAOMgGV15117
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2005 17:42:16 -0500
Received: from viefep16-int.chello.at (viefep16-int.chello.at [213.46.255.17])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAOMgFeX031786
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2005 17:42:15 -0500
Received: from AthLux.PrivateLAN.at ([84.114.151.31]) by viefep16-int.chello.at
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20051124224200.KYJM4450.viefep16-int.chello.at@AthLux.PrivateLAN.at>
	for <linux-lvm@redhat.com>; Thu, 24 Nov 2005 23:42:00 +0100
From: Matthias Meyer <Matthias.Meyer@gmx.li>
Date: Thu, 24 Nov 2005 23:42:02 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511242342.03081.Matthias.Meyer@gmx.li>
Subject: [linux-lvm] Volume group not accessible
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

Hello group,

I've lost the access to one of my Voloume groups which consists of 
disk /dev/hdd1 (contains data) and device /dev/hdc1 (which contains no 
data)
vdr:~# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "LVM"
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
volume group "LVM2" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
groups

I think I've made the following mistake:
vdr:~# vgchange -an LVM2
vgchange -- volume group "LVM2" successfully deactivated

vdr:~# pvcreate -vff /dev/hdc1
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/hdc1"
pvcreate -- getting physical volume size
pvcreate -- checking maximum physical volume size
pvcreate -- checking partition type
pvcreate -- checking volume group name
pvcreate -- really INITIALIZE physical volume "/dev/hdc1" of volume group 
"LVM2" [y/n]? y
pvcreate -- WARNING: forcing physical volume creation on "/dev/hdc1" of 
volume group "LVM2"
pvcreate -- removing lvmtab entry
pvcreate -- creating new physical volume
pvcreate -- setting up physical volume for /dev/hdc1 with 195318207 sectors
pvcreate -- writing physical volume data to disk "/dev/hdc1"
pvcreate -- physical volume "/dev/hdc1" successfully created
pvcreate -- unlocking logical volume manager

But it exists:
vdr:~# dir /dev/LVM2/Media
/dev/LVM2/Media


And now I'm not sure how to gain access again.

Should I try to restore metadata with vgcfgrestore?
Is it possible that I lost my data if I try vgcfgrestore?

Or should I create a new Volume group and include the device /dev/hdd1 to 
this VG? If I do this, what the way to delete volume group LVM2?

Thanks in advance
Matthias
-- 
Don't Panic
