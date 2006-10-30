Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9UBDlvN029113
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2006 06:13:47 -0500
Received: from mail.linbit.com (aug.linbit.com [212.69.162.22])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9UBDiOK011547
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2006 06:13:44 -0500
Received: from soda (office.linbit [213.229.1.138])
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id C4A932D9E069
	for <linux-lvm@redhat.com>; Mon, 30 Oct 2006 12:13:38 +0100 (CET)
Date: Mon, 30 Oct 2006 12:13:39 +0100
From: Lars Ellenberg <linux-lvm@linbit.com>
Subject: Re: [linux-lvm] Lost partition table --> Lost 4th PV partition on
	disk - how to find the partition bounderies
Message-ID: <20061030111339.GF7809@soda.linbit>
References: <2813.62.99.165.114.1162122375.squirrel@webmail.cosy.sbg.ac.at>
	<3377.62.99.165.114.1162134421.squirrel@webmail.cosy.sbg.ac.at>
	<2813.62.99.165.114.1162122375.squirrel@webmail.cosy.sbg.ac.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3377.62.99.165.114.1162134421.squirrel@webmail.cosy.sbg.ac.at>
	<2813.62.99.165.114.1162122375.squirrel@webmail.cosy.sbg.ac.at>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

/ 2006-10-29 12:46:15 +0100
\ gklima@cosy.sbg.ac.at:
> the layout of the disk was/is as follows:
> 1) ntfs ~10G
> 2) ntfs ~10G
> 3) ext3 36mb linux-boot
> 4) PV of lvm2 which had 72046800 blocks as of /proc/partition the last
> time lvm2 worked
> 
> layout by fdisk after the win xp partitoning and ghost coping with a still
> working lvm2 PV on partition 4
> 
> 1) 1-1703
> 2) 1704-3186
> 3) 3187-3192
> 4) 3192-12161

which is cylinders.

> The VG is called "vg"
> and the approximately layout is as follows:
> 
> root lv 500M (bin, sbin, etc, lib, ......)
> swap lv 1500M encrypted
> and then var usr opt distfiles portage and so on.....

> 255 heads, 63 sectors/track, 12161 cylinders, total 195371568 sectors

> Possible partition(Linux ext2), size(36mb), offset(24998mb)
>    type: 131(0x83)(Linux ext2 filesystem)
>    size: 36mb #s(75600) s(51196320-51271919)
>    chs:  (1023/254/63)-(1023/254/63)d (3186/210/1)-(3191/134/63)r
>    hex:  00 FE FF FF 83 FE FF FF A0 31 0D 03 50 27 01 00

so, here we are: this is obviously your "linux-boot".
the next recognized sector appears to be from swap.
so we know: 
51271919 end sector of "linux-boot"

which is consistent with your remembered cylinders above:
> 4) 3192-12161

to find the exact sector offset of your pv,
have a knoppix (or some other live-cd) handy.
do
 perl -e '$s= 51271919; $o = 512*$s;
	sysseek(STDIN,$o,0) = $o or die "seek: $!\n";
	while(1) {
		sysread STDIN,$_,512;
		last if /^.{24}LVM2/;
		last if ++$s > 1000000;
	}
	print "start sector of pv appears to be",$s-1,"\n";
	'

use
	sfdisk -d /dev/hda > dummy
	vi dummy
	sfdisk -uS /dev/hda < dummy
to put some partition table back in place.

dummy would look similar to
-----
# partition table of /dev/hda
unit: sectors

/dev/hda1 : start=       63, size= 28675960, Id= 7, bootable
/dev/hda2 : start= 31268160, size= 19928152, Id= 7
/dev/hda3 : start= 51196320, size=    75600, Id=83
/dev/hda4 : start= 51277968, size=144093600, Id=8e
-----

I inserted the values that your "big scan" found out,
but decided slightly different what to discard because of overlap,
and added the information you gave about
> 4) PV of lvm2 which had 72046800 blocks as of /proc/partition the last
> time lvm2 worked
(total sectors 195371568 - 2*72046800 == 51277968), as it is consitent
with the offsets of the 36mb partition and the swap signature found by
the big scan as well as the additional context you provided.

hda1 and hda2 are likely slightly wrong,
as between those is some unused space.
hda3 is most likely correct, and hda4 would be your pv,
and my guess is that it is correct, too.
if the perl snipplet above confirms that
(start sector 51277968), go for it.

cheers.

-- 
: Lars Ellenberg                                  Tel +43-1-8178292-55 :
: LINBIT Information Technologies GmbH            Fax +43-1-8178292-82 :
: Schoenbrunner Str. 244, A-1120 Vienna/Europe   http://www.linbit.com :
