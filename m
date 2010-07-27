Received: from t60.int.errorists.org (vpn-8-179.rdu.redhat.com [10.11.8.179])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id o6R91bQj009296
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2010 05:01:39 -0400
Message-ID: <4C4EA070.3000501@redhat.com>
Date: Tue, 27 Jul 2010 10:01:36 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <AANLkTimSLv00evi01uV90PTBsSO0z=+CT7CagsZxWe2M@mail.gmail.com>
In-Reply-To: <AANLkTimSLv00evi01uV90PTBsSO0z=+CT7CagsZxWe2M@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvmdiskscan and mouting a LVM2 loopback file
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/26/2010 08:40 PM, Benjamin Henrion wrote:
> ===============================================
> # lvmdiskscan
>   /dev/loop0 [      39.06 GiB] LVM physical volume
>   /dev/root  [     222.79 GiB]
>   /dev/sda5  [       9.45 GiB]
>   1 disk
>   1 partition
>   0 LVM physical volume whole disks
>   1 LVM physical volume
> ===============================================
> 
> But I don't know how to detect the logical volumes inside /dev/loop0.
> 
> lvdisplay and vgdisplay says:
> 
> =================================================
> # lvdisplay
>   No volume groups found
> # vgdisplay
>   No volume groups found
> =================================================
> 
> Any idea how to get the volume and group back?

Can you post the output of the comand "pvs -a"?

It should look something like this:

sudo pvs -a
  PV         VG      Fmt  Attr PSize  PFree
  /dev/dm-1               --       0      0
  /dev/dm-2               --       0      0
  /dev/dm-3               --       0      0
  /dev/loop0         lvm2 --   32.00M 32.00M
  /dev/loop1 tvg0    lvm2 a-   28.00M 28.00M
  /dev/ram0               --       0      0
  /dev/ram1               --       0      0
  /dev/ram10              --       0      0
  /dev/ram11              --       0      0
  /dev/ram12              --       0      0
  /dev/ram13              --       0      0
  /dev/ram14              --       0      0
  /dev/ram15              --       0      0
  /dev/ram2               --       0      0
  /dev/ram3               --       0      0
  /dev/ram4               --       0      0
  /dev/ram5               --       0      0
  /dev/ram6               --       0      0
  /dev/ram7               --       0      0
  /dev/ram8               --       0      0
  /dev/ram9               --       0      0
  /dev/root               --       0      0
  /dev/sda1               --       0      0
  /dev/sda2  t60_vg0 lvm2 a-   93.03G     0

In that output loop0 is an orphan PV (i.e. it has not been assigned to
any VG yet) and loop1 contains a VG named "tvg0" (sda2 is my system VG).

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org/

iEYEARECAAYFAkxOoHAACgkQ6YSQoMYUY959RACgn1US38H1qfRMlrSRBn7uPya5
iasAoM2Iw/1PJUVsJRJt3LoFcQ4Blt8O
=JpOa
-----END PGP SIGNATURE-----
