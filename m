Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0PHpCO00895
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2005 12:51:12 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.196])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0PHp6wV004771
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2005 12:51:06 -0500
Received: by wproxy.gmail.com with SMTP id 67so340332wri
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2005 09:51:00 -0800 (PST)
Message-ID: <87f94c3705012509513937172c@mail.gmail.com>
Date: Tue, 25 Jan 2005 12:51:00 -0500
From: Greg Freemyer <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] XFS and snapshots [WAS: Re: Why the dramatic increase
	in filesystem performance when usingxfs????]
In-Reply-To: <dff37527050125093651cf4070@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1106304669.3943.14.camel@grma-lap>
	<87f94c3705012108241f812e0e@mail.gmail.com>
	<20050124113204.B1604791@wobbly.melbourne.sgi.com>
	<87f94c37050124095332866424@mail.gmail.com>
	<20050125085526.B1628305@wobbly.melbourne.sgi.com>
	<87f94c370501241535568896c9@mail.gmail.com>
	<dff37527050125093651cf4070@mail.gmail.com>
Reply-To: Greg Freemyer <greg.freemyer@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Kristina Clair <kclair@gmail.com>
Cc: Nathan Scott <nathans@sgi.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 25 Jan 2005 12:36:45 -0500, Kristina Clair <kclair@gmail.com> wrote:
> > <snip>
> >         xfs_freeze -f "$SCRATCH_MNT"
> >         [ $? != 0 ] && echo xfs_freeze -f "$SCRATCH_MNT" failed
> >         (
> >                 lvcreate --snapshot --size 1G --name scratch_snap "$VG/scratch"\
> >                         > /dev/null 2>&1
> >
> 
> I'm confused.  I've gotten the impression from other posts to this
> list that one should not use xfs_freeze before creating snapshots.
> The reason being that xfs_freeze suspends the filesystem, and then
> lvcreate will also attempt to suspend the filesystem...
> 
> ???
> 
> Kristina
> 
Kristina,

I was not clear. 

I posted about a working snapshot test script for LVM1 / 2.4 kernel / XFS.

It has not yet been tested with the 2.6 kernel at all, and I know
nothing about LVM2.

I was looking for feedback about obvious changes to the syntax between
LVM1 and LVM2.  Do they even use the same command names?

Your statement about xfs_freeze being a problem may be true and if so
would be the first known (to me) incompatibility in the script.

Nathan, is there a bugzilla about xfs_freeze causing problems witht he
2.6 kernel?

Greg
-- 
Greg Freemyer
