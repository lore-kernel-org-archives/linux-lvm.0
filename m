Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i333Dcj09275
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 22:13:38 -0500
Received: from rwcrmhc13.comcast.net (rwcrmhc13.comcast.net [204.127.198.39])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i333Dbjj010386
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 22:13:37 -0500
From: atark <atark@eastdeering.com>
Message-Id: <1080962045.26849.6.camel@jango.tatooine>
Mime-Version: 1.0
Date: Fri, 02 Apr 2004 22:14:05 -0500
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgscan failure after changing SCSI controller
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello,

I moved SCSI controllers around im my server and have lost contact with
my VG.  The VG is on an extrenal array with 6 disks, 4 or which are used
for the VG. Also I've changed back to the original controller
cofiguration. How can I verify if the VG is truly hosed? Tried
vgcfgrestore to no avail.....

Any help is appreciated!

--Andy


vgscan is failing with:

vader root # vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- reading data of volume group "spacevg" from physical volume(s)
vgscan -- ERROR "lv_read_all_lv(): number of LV" can't get data of
volume group "spacevg" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

Here is pvscan:

vader root # pvscan -v
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- walking through all physical volumes found
pvscan -- inactive PV "/dev/scsi/host2/bus0/target1/lun0/disc"  is
associated to unknown VG "spacevg" (run vgscan)
pvscan -- inactive PV "/dev/scsi/host2/bus0/target2/lun0/disc"  is
associated to unknown VG "spacevg" (run vgscan)
pvscan -- inactive PV "/dev/scsi/host2/bus0/target3/lun0/disc"  is
associated to unknown VG "spacevg" (run vgscan)
pvscan -- inactive PV "/dev/scsi/host2/bus0/target4/lun0/disc"  is
associated to unknown VG "spacevg" (run vgscan)
pvscan -- total: 4 [50.79 GB] / in use: 4 [50.79 GB] / in no VG: 0 [0]
