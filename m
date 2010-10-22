Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9MIl7OK006642
	for <linux-lvm@redhat.com>; Fri, 22 Oct 2010 14:47:07 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9MIkvBe025593
	for <linux-lvm@redhat.com>; Fri, 22 Oct 2010 14:46:57 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o9MIkupH019815
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 22 Oct 2010 14:46:56 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o9MIkuQp011196
	for <linux-lvm@redhat.com>; Fri, 22 Oct 2010 14:46:56 -0400
Date: Fri, 22 Oct 2010 14:46:56 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTinB4J+NkZHt1buQsFeZU7ErrvkR+wKMMssJrHQx@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1010221440560.11125@bmsred.bmsi.com>
References: <AANLkTinB4J+NkZHt1buQsFeZU7ErrvkR+wKMMssJrHQx@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Raid 10 and LVM stripe
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 21 Oct 2010, Fabricio Archanjo wrote:

> This box has 24x 1,5T SATA II disks, 3 controllers 3ware
> PCI-Express,6G ram memory DDR3 1333Mhz. This disks are distributed for
> each controller, 8 disks for each one.  I've done at each controller
> Raid 10 with 256k stripe size, then I've created one volume group with
> all disks and I've created one logical volume with 10G, 3 stripes and
> 256k of stripe size. I've gotten a great result with it, but i'd like
> to know what all think about it.

I didn't know that "raid 10" was shorthand for "raid 1+0".  While looking 
it up on Wikipedia, I learned about some cool features of the linux md
driver - it can stripe sequential blocks across drives, while still keeping 2 
copies on different drives, even with only 2 drives (what this poor man
usually has).  There is a "near" configuration, where copies of a block are
near each other, and a "far" configuration, where copies of a block are
on the second half (or third...) of each leg.

http://en.wikipedia.org/wiki/Non-standard_RAID_levels#Linux_MD_RAID_10

This gives many benefits of raid 10 with far fewer drives.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
