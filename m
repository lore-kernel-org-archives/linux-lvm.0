Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1G9a2O30510
	for <linux-lvm@redhat.com>; Wed, 16 Feb 2005 04:36:02 -0500
Received: from pcsspz.PATNI.COM (pcsbom.patni.com [203.124.139.208] (may be
	forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1G9a0Fi009767
	for <linux-lvm@redhat.com>; Wed, 16 Feb 2005 04:36:01 -0500
From: "Sandhya Suman" <sandhya.suman@patni.com>
Date: Wed, 16 Feb 2005 15:06:50 +0530
Message-ID: <00e301c5140b$0b5da750$5f051aac@pcp41107>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----------=_1108546601-20044-42"
Subject: [linux-lvm] FW: Detecting Multiple Paths to LU
Reply-To: sandhya.suman@patni.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: "Linux-Lvm (E-mail)" <linux-lvm@redhat.com>

This is a multi-part message in MIME format...

------------=_1108546601-20044-42
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi,

I want to achieve simple volume management on Linux 2.6 kernel using LVM2
and device mapper.
I want to perform following set of operation to do an I/O as i was doing in
case of LVM1 and lvm-mod.
1.pvcreate
2.vgcreate
3.lvcreate
4.mkfs on LV
5.mount the LV
6.perform i/o on LV

I can see multiple paths to single LU using disk conroller hardware.
When i create a PV using LVM2 on a LU with single path it works fine.In this
scenario i am able to perform above set of operations.
But when i create a PV using LVM2 on one of the paths to a multipath LU fi
have following observation
1.UUID is same for all the paths to the LU.Confirmed in pvscan.
2.vgcreate displays message saying "vg created successfully" but vgscan does
not display the newly created vg.
3.Backup file /etc/lvm/backup shows the above vg.
4.cannot create and use the lv .

Now my query is that Can i achieve a simple volume management using above
set of operations on LVM2-Device Mapper?Can lvm2 handle the above scenarion
itself or Does it need some extra tool for device consolidation?
I had found that following utilities can be used to achieve various features
of Device mapper viz. Multipayhing(Load spreading on multiple path),fail
over,hot plug detection,  device consolidation,mrroring and stripping.
1.. multipath-tools-0.2.1
2. sblim-cmpi-sysfs-1.1.5
3. hotplug-0.44 and hotplugctl-0.08
4. udev-021
5. Kpartx
6. multipathd (daemon)

My focus is that i dont want to use any other tool apart from lvm2 and
Device mapper.Is it possible or i have to use some device consolidation tool
other than lvm2?
LVM version i am using is lvm2-2.00.15
Device Mapper version i am using is device-mapper-1.00.09


Regards
Sandhya Suman




http://www.patni.com
World-Wide Partnerships. World-Class Solutions.
_____________________________________________________________________

This e-mail message may contain proprietary, confidential or legally
privileged information for the sole use of the person or entity to
whom this message was originally addressed. Any review, e-transmission
dissemination or other use of or taking of any action in reliance upon
this information by persons or entities other than the intended
recipient is prohibited. If you have received this e-mail in error
kindly delete  this e-mail from your records. If it appears that this
mail has been forwarded to you without proper authority, please notify
us immediately at netadmin@patni.com and delete this mail. 
_____________________________________________________________________

------------=_1108546601-20044-42--
