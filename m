Received: from lacrosse.corp.redhat.com (lacrosse.corp.redhat.com
	[172.16.52.154])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1SI2diB003899
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 13:02:39 -0500
Received: from vpn-14-202.rdu.redhat.com (vpn-14-202.rdu.redhat.com
	[10.11.14.202])
	by lacrosse.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	l1SI2dnx031073
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 13:02:39 -0500
Subject: Re: [linux-lvm] pvscan/vgscan/lvscan error
From: Dave Wysochanski <dwysocha@redhat.com>
In-Reply-To: <45D8A380.6050807@cesca.es>
References: <45D56FD4.7060908@cesca.es>  <45D8A380.6050807@cesca.es>
Date: Wed, 28 Feb 2007 13:02:39 -0500
Message-Id: <1172685760.4270.3.camel@linux-cxyg.rtp.netapp.com>
Mime-Version: 1.0
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

On Sun, 2007-02-18 at 20:05 +0100, Jordi Prats wrote:
> Hello,
> I've found more errors using lvm commands. This time using vgdisplay and
> lvdisplay:
> 
> # vgdisplay
>   /dev/sdb: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sde: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sdf: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sdg: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sdi: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sdk: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sdl: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sdp: read failed after 0 of 4096 at 0: Input/output error
>   --- Volume group ---
> (...)
> 
> # lvdisplay
>   /dev/sdb: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sde: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sdf: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sdg: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sdi: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sdk: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sdl: read failed after 0 of 4096 at 0: Input/output error
>   /dev/sdp: read failed after 0 of 4096 at 0: Input/output error
>   --- Logical volume ---
> (...)
> 
> I don't know what is causing this. Anyone can help me with this problem?
> 
> Thank you!
> Jordi
> 

What kind of storage do you have?

This might happen if you have an active/passive storage array.  The
passive paths won't accept I/O, but will show up in a device list.  LVM
(and other processes/threads) tries to do I/O to all devices (unless
they are filtered out in /etc/lvm.conf), and so you get I/O errors.  



> Jordi Prats wrote:
> > Hi all,
> > I've found that all vgscan is giving me an error. This is the output:
> > 
> > # vgscan -v
> >    Wiping cache of LVM-capable devices
> >    Wiping internal VG cache
> >  Reading all physical volumes.  This may take a while...
> >    Finding all volume groups
> >  /dev/dm-4: read failed after 0 of 4096 at 12989693952: Input/output error
> >  /dev/dm-4: read failed after 0 of 4096 at 0: Input/output error
> >    Finding volume group "padicat"
> >  Found volume group "padicat" using metadata type lvm2
> >    Finding volume group "vg_bbdd"
> >  Found volume group "vg_bbdd" using metadata type lvm2
> >    Finding volume group "vg_ordal"
> >  Found volume group "vg_ordal" using metadata type lvm2
> > 
> > Any idea what this "Input/output error" on /dev/dm-4 does it means? What
> > is causing this error?
> > 
> > Thank you!
> > 
> 
