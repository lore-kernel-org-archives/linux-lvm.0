Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5UF9h007729
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 11:09:43 -0400
Received: from zdemail03.zdem.compaq.com (zdemail03.zdem.compaq.com
	[161.114.112.27])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5UF9ge1013517
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 11:09:42 -0400
Received: from demexg11.emea.cpqcorp.net (demexg11.emea.cpqcorp.net
	[16.41.86.138])
	by zdemail03.zdem.compaq.com (Postfix) with ESMTP id 5D94D12E3
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 17:09:36 +0200 (CEST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Resize VG
Date: Wed, 30 Jun 2004 17:09:35 +0200
Message-ID: <59CA32C0B391A84FAE3F37A8304DF75DEFAC64@bbnexc02.emea.cpqcorp.net>
From: "Zecha, Holger" <holger.zecha@hp.com>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

No chance, the size is fixed and written to the LUN by issuing the
pvcreate command.

Best regards

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Mimmus
Sent: Wednesday, June 30, 2004 16:58
To: linux-lvm@redhat.com
Subject: [linux-lvm] Resize VG


Hi,
this is my setup:
- server HP Proliant DL740 with Red Hat AS 3 (kernel 2.4.21-9ELsmp) with
all updates installed
- two Host Bus Adapter FC2214 with qla2x00 driver from HP (v.6.06.50)
- a SAN with an HP EVA3000 disk-array
- LVM

Does LVM support extending LUN size?
I extended size of an existing LUN from my disk-array manager but
vgdisplay shows me always the original size (with no free physical
extents). No change if I reboot, I need to destroy and re-create volume
group.

Have I some other chance?

Thanks
Domenico Viggiani


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
