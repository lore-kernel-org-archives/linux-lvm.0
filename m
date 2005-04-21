Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3L46gO01728
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2005 00:06:42 -0400
Received: from mail.davidb.org (adsl-64-172-240-129.dsl.sndg02.pacbell.net
	[64.172.240.129])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3L46d4d005286
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2005 00:06:40 -0400
Received: from a64.davidb.org ([192.168.1.23])
	by mail.davidb.org with esmtpa (Exim 4.43 #1 (Debian))
	id 1DOSxb-0007KY-0u
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2005 21:06:39 -0700
Subject: Re: [linux-lvm] Snapshots and mmaped files.
References: <opsphokdjknas5wc@a64.davidb.org>
	<1114032979.27207.100.camel@seki.nac.uci.edu>
Message-ID: <op.spkdpaqlwxwmf6@a64.davidb.org>
Date: Wed, 20 Apr 2005 21:06:36 -0700
From: "David Brown" <lvm@davidb.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <1114032979.27207.100.camel@seki.nac.uci.edu>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

I don't think this is an issue of the database needing to be quiescent.   
The problem I'm seeing is that when the application modifies the database  
_after_ the snapshot is taken, the modifications partially appear in the  
snapshot as well.  I'm guessing that file modification that goes through  
write does the right thing in the snapshot, but modifications done via  
mmap don't cause the snapshot to duplicate the data.

The Berkely DB code should be able to recover from a coherent snapshot  
taken at any point in time.

Dave

On Wed, 20 Apr 2005 14:36:19 -0700, Dan Stromberg  
<strombrg@dcs.nac.uci.edu> wrote:

> If lvm2 snapshots are like most snapshots, then they aren't a panacea -
> they only decrease the window during which your database must be
> quiescent.
>
> EG, with snapshotting:
>
> 1) Shut down database
> 2) bifurcate off a snapshot
> 3) Start up database
> 4) Do backup against snapshot
> 5) Eliminate snapshot
>
>
> EG without snapshotting:
>
> 1) Shut down database
> 2) Do backup
> 3) Start up database
>
>
> The first case has more steps, but it also has a lot shorter time during
> which your database is inactive.
