Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA217lr11516
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 20:07:47 -0500
Received: from hotmail.com (bay17-f31.bay17.hotmail.com [64.4.43.81])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iA217egb011574
	for <linux-lvm@redhat.com>; Mon, 1 Nov 2004 20:07:40 -0500
From: "Kai Leibrandt" <k_leibrandt@hotmail.com>
Subject: Re: [linux-lvm] Re: Software raid on top of lvm logical volume
Date: Tue, 02 Nov 2004 01:33:37 +0100
Mime-Version: 1.0
Message-ID: <BAY17-F31Gvs0Qzfud70006c31d@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Solaris' LVM is able to do this all in one manager too, in fact, all volumes 
start life as single raid0 slices, which you then add stripes (keeping it a 
raid0 volume, as Solaris calls it) or mirrors to (to create a raid1 volume). 
Also, for snapshots, you can actually choose where to put the background 
storage for the snapshot, so you can just stick it on a mounted volume that 
has enough space. This is great because you can use all of your physical 
extents of your PV even when using snapshots, instead of reserving some 
space for snapshots in your VG...
Also, admin of volumes under Solaris is really very straight forward, I only 
wish it were so easy with Linux/LVM/md (though it is still not very 
difficult of course), especially when creating a new mirror from a volume, 
adding new pv's etc...
For those who are interested, http://docs.sun.com/db/doc/817-5776 is a good 
read...

Kai.

>From: "Erik Ohrnberger" <Erik@echohome.org>
>Reply-To: Erik@echohome.org,LVM general discussion and development 
><linux-lvm@redhat.com>
>To: "LVM general discussion and development" <linux-lvm@redhat.com>
>Subject: Re: [linux-lvm] Re: Software raid on top of lvm logical volume
>Date: Mon, 1 Nov 2004 11:51:33 -0500 (EST)
>
>This solution would seem to be as the holy grail in that it would give you
>the best of all worlds: resizable RAID storage.  Or am I wrong about this
>assumption?
>
>On Mon, November 1, 2004 11:01, Michael T. Babcock said:
> > Peter T. Breuer wrote:
> >
> >>>i do not believe you would have any advantage in stacking md above lvm
> >>>anyway.
> >>>
> >>>
> >>
> >>That is right. In fact it sounds downright risky to me.
> >>
> >>
> >
> > I've actually considered a few times how one might be able to merge the
> > md functionality into LVM2 (device-mapper) for having software-RAID part
> > of the logical volume system (since a software-RAID partition is a
> > logical volume of another type anyway).
> >
> > It would require some significant effort, but it seems doable.
> > --
> > Michael T. Babcock
> > http://mikebabcock.ca
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.com/
