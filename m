Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4AEgjv21680
	for <linux-lvm@redhat.com>; Mon, 10 May 2004 10:42:45 -0400
Received: from swlx166.swmed.edu (swlx166.swmed.edu [199.165.152.166])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4AEgi0m018494
	for <linux-lvm@redhat.com>; Mon, 10 May 2004 10:42:44 -0400
Received: from [129.112.118.137] (helo=utsouthwestern.edu)
	by swlx166.swmed.edu with esmtp (Exim 4.30) id 1BNBzK-0004sV-Td
	for linux-lvm@redhat.com; Mon, 10 May 2004 09:42:38 -0500
Message-ID: <409F94D8.40801@utsouthwestern.edu>
Date: Mon, 10 May 2004 09:42:32 -0500
From: Peter Smith <peter.smith@utsouthwestern.edu>
MIME-Version: 1.0
References: <407C693E.2020700@utsouthwestern.edu>
In-Reply-To: <407C693E.2020700@utsouthwestern.edu>
Subject: Re: [linux-lvm] >2TB with LVM v1.0.3?
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig25EC7C5C18F4EF26C1F5764E"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig25EC7C5C18F4EF26C1F5764E
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

To follow up, we got our new 6000GB online and I was able to allocate 
all the space to a single VG, but obviously you can only allocate VG 
space into slices (LVs), each a block device, and each limited to the 
2TB limit.

Peter Smith



Peter Smith wrote:

> I'm running Redhat v7.2 (very old I know) and LVM v1.0.3 .  I have a 
> 1600GB ext3 partition currently in use and am planning to grow that by 
> ~ 6000GB.  From the documentation that I have found, it looks like I 
> may be able to do this without modification to my system.  However, 
> I'm querying to verify it..
>
> Current ext3 filesystem has 4KB block size (supposedly good to 16TB 
> total.)
>
> I have one LV defined with a size of "3456106496".  I have two PVs, 
> the first (sdc) with a size of "1646481408" and a PE size of 
> "1048576", the second (sdd) with a size of "1815863296" and a PE size 
> of "1048576" as well.
>
> Allocation of the ext3 is at "1152717492" 1k-blocks used and 
> "548221548" 1k-blocks available right now.  The RAID system that the 
> storage resides on has, up until now, sort-of enforced a roughly <2TB 
> limit per device (2 cabinets currently with 1600GB and the RAID can 
> not span cabinets,) I can continue to allocate ~ 2TB per device to fit 
> within the kernel 2.4 32-bit block device limit.  I do not know if I 
> am actually limited to 1TB per device as I've read before from Redhat, 
> so that may be a possibility.
>
> Here is my current vgdisplay
> [root@swlx201 root]# vgdisplay
> --- Volume group ---
> VG Name               data
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                1
> Open LV               1
> MAX LV Size           2 TB
> Max PV                256
> Cur PV                2
> Act PV                2
> VG Size               1.61 TB
> PE Size               1 GB
> Total PE              1648
> Alloc PE / Size       1648 / 1.61 TB
> Free  PE / Size       0 / 0
>
>
> Any comments, questions, etc VERY welcome.
>
> Peter Smith
>
>------------------------------------------------------------------------
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--------------enig25EC7C5C18F4EF26C1F5764E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQFAn5Tc/TMBbARZqsERAmtJAJ0T0beZTkNbzicKddToXpAjAebxHACfUbSO
3K+Nonc2OTHj9KUpMcCFVF4=
=UXbS
-----END PGP SIGNATURE-----

--------------enig25EC7C5C18F4EF26C1F5764E--
