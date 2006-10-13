Message-ID: <452FBFCE.9030204@redhat.com>
Date: Fri, 13 Oct 2006 17:33:18 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Broken hard disk
References: <200610122350.46609.martin.wilmes@java-cup.de>
	<452EC755.1070603@redhat.com>
	<200610130553.24145.martin.wilmes@java-cup.de>
In-Reply-To: <200610130553.24145.martin.wilmes@java-cup.de>
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
To: Martin Wilmes <martin.wilmes@java-cup.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Martin Wilmes wrote:
> On Friday, 13. October 2006 00:53, Bryn M. Reeves wrote:
>> You can add move 'v's to increase the verbosity of vgscan to see what
>> it's scanning - do you have any device filters configured in /etc/lvm.conf?
> 
> No filters, everything is commented out (unchanged).
> 
> vgscan -vvv now generates ouput for hda:
> 
> ...
>       /dev/hda1: size is 208782 sectors
>         Closed /dev/hda1
>       /dev/hda1: size is 208782 sectors
>         Opened /dev/hda1 RO O_DIRECT
>         /dev/hda1: block size is 1024 bytes
>         Closed /dev/hda1
>         Using /dev/hda1
>         Opened /dev/hda1 RO O_DIRECT
>         /dev/hda1: block size is 1024 bytes
>       /dev/hda1: No label detected
>         Closed /dev/hda1
>         /dev/loop1: Skipping (sysfs)
>         /dev/cloop1: Skipping: Unrecognised LVM device type 240
> ...

What about hda2? According to your fdisk output, that's the PV on this disk.

Does hda2 appear in /proc/partitions?

>> It'd also be good to see what pvscan shows, for e.g.:
> 
> pvscan -vvv outputs:
> 

Likewise - all I can see here is hda1 - that's a type 0x83 (Linux)
partition, rather than the 0x8e (Linux LVM) partition that we're
interested in here.

Can you put the complete output of vgscan -vvv and pvscan -vvv somewhere
on the web and post the links here?

You can use a pastedump service like http://p.opsat.net/new if you don't
have access to somewhere to host this.

Cheers,

Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFFL7/O6YSQoMYUY94RAmxzAJkBGN5IDouPjSKCk44l8MCuN0XNjQCg2SB5
J7s5pP0VJTRzpLtgRJ5Ylxs=
=MwUj
-----END PGP SIGNATURE-----
