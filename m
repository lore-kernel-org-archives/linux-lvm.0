Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1KMlr9d003087
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2012 17:47:53 -0500
Received: from mx02.ausregistry.net.au (mx02.ausregistry.net.au [202.65.15.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1KMlpTY013926
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2012 17:47:52 -0500
From: Stuart Browne <stuart.browne@ausregistry.com.au>
Date: Tue, 21 Feb 2012 09:47:36 +1100
Message-ID: <8CEF048B9EC83748B1517DC64EA130FB6B2AC2FDB8@off-win2003-01.ausregistrygroup.local>
References: <8CEF048B9EC83748B1517DC64EA130FB6B2AB35166@off-win2003-01.ausregistrygroup.local>
	<20120220144053.053ac4e2@bettercgi.com>
In-Reply-To: <20120220144053.053ac4e2@bettercgi.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Strange behavior adding LUN
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

Huh, nice to know I missed such an obvious step.

Cheers ;)

Stuart

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Ray Morris
> Sent: Tuesday, 21 February 2012 7:41 AM
> To: linux-lvm@redhat.com
> Subject: Re: [linux-lvm] Strange behavior adding LUN
> 
> > So, weird.  Why is the 'pvcreate' seeing the new LUN, seeing that it
> > is 2.93TB, but not creating any PE's for use.
> 
> You need to vgextend. The PE size is a property of the VG, so until
> it's added to a VG there's no way of knowing how big the PEs are and
> therefore how many will fit on the PV.
> --
> Ray Morris
> support@bettercgi.com
> 
> Strongbox - The next generation in site security:
> http://www.bettercgi.com/strongbox/
> 
> Throttlebox - Intelligent Bandwidth Control
> http://www.bettercgi.com/throttlebox/
> 
> Strongbox / Throttlebox affiliate program:
> http://www.bettercgi.com/affiliates/user/register.php
> 
> 
> 
> 
> On Mon, 20 Feb 2012 10:26:05 +1100
> Stuart Browne <stuart.browne@ausregistry.com.au> wrote:
> 
> > Hi,
> >
> > We've been cleaning up some of our storage recently and migrating to
> > new disks etc. when I came across this issue.
> >
> > I've re-allocated some old storage back to a server as a new array,
> > but lvm is refusing to allow the LUN to participate.  Here's what I
> > see:
> >
> > [root@office ~]# pvcreate /dev/mpath/backup1
> >   Physical volume "/dev/mpath/backup1" successfully created
> > [root@office ~]# pvdisplay /dev/mpath/backup1
> >   "/dev/mpath/backup1" is a new physical volume of "2.93 TB"
> >   --- NEW Physical volume ---
> >   PV Name               /dev/mpath/backup1
> >   VG Name
> >   PV Size               2.93 TB
> >   Allocatable           NO
> >   PE Size (KByte)       0
> >   Total PE              0
> >   Free PE               0
> >   Allocated PE          0
> >   PV UUID               ipTgcI-kjdJ-Aucx-cUVs-TWKr-wAFO-Rkd0u8
> >
<snip>
> >
> > Given that it looks, well, 'ok' to me, I thought I'd 'pvremove' it
> > and validate that the disk is empty.  It was (^@'s all the way, for
> > the first 10MB at least), and re-add it.  New UUID, but basically the
> > same.
> >
> > So, weird.  Why is the 'pvcreate' seeing the new LUN, seeing that it
> > is 2.93TB, but not creating any PE's for use.
> >
> > Anybody have any idea what I should try next?
> >
> > Stuart J. Browne
> > Senior Unix Administrator, Network Administrator, Database
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
