Received: from mx2.redhat.com (ext-mx01.rdu.redhat.com [10.11.45.6])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p5H4BFNV016650
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2011 00:11:16 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.8/8.13.8) with ESMTP id p5H4BE0v003831
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2011 00:11:15 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p5H4B56h006015
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2011 00:11:07 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p5H4B41Z020161
	for <linux-lvm@redhat.com>; Fri, 17 Jun 2011 00:11:04 -0400
Date: Fri, 17 Jun 2011 00:11:04 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <1308260745.12257.1464013973@webmail.messagingengine.com>
Message-ID: <alpine.LRH.2.00.1106170004310.20086@bmsred.bmsi.com>
References: <1308260745.12257.1464013973@webmail.messagingengine.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Help to mount ext3 boot partiton which reports it's
 LVM2_member when I try to mount it
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 16 Jun 2011, Lee Gold wrote:

> How can this be right? I clearly remember installing the /boot as an
> ext3 partiton.
>
> sudo pvs says:
>
> PV        VG       Fmt   Attr   PSize    PFree
>
> /dev/sda1          lvm2  a-     190.00m  190.00m
>
> /dev/sda2 system   lvm2  a-      92.97g       0
>
> I can mount the partitons in /dev/sda2 by installing LVM2 while using
> the live disk and some command-line - so I can recover the data if
> necessay so all is not lost. But I would really like to know what is
> going on and how to get the system booting again. Again the boot
> partition was ext3 and separate, why can't I access it, fdisk
> confirms...?  Thanks.

I would suspect that sda and sdb do not point to the disks you think
they do.  BIOS often swaps these around without warning.  You don't mention
your physical connection (IDE/SATA/USB/FW/iSCSI/...).  This would give a clue
as to what BIOS might have done - although it really isn't an LVM question.
This is why it is preferred to use filesystem/PV UUIDs or labels 
rather that whatever the current device address happens to be.

So it looks like you made /boot into a PV, although pvcreate should have
warned that the block device was mounted.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
