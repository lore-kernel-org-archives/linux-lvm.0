Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBJH0YPY010615
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 12:00:34 -0500
Received: from mexforward.lss.emc.com (mexforward.lss.emc.com [128.222.32.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBJH01Mq004217
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 12:00:02 -0500
Received: from hop04-l1d11-si01.isus.emc.com (HOP04-L1D11-SI01.isus.emc.com
	[10.254.111.54])
	by mexforward.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	lBJGxuoF008694
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 11:59:56 -0500 (EST)
Received: from mailhub.lss.emc.com (uraeus.lss.emc.com [10.254.144.14]) by
	hop04-l1d11-si01.isus.emc.com (Tablus Interceptor) for
	<linux-lvm@redhat.com>; Wed, 19 Dec 2007 11:59:56 -0500
Received: from corpussmtp3.corp.emc.com (corpussmtp3.corp.emc.com
	[10.254.64.53])
	by mailhub.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	lBJGxPY7009857
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 11:59:53 -0500 (EST)
From: pham_cuong@emc.com
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM
Date: Wed, 19 Dec 2007 11:59:30 -0500
Message-ID: <7C6C00FDABF70949A0A5D4DD8A4DC2170474A35D@CORPUSMX20A.corp.emc.com>
In-Reply-To: <1198079061.47693c5531ded@imp.free.fr>
References: <1197988092.29413.77.camel@veri.phy.umist.ac.uk><7C6C00FDABF70949A0A5D4DD8A4DC2170474A353@CORPUSMX20A.corp.emc.com><1198010286.6637.10.camel@amd64.local><7C6C00FDABF70949A0A5D4DD8A4DC2170474A356@CORPUSMX20A.corp.emc.com><1198058368.3859.10.camel@amd64.local><1198059645.4768f07d37201@imp.free.fr><1198059909.3859.21.camel@amd64.local><7C6C00FDABF70949A0A5D4DD8A4DC2170474A35A@CORPUSMX20A.corp.emc.com>
	<1198079061.47693c5531ded@imp.free.fr>
Content-Transfer-Encoding: 8bit
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

I agree in general... But:

1.  In his configuration (in this case), the same hardware are used,
therefore the type of each hardware remains fixed, and since we're
talking about 2 drives connected to the same (I presume) built-in
Channel 1 EIDE Master/Slave, we don't have to deal with the drive
shifting issue and thus the order of appearance between different
hardware interface is irrelevant. 
2.  We're not talking about SCSI here.
3.  Hardware are recognized in particular order, based on whether they
are internal (built-in) or add-on (via buses such as SCSI, PCI, PCI-X,
PCIe, etc.), and whether the built-in feature(s) is enabled or not.
4.  The order of loading by the POST is typically internal first, then
external.  So the order of appearance of drives is dependent on which
driver is loaded first, which is also dependent upon the bus position.
The loading order is dependent upon whether that feature's state
(enabled or disabled). 
5.  Typically if internal IDE/EIDE is enabled, along with SCSI, and
SATA, IDE drive(s) is recognized first, then SCSI, then SATA (BIOS
implementation specific).  When this happens, one must take the
appropriate steps to modify each boot loader, one at a time,
sequentially, to rectify the shifted hardware position.  For this case,
the proper OS installation process is XP first, then Fedora.  Therefore,
the Fedora boot loader is the first one to be loaded, followed by the XP
boot loader. 
6.  Once an OS is loaded, its configuration is already implicitly based
on the order of appearance of the hardware as recognized during the POST
and is effective at time that OS is loaded.  These hardware-specific
info is recorded in the appropriate configuration files for each OS for
that OS' boot loader to use.  Many people do not fully understand this
point and can mess up running system badly by introducing new hardware
that have the potential of changing hardware order for a multi-OS, multi
boot systems.
7.  SCSI and FC are not susceptible to this problem (if handled
correctly).
8.  And yes, to perform the complete analysis, one would need to know
all the hardware connected to the motherboard, all the hardware
connected to the expansion cards (SCSI, FC, EIDE, SATA, PATA, etc.), the
state (enabled or disabled) of each one, along with the specific
settings for each controller.  This is way outside the scope of this
email forum.

Regards,
 

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Georges Giralt
Sent: Wednesday, December 19, 2007 10:44 AM
To: LVM general discussion and development
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM

Selon pham_cuong@emc.com:

>  Instead of discussing back and forth w/o real data to discuss/explore
with
> concrete evidences, could you:
>
> A. Post the content of both the grub.conf and boot.ini files
...........Heavilly snipped.................
Hi Pham !
I think this is not totally sufficient.
You have to check the BIOS to see how and in what order it sees the
disks.
Some Bioses have a strange behavior especially when you have a SCSI card
or USB
disks.
On my Mobo, if I plug a Sata drive, the first master IDE came in third
position,
right after the sata disk and the SCSI DVDrom which is still lugged on.
Do not
ask me why it sees this as a disk (and even if there is nothing into
it).
So I admire the Grub people as they've made a terrific job ;-)
-- 

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
