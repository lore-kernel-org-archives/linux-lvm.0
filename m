Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA6LwgV01620
	for <linux-lvm@redhat.com>; Sun, 6 Nov 2005 16:58:42 -0500
Received: from omx3.sgi.com (omx3-ext.sgi.com [192.48.171.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jA6Lwf6P018984
	for <linux-lvm@redhat.com>; Sun, 6 Nov 2005 16:58:41 -0500
Received: from larry.melbourne.sgi.com (larry.melbourne.sgi.com
	[134.14.52.130])
	by omx3.sgi.com (8.12.11/8.12.9/linux-outbound_gateway-1.1) with SMTP
	id jA6MqhBw014965
	for <@external-mail-relay.sgi.com:linux-lvm@redhat.com>;
	Sun, 6 Nov 2005 14:52:47 -0800
Received: from wobbly.melbourne.sgi.com (wobbly.melbourne.sgi.com
	[134.14.55.135]) by larry.melbourne.sgi.com
	(950413.SGI.8.6.12/950213.SGI.AUTOCF) via ESMTP id IAA25397 for
	<linux-lvm@redhat.com>; Mon, 7 Nov 2005 08:58:32 +1100
Received: from wobbly.melbourne.sgi.com (localhost [127.0.0.1])
	by wobbly.melbourne.sgi.com (SGI-8.12.5/8.12.5) with ESMTP id
	jA6Lwjkt6379394
	for <linux-lvm@redhat.com>; Mon, 7 Nov 2005 08:58:45 +1100 (EST)
Received: (from nathans@localhost)
	by wobbly.melbourne.sgi.com (SGI-8.12.5/8.12.5/Submit) id
	jA6LwheW6405738
	for linux-lvm@redhat.com; Mon, 7 Nov 2005 08:58:43 +1100 (EST)
Date: Mon, 7 Nov 2005 08:58:43 +1100
From: Nathan Scott <nathans@sgi.com>
Subject: Re: [linux-lvm] Failed xfs_growfs after lvextend
Message-ID: <20051107085843.B6401970@wobbly.melbourne.sgi.com>
References: <436CFA6E.5000607@svs.gsfc.nasa.gov>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <436CFA6E.5000607@svs.gsfc.nasa.gov>;
	from rajones@svs.gsfc.nasa.gov on Sat, Nov 05, 2005 at 01:31:10PM
	-0500
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 05, 2005 at 01:31:10PM -0500, Randall A. Jones wrote:
> I extended an LV to 12.28TB and ran xfs_growfs on the mount point, lv0.
> This appeared to work fine except that after this, the filesystem didn't 
> appear any larger.

I looked into this problem awhile back now.  I believe what you're
seeing here is an inconsistency in the kernels block layer - at least,
when I last looked at this, this was the problem - the size increase
was indeed done inside the driver, and /sys/block/xxx/size confirmed
that, but the interfaces which use /dev/xxx to get the device size do
not see the increase (i.e. lseek(SEEK_END) or a BLKGETSIZE64 ioctl).

I wrote the attached program to show the issue, and sent mail to LKML
to let folks know of the issue, I guess noone has got around to trying
to address the problem yet though.  The core of the problem was that
the /dev/xxx inode size (i_size) had not been updated to reflect the
change in device size, IIRC.

Hmm, actually, I just went and read through fs/block_dev.c again, and
perhaps this is a device mapper bug after all - there is an interface
for increasing the inode size (bd_set_size) but it doesn't seem to
be called from anywhere in drivers/md/dm*...?  Theres one call to the
i_size_write interface on the bdev inode, but I can't tell whether it
will be called on the resize - perhaps a device mapper guru can tell
us?  It looks like MD might do the resize correctly though, its got a
call in what looks like a device-size-increasing code path.

Give this program a try though, just to see if you are seeing the same
problem that I was.

cheers.

-- 
Nathan

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="getdevicesize.c"

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/mount.h>

#ifndef BLKGETSIZE64
# define BLKGETSIZE64   _IOR(0x12,114,size_t)
#endif

int main(int argc, char **argv)
{
	__uint64_t	size;
	long long	sz = -1;
	int		error, fd;

	if (argc != 2) {
		fputs("insufficient arguments\n", stderr);
		return 1;
	}
	fd = open(argv[1], O_RDONLY);
	if (!fd) {
		perror(argv[1]);
		return 1;
	}

	error = ioctl(fd, BLKGETSIZE64, &size);
	if (error >= 0) {
		/* BLKGETSIZE64 returns size in bytes not 512-byte blocks */
		sz = (long long)(size >> 9);
		printf("%lld 512 byte blocks (BLKGETSIZE64)\n", sz);
	} else {
		/* If BLKGETSIZE64 fails, try BLKGETSIZE */
		unsigned long tmpsize;

		error = ioctl(fd, BLKGETSIZE, &tmpsize);
		if (error < 0) {
			fprintf(stderr, "can't determine device size");
			return 1;
		}
		sz = (long long)tmpsize;
		printf("%lld 512 byte blocks (BLKGETSIZE)\n", sz);
	}
	return 0;
}

--J/dobhs11T7y2rNN--
