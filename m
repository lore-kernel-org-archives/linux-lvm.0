Received: from [127.0.0.1] (sebastian-int.corp.redhat.com [172.16.52.221])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9DGIilZ029691
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 17:18:45 +0100
Message-ID: <452FBCAA.4080000@redhat.com>
Date: Fri, 13 Oct 2006 17:19:54 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Unable to add new drive to LV
References: <200610130827.42040.pwaldo@waldoware.com>
	<452FB129.7020208@gmx.net>
In-Reply-To: <452FB129.7020208@gmx.net>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Klaus Strebel wrote:
> Hi Paul,
> 
> look's like you didn't get the LVM architecture :-(.
> You can't add a drive to a LV, no matter how brand new and shiny it is
> and no matter how deprerate you try.

Hi Klaus,

Looks like you didn't read the mail :-(.

Paul has already added hdd1 as a PV to the ide_disks VG:

> 
>>>   --- Physical volume ---
>>>   PV Name               /dev/hdd1
>>>   VG Name               ide_disks <------------------
>>>   PV Size               149.03 GB / not usable 0
>>>   Allocatable           yes
>>>   PE Size (KByte)       4096
>>>   Total PE              38152
>>>   Free PE               38152
>>>   Allocated PE          0
>>>   PV UUID               XxOREs-3k4B-jhky-lhGD-zQx5-xhE3-HPqG0L

The problem here is that the LV is using striped allocation across 3 PVs:

> root@backup:~# lvextend --size +149G -t /dev/ide_disks/bacula
>   Test mode: Metadata will NOT be updated.
>   Incorrect metadata area header checksum
>   Using stripesize of last segment 4KB
>   Rounding size (147200 extents) down to stripe boundary size for segment 
> (147198 extents)
>   Extending logical volume bacula to 574.99 GB
>   Insufficient allocatable extents suitable for parallel use for logical 
> volume bacula: 147198 required

So, in order to extend it and maintain that allocation, you need to have
3 PVs with sufficient space to allocate three parallel stripes.

Cheers,

Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFFL7yq6YSQoMYUY94RAlJ/AKDZaaaz+P6zQozq0mDfx5SRBxiUsQCgsVVb
MCl5XVqXGsEH+ZrYFHEAdps=
=mQWJ
-----END PGP SIGNATURE-----
