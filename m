Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3EDNSoE011494
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 09:23:28 -0400
Received: from eastrmmtao105.cox.net (eastrmmtao105.cox.net [68.230.240.47])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3EDNGhL003188
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 09:23:17 -0400
Received: from eastrmimpo03.cox.net ([68.1.16.126]) by eastrmmtao105.cox.net
	(InterMail vM.8.00.01.00 201-2244-105-20090324) with ESMTP id
	<20100414132317.YSZN16574.eastrmmtao105.cox.net@eastrmimpo03.cox.net>
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 09:23:17 -0400
Message-ID: <4BC5C1C3.7080708@cox.net>
Date: Wed, 14 Apr 2010 08:23:15 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <BAY110-W326FE139691A6ED05B4D3DBE100@phx.gbl>
In-Reply-To: <BAY110-W326FE139691A6ED05B4D3DBE100@phx.gbl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How do I tell what disk a volume group reside on
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
To: linux-lvm@redhat.com

On 2010-04-13 19:59, Vickie Troy-McKoy wrote:
> Hi All,
> 
> I have a RedHat4 server connected to a SAN 3510 Array.  On the
> host server, there are two volume groups set up--root_vg and
> san_vg.  I'm assuming that root_vg resides on the internal disks
> and san_vg on the SAN.  But, how can I check to make sure this is
> the case?
> 

This is what I get when I run pvscan.  pvs is similar.

# pvscan
   PV /dev/sda4   VG main_huge_vg   lvm2 [529.00 GiB / 0    free]
   PV /dev/sdb2   VG main_huge_vg   lvm2 [594.25 GiB / 0    free]
   PV /dev/sdc1   VG main_huge_vg   lvm2 [931.50 GiB / 0    free]
   PV /dev/sdd1   VG main_huge_vg   lvm2 [698.62 GiB / 0    free]
   PV /dev/sde1   VG main_huge_vg   lvm2 [931.50 GiB / 0    free]
   Total: 5 [3.60 TiB] / in use: 5 [3.60 TiB] / in no VG: 0 [0   ]

# pvs
   PV         VG           Fmt  Attr PSize   PFree
   /dev/sda4  main_huge_vg lvm2 a-   529.00g    0
   /dev/sdb2  main_huge_vg lvm2 a-   594.25g    0
   /dev/sdc1  main_huge_vg lvm2 a-   931.50g    0
   /dev/sdd1  main_huge_vg lvm2 a-   698.62g    0
   /dev/sde1  main_huge_vg lvm2 a-   931.50g    0


-- 
Dissent is patriotic, remember?
