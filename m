Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5UEwL004279
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 10:58:21 -0400
Received: from posta.cerved.com (posta.cerved.com [193.227.69.100])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5UEwDXn031806
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 10:58:14 -0400
Received: from VIGGIANI (cl_66_207.cerved.com [193.227.66.207])
	by posta.cerved.com (8.12.10/8.11.6) with SMTP id i5UEw829024238
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 16:58:08 +0200
Message-ID: <000501c45eb2$a4e75470$cf42e3c1@pitagora.it>
From: "Mimmus" <dviggiani@tiscali.it>
Date: Wed, 30 Jun 2004 16:57:58 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Resize VG
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

Hi,
this is my setup:
- server HP Proliant DL740 with Red Hat AS 3 (kernel 2.4.21-9ELsmp) with all
updates installed
- two Host Bus Adapter FC2214 with qla2x00 driver from HP (v.6.06.50)
- a SAN with an HP EVA3000 disk-array
- LVM

Does LVM support extending LUN size?
I extended size of an existing LUN from my disk-array manager but vgdisplay
shows me always the original size (with no free physical extents). No change
if I reboot, I need to destroy and re-create volume group.

Have I some other chance?

Thanks
Domenico Viggiani
