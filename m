Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJHv7r04612
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 12:57:07 -0500
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAJHv23Y017225
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 12:57:02 -0500
Received: from [127.0.0.1] (leviathan [131.128.51.64])
	by leviathan.ele.uri.edu (8.12.9/8.12.9) with ESMTP id iAJHuxqr017740
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 12:56:59 -0500 (EST)
Subject: Re: [linux-lvm] relocate on write for snapshot
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <20041119171933.GA1417@trip.muon.local>
References: <1100882347.2984.32.camel@localhost.localdomain>
	<20041119171933.GA1417@trip.muon.local>
Message-Id: <1100887019.2984.37.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Fri, 19 Nov 2004 12:56:59 -0500
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2004-11-19 at 12:19, Nils Juergens wrote:
> On Fri, 19.11.04, Ming Zhang <mingz@ele.uri.edu> wrote:
> 
> > instead of copy old one to snapshot, overwrite old one with new one, 2
> > writes and 1 reads. it is possible that write new data to a usused
> > location directly.
> 
> Since you have to delete the snapshot (and I don't think they live very long
> on most systems) you don't gain anything (because you have copy the changes
> back from the snapshot), but you make the cases of more than one snapshot
> and (possibly) read-write snapshots a lot harder, maybe not in CPU or IO,
> but certainly in code complexity, which is a thing you never do to gain
> a bit of performance.
> 
on some systems that mainly for disaster recovery purpose, there will be
a lot of snapshots available for a lv. this can make the recovery much
easier.

> > i know later remove a snaphot will be a little trouble, but there must
> > be some way to get around it.
> 
> Yes, you have to do the work you saved a couple of minutes earlier :)
> 
a dedicated snapshot merge process can solve this.

> just my EUR 0.02,
thanks. discussion always can make thing clarified.


> Nils
