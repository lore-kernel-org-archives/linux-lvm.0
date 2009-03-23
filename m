Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2N4K7i8017269
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 00:20:07 -0400
Received: from imo-m25.mail.aol.com (imo-m25.mx.aol.com [64.12.137.6])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2N4Jhn4004305
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 00:19:47 -0400
Received: from thomas62186218@aol.com
	by imo-m25.mx.aol.com  (mail_out_v39.1.) id e.c9e.4a0a1dae (37132)
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 00:19:50 -0400 (EDT)
Content-Transfer-Encoding: 7bit
Date: Mon, 23 Mar 2009 00:19:33 -0400
MIME-Version: 1.0
From: thomas62186218@aol.com
Message-Id: <8CB7985B43694C5-1568-4CEE@webmail-me04.sysops.aol.com>
Subject: [linux-lvm] LVM2 and its Snapshot cause Windows bluescreen when
 connected simultaneously using iSCSI 
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello,

I am using LVM2 Snapshot on an Ubuntu Hardy 8.0.4 64-bit distro along 
with IET 0.4.17. My Ubuntu system has a quad-core 3 GHz CPU, 8GB RAM, 
and 10 x 300GB SAS drives connected via an LSI SAS adapter. The 10 x 
300GB SAS drives are configured in a md RAID 0, which in turn becomes a 
PV.

I create a 2.1 TB volume in LVM2 from this PV and set up IET to assign 
it to a Windows Server 2003 R2 64-bit system that is running the 
Microsoft iSCSI Initiator. This works perfectly. The Windows system can 
connect to the iSCSI target without issues. I format the iSCSI target, 
create a drive letter, and copy some data to it. All is well.

Then, on the Ubuntu system, using LVM2, I create a snapshot of the 2.1 
TB LVM2 volume, and configure IET to also assign this Snapshot as well 
to the same Windows Server 2003 R2 64-bit system. The Microsoft iSCSI 
Initiator discovers this Snapshot as an iSCSI target without issues. 
The moment I connect to it, however, Windows crashes and blue screens.

I am trying to determine why this happens. I noticed that if I log in 
to the original LVM2 volume using iSCSI by itself, and logout, and then 
login to the Snapshot using iSCSI by itself, there is no problem. I 
also notice that the LVM2 volume and its Snapshot appear identically to 
Windows (maybe not surprising)....same drive letter and volume name, 
etc.

Is the blue screen occurring because two devices, both with the same 
name and same drive letter, appeared on Windows at the same time, and 
Windows crashes as a result?

How else can I have an LVM2 volume and its Snapshot both present as 
iSCSI targets on the same iSCSI initiator at the same time?

Thank you for your help in advance!

best regards,
Thomas
