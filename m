Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAHLHBr12119
	for <linux-lvm@redhat.com>; Wed, 17 Nov 2004 16:17:11 -0500
Received: from hotmail.com (bay5-f3.bay5.hotmail.com [65.54.173.3])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAHLH9TB031589
	for <linux-lvm@redhat.com>; Wed, 17 Nov 2004 16:17:09 -0500
From: "David Sandberg" <glassbil@msn.com>
Date: Wed, 17 Nov 2004 22:16:50 +0100
Mime-Version: 1.0
Message-ID: <BAY5-F3Dcab7NMT665800013788@hotmail.com>
Subject: [linux-lvm] LVM wont work
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I ran into a problem after I had installed some fans in my computer.
I used the same cable to the same disc etc. But it didnt work after
I rebooted. I might have a diffrent PCI slot of my controller card, im
not sure. But I dont know if that make any diffrence.

root@christina:~# mount /dev/warez/vares /glftpd/site/
mount: /dev/warez/vares is not a valid block device

root@christina:~# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hde1"  is associated to unknown VG "warez" (run 
vgscan)
pvscan -- inactive PV "/dev/hdf1"  is associated to unknown VG "warez" (run 
vgscan)
pvscan -- inactive PV "/dev/hdc"   is associated to unknown VG "warez" (run 
vgscan)
pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "warez" (run 
vgscan)
pvscan -- inactive PV "/dev/hdd3"  is associated to unknown VG "warez" (run 
vgscan)
pvscan -- total: 5 [316.09 GB] / in use: 5 [316.09 GB] / in no VG: 0 [0]

root@christina:~# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
volume group "warez" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

Any idea how to solve this?

Best Regards
David

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
