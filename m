Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0PHaqO29042
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2005 12:36:52 -0500
Received: from mproxy.gmail.com (mproxy.gmail.com [216.239.56.242])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0PHakHw001926
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2005 12:36:46 -0500
Received: by mproxy.gmail.com with SMTP id q44so693cwc
	for <linux-lvm@redhat.com>; Tue, 25 Jan 2005 09:36:46 -0800 (PST)
Message-ID: <dff37527050125093651cf4070@mail.gmail.com>
Date: Tue, 25 Jan 2005 12:36:45 -0500
From: Kristina Clair <kclair@gmail.com>
Subject: Re: [linux-lvm] XFS and snapshots [WAS: Re: Why the dramatic increase
	in filesystem performance when usingxfs????]
In-Reply-To: <87f94c370501241535568896c9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1106304669.3943.14.camel@grma-lap>
	<87f94c3705012108241f812e0e@mail.gmail.com>
	<20050124113204.B1604791@wobbly.melbourne.sgi.com>
	<87f94c37050124095332866424@mail.gmail.com>
	<20050125085526.B1628305@wobbly.melbourne.sgi.com>
	<87f94c370501241535568896c9@mail.gmail.com>
Reply-To: Kristina Clair <kclair@gmail.com>,
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
To: Greg Freemyer <greg.freemyer@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: Nathan Scott <nathans@sgi.com>

> <snip>
>         xfs_freeze -f "$SCRATCH_MNT"
>         [ $? != 0 ] && echo xfs_freeze -f "$SCRATCH_MNT" failed
>         (
>                 lvcreate --snapshot --size 1G --name scratch_snap "$VG/scratch"\
>                         > /dev/null 2>&1
> 

I'm confused.  I've gotten the impression from other posts to this
list that one should not use xfs_freeze before creating snapshots. 
The reason being that xfs_freeze suspends the filesystem, and then
lvcreate will also attempt to suspend the filesystem...

???

Kristina
