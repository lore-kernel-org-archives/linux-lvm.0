Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0JK0N101010
	for <linux-lvm@redhat.com>; Thu, 19 Jan 2006 15:00:23 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.197])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0JK0FWU002774
	for <linux-lvm@redhat.com>; Thu, 19 Jan 2006 15:00:16 -0500
Received: by wproxy.gmail.com with SMTP id i23so382084wra
	for <linux-lvm@redhat.com>; Thu, 19 Jan 2006 12:00:15 -0800 (PST)
Message-ID: <859a78260601191200i37cc682qf4aebca78f4c0dc@mail.gmail.com>
Date: Thu, 19 Jan 2006 14:00:15 -0600
From: Matt P <slarty.tj@gmail.com>
Subject: Re: [linux-lvm] Disk space reporting inconsistencies
In-Reply-To: <43CF4607.70703@rarr.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
References: <43CE271C.4090308@rarr.org.uk> <43CF4607.70703@rarr.org.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Actually df is telling you the space available within the Filesystem
while pvscan is telling you the space available on the logical volume.

Try df -H and see if it matches your pvscan, the capital "H" tells df
to use powers of 1000 instead of 1024.

On 1/19/06, Chris bolton <cbolton@rarr.org.uk> wrote:
> nevermind got it sussed, lvm is using 10^9 for a gigabyte while df is
> using 1024^3
>
> well it would appear that way anyway.
> > Hi,
> >
> > just added a new PV to my VG but to me there seems to be an
> > inconsistency between what lvm says is the disk space and what df says.
> >
> > pvscan
> >  PV /dev/sda2   VG VolGroup00   lvm2 [68.38 GB / 0    free]
> >  PV /dev/sdb    VG VolGroup00   lvm2 [68.50 GB / 0    free]
> >  PV /dev/hdc2   VG VolGroup00   lvm2 [37.12 GB / 0    free]
> >  PV /dev/hdb1   VG VolGroup00   lvm2 [37.22 GB / 0    free]
> >  PV /dev/hdd1   VG VolGroup00   lvm2 [37.22 GB / 0    free]
> >  PV /dev/hde1   VG VolGroup00   lvm2 [37.25 GB / 0    free]
> >  Total: 6 [285.69 GB] / in use: 6 [285.69 GB] / in no VG: 0 [0   ]
> >
> > df -h
> > /dev/mapper/VolGroup00-LogVol00   265G  227G   28G  90% /
> >
> > I tried resizing the filesystem but it just says this..
> >
> > ext2online  /dev/VolGroup00/LogVol00
> >    ext2online v1.1.18 - 2001/03/18 for EXT2FS 0.5b
> >    ext2online: ext2_ioctl: No space left on device
> >
> > ext2online: unable to resize /dev/mapper/VolGroup00-LogVol00
> >
> > Am I missing something obvious here? or have I ballsed it up along the
> > way?
> >
> > Cheers,
> > Chris.
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
