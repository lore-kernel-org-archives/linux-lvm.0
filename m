Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u46KiqRm021789
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 6 May 2016 16:44:52 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA001C057FAC
	for <linux-lvm@redhat.com>; Fri,  6 May 2016 20:44:49 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 63C4B7FC09
	for <linux-lvm@redhat.com>; Fri,  6 May 2016 22:44:47 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 06 May 2016 22:44:47 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <6bba798bfecb7eacc96698e008757f46@dds.nl>
Subject: [linux-lvm] LVM but no real partitions
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux lvm <linux-lvm@redhat.com>

Did people ever consider whether it was worth being able to start a PV 
on a raw physical device with a small offset to reserve room for a boot 
sector?

If you could create a PV on a bootdisk with a 2048 sector offset, you 
would have a bootable device without partition tables and only LVM.

The same applies to LUKS. If you could put the LUKS header at 2048 
sectors, you could boot a disk with nothing but a luks container, since 
grub2 understands LUKS.

I guess such a thing would be extremely easy to achieve, it just 
wouldn't be portable.

Since you may need to recompile both LUKS and Grub, and possibly even 
dm-crypt.

The total number of changes would probably not be more than 10 lines. 
Not sure.

Anyway.

Anyone ever fancied a LVM system without real partitions?
