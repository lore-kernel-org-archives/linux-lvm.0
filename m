Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2CAKL804869
	for <linux-lvm@redhat.com>; Fri, 12 Mar 2004 05:20:21 -0500
Received: from outmx018.isp.belgacom.be (outmx018.isp.belgacom.be [195.238.2.117])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2CAKK07024673
	for <linux-lvm@redhat.com>; Fri, 12 Mar 2004 05:20:20 -0500
Received: from howest.be (12.228-136-217.adsl-fix.skynet.be [217.136.228.12])
        by outmx018.isp.belgacom.be (8.12.9/8.12.9/Skynet-OUT-2.21) with ESMTP id i2CAKHqO013922
        for <linux-lvm@redhat.com>; Fri, 12 Mar 2004 11:20:17 +0100
        (envelope-from <thomas.berton@howest.be>)
Message-ID: <40520E04.5090505@howest.be>
From: Thomas Berton <thomas.berton@howest.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Hard disk failure, restore problem
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Mar 12 05:18:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,
I've recently encountered some problems with my LVM.

I had (and still have) a bad hd /dev/hda (used part. /dev/hda1)

I started:
    pvmove /dev/hda1 /dev/hdf1
yet the hd gave an error and I had to reboot.

I have a metadata backup made before I've started the move.

The volume group name is bigspace, yet the 'dir' /dev/bigspace/bigspace1 
is also gone...

now I got
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg1" is in no VG  [74.53 GB]
pvscan -- inactive PV "/dev/hde1" is in no VG  [149.05 GB]
pvscan -- inactive PV "/dev/hdf1" is in no VG  [149.05 GB]
pvscan -- inactive PV "/dev/hdc1" is in no VG  [111.79 GB]
pvscan -- inactive PV "/dev/hdd1" is in no VG  [74.53 GB]
pvscan -- inactive PV "/dev/hda1" is in no VG  [74.53 GB]
pvscan -- inactive PV "/dev/hdb1" is in no VG  [74.53 GB]
pvscan -- total: 7 [708 GB] / in use: 0 [0] / in no VG: 7 [708 GB]

yet if I do the restore I get

I also did a pvcreate -ff /dev/hdx1 for every disk... I've read 
somewhere that should fix it. yet id did not.

pvscan -- inactive PV "/dev/hda1"  is associated to unknown VG 
"bigspace" (run vgscan)

vgscan gives
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
volume group "bigspace" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

there is a LOT of data on this array of disk (as you can imagine)

sometimes, hda is working good, so i hope it want to work long enough to 
restore the data.

My guess now is to make a new vg and add those disks... but I want to be 
sure, so I don't lose the data.

Any suggestions to recover the data or to replace the broken harddisk 
with a new one with as little data loss as possible.

Regards,
Thomas.
