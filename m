Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m85E54Wj029588
	for <linux-lvm@redhat.com>; Fri, 5 Sep 2008 10:05:05 -0400
Received: from thunderbird6.fab.redhat.com (vpn-6-10.fab.redhat.com
	[10.33.6.10])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m85E54qY002887
	for <linux-lvm@redhat.com>; Fri, 5 Sep 2008 10:05:04 -0400
Message-ID: <48C13BCB.9090109@redhat.com>
Date: Fri, 05 Sep 2008 15:01:47 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] swap tagged as lvm2
References: <ab53550809050655scab46a9lbea2abbe6c400681@mail.gmail.com>
In-Reply-To: <ab53550809050655scab46a9lbea2abbe6c400681@mail.gmail.com>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bernard Fay wrote:
> Hi,
>  
> We have installed RHEL 4.7 on a single disk (actually two disk in hardware 
> RAID).  Part of it use regular partions and others LVM2 logical volumes.  To my 
> surprise, when running pvs or pvscan, the swap partition is shown has LVM2:
>  
> # pvscan
>   PV /dev/sda5   VG vgsys            lvm2 [53,19 GB / 32,19 GB free]
>   PV /dev/sda3                       lvm2 [65,21 GB]
>   Total: 2 [118,39 GB] / in use : 1 [53,19 GB] / in no VG: 1 [65,21 GB]
>  
> But if I type fdisk -l /dev/sda, sda3 is a good old swap partition:
>  
> # fdisk -l /dev/sda
>  
> Disque /dev/sda: 72.7Go, 72746008576 octets
> 255 t�tes, 63 secteurs/piste, 8844 cylindres
> Unit�s = cylindres de 16065 * 512 = 8225280 octets
>  
> P�riph�rique Boot    Start     End      Blocks   Id    System
> /dev/sda1   *         1      13      104391   83  Linux
> /dev/sda2   *        14     332     2562367+  83  Linux
> /dev/sda3   *       333    1899    12586927+  82  Linux swap
> /dev/sda4   *      1900    8844    55785712+   5  Extended
> /dev/sda5   *      1900    8844    55785681+  8e  Linux LVM
>  
> I do not think this is a big problem but I am curious of why and could it be a 
> problem?

Looks like the partition was previously used as an LVM PV. Just wipe out
the first 1M or so and run mkswap again.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iEYEARECAAYFAkjBO8sACgkQ6YSQoMYUY9470QCg4Akby6y0KkN6D4lulftnCZJA
QE4AnjV9i1GHDvXVRVfzeGW4BlMlsHDe
=OEkz
-----END PGP SIGNATURE-----
