Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j73K43V27475
	for <linux-lvm@redhat.com>; Wed, 3 Aug 2005 16:04:03 -0400
Received: from mailhub.lss.emc.com (mailhub.lss.emc.com [168.159.2.31])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j73K41Mc019894
	for <linux-lvm@redhat.com>; Wed, 3 Aug 2005 16:04:01 -0400
Received: from srexchimc2.eng.emc.com (srexchimg2.eng.emc.com [168.159.100.11]
	(may be forged))
	by mailhub.lss.emc.com (Switch-3.1.6/Switch-3.1.6) with ESMTP id
	j73K3xpi022387
	for <linux-lvm@redhat.com>; Wed, 3 Aug 2005 16:03:59 -0400 (EDT)
Message-ID: <82CC5B790FEB854BBD58EEBA156E5C68C0D0C3@SRMOON.eng.emc.com>
From: "krishnakumar, narasimha" <krishnakumar_narasimha@emc.com>
Date: Wed, 3 Aug 2005 16:03:58 -0400 
MIME-Version: 1.0
Subject: [linux-lvm] Problem with METADATA on LVM2 disks
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
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

Hi All,

I am trying to read the metadata on disk for an LVM2 disk on an IA64 system
running Redhat 2.6. I find that the first 512 bytes on disk where the
metadata is stored is showing all '0'. How does one access the metadata and
find out the layout of the pv_disk structure. Any help would be appreciated.

Thanks,
Narasimha Krishnakumar,
