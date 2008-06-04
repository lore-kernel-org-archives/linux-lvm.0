Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5405dBa003623
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 20:05:39 -0400
Received: from scidubsmtp03.stercomm.com (scidubsmtp03.stercomm.com
	[209.95.244.153])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5405TRw029381
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 20:05:29 -0400
Received: from IWDUBCORMSG001.sci.local (iwdubcormsg001.sci.local
	[10.105.142.31])
	by boamail2.stercomm.com (Postfix) with ESMTP id B531B33BEC
	for <linux-lvm@redhat.com>; Tue,  3 Jun 2008 20:07:38 -0400 (EDT)
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of
	snapshot merging
From: Chris Cox <chris_cox@stercomm.com>
In-Reply-To: <1212536286.29076.202.camel@pc.ilinx>
References: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
	<1212525819.19122.16.camel@behemoth.csg.stercomm.com>
	<1212536286.29076.202.camel@pc.ilinx>
Content-Transfer-Encoding: 7bit
Date: Tue, 03 Jun 2008 19:05:26 -0500
Message-Id: <1212537926.2724.16.camel@behemoth.csg.stercomm.com>
Mime-Version: 1.0
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

On Tue, 2008-06-03 at 19:38 -0400, Brian J. Murrell wrote:
> On Tue, 2008-06-03 at 15:43 -0500, Chris Cox wrote:
> > 
> > I would think this would be VERY hard to do since both the "origin" and
> > "snapshot" change (file deletes, etc).
> 
> I don't think it's as difficult as you are thinking it is.  You are
> thinking of synchronizing filesystems, at the filesystem level, but
> merging a snapshot back up into the origin does not deal with files or
> even filesystems.  It deals with block devices and blocks, and is really
> nothing more than a coordinated:
> 
> for each COW_block in snapshot; do
>     for other_snapshot of origin; do
>         copy origin[COW_block] to other_snapshot[COW_block]
>         copy snapshot[COW_block] to origin[COW_block]
>     done
> done
> 
> > Do you have a set of rules you
> > use for the merge?
> 
> There is no filesystem level merge.  There are no rules needed.

Ok... I'm still a bit confused (sorry)... I'm going to assume
a last out wins scenario with regards to meta data conflicts
... yes.. I know, I'm having a tough time separating out the
filesystem element from the block device :)

Thanks for the answer... it does make sense (just makes my
brain hurt).
