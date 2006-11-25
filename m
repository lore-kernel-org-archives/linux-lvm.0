Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAP87Rl0012999
	for <linux-lvm@redhat.com>; Sat, 25 Nov 2006 03:07:27 -0500
Received: from imf25aec.mail.bellsouth.net (imf25aec.mail.bellsouth.net
	[205.152.59.73])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAP87QRr009152
	for <linux-lvm@redhat.com>; Sat, 25 Nov 2006 03:07:27 -0500
Received: from ibm63aec.bellsouth.net ([70.153.165.109])
	by imf21aec.mail.bellsouth.net with ESMTP id
	<20061125061312.WKMM25237.imf21aec.mail.bellsouth.net@ibm63aec.bellsouth.net>
	for <linux-lvm@redhat.com>; Sat, 25 Nov 2006 01:13:12 -0500
Received: from [192.168.1.2] (really [70.153.165.109])
	by ibm63aec.bellsouth.net with ESMTP
	id <20061125061312.VOIK3733.ibm63aec.bellsouth.net@[192.168.1.2]>
	for <linux-lvm@redhat.com>; Sat, 25 Nov 2006 01:13:12 -0500
Message-ID: <4567DF1E.6050405@Bellsouth.net>
Date: Sat, 25 Nov 2006 00:13:50 -0600
From: Otter <OtterzStuff@bellsouth.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem post snapshot / resize
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

Hello,

I have run into a problem with LVM2. I am using Fedora Core 4.

Here is what I did:
lvresize --size=30G -v /dev/VolGroup00/LogVol00
Finding volume group VolGroup00
WARNING: Reducing active and open logical volume to 30.00 GB
THIS MAY DESTROY YOUR DATA (filesystem etc.)
Do you really want to reduce LogVol00? [y/n]: y
Archiving volume group "VolGroup00" metadata.
Reducing logical volume LogVol00 to 30.00 GB
Creating volume group backup "/etc/lvm/backup/VolGroup00"
Found volume group "VolGroup00"
Found volume group "VolGroup00"
Loading VolGroup00-LogVol00
Logical volume LogVol00 successfully resized



The command was:
lvcreate --snapshot --size=500M --name=backup /dev/VolGroup00/LogVol00


The output it gave is:
Rounding up size to full physical extent 512.00 MB
Couldn't create temporary text file name.
Backup of volume group VolGroup00 metadata failed.
Logical volume "backup" created
/var/lock/lvm/V_VolGroup00: unlink failed: Read-only file system

If I try to use any LVM commands I get:
Locking type 1 initialisation failed.

I have no idea how to resolve this. The OS is now flagged Read-Only so I
can't remove the lock.

Please, any help would be appreciated.

James
