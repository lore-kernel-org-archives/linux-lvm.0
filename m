Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9GEevr26642
	for <linux-lvm@redhat.com>; Sat, 16 Oct 2004 10:40:57 -0400
Received: from sphinx.mythic-beasts.com (sphinx.mythic-beasts.com
	[212.69.37.6])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9GEejK0021432
	for <linux-lvm@redhat.com>; Sat, 16 Oct 2004 10:40:50 -0400
Received: from pdw by sphinx.mythic-beasts.com with local (Exim 4.34)
	id 1CIpjh-0003Wn-5i
	for linux-lvm@redhat.com; Sat, 16 Oct 2004 15:40:45 +0100
Date: Sat, 16 Oct 2004 15:40:45 +0100
From: Paul Warren <pdw@ex-parrot.com>
Subject: Re: [linux-lvm] "Cannot allocate memory" creating VGDA
Message-ID: <20041016154045.G28225@sphinx.mythic-beasts.com>
References: <20041016110547.Q27758@sphinx.mythic-beasts.com>
	<20041016130929.GH24242@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041016130929.GH24242@agk.surrey.redhat.com>;
	from agk@redhat.com on Sat, Oct 16, 2004 at 02:09:29PM +0100
Sender: Paul Warren <pdw@sphinx.mythic-beasts.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Oct 16, 2004 at 02:09:29PM +0100, Alasdair G Kergon wrote:
> On Sat, Oct 16, 2004 at 11:05:47AM +0100, Paul Warren wrote:
> > lvcreate -- ERROR "Cannot allocate memory" creating VGDA for
> > "/dev/mainvg/rootsnapshot" in kernel
> 
> > Any ideas on this one?
>  
> Ensure the LVM1 part of your kernel is fully patched (there
> was a memory over-allocation bug IIRC, but I forget the details).
> Try using larger chunk sizes.

Varying the chunk size doesn't seem to help.  This appears to be the
HIGHMEM issue that has come up on the list before.  If we recompile the
kernel without HIGHMEM support, it works OK (apart from the
unavailability of 3/4 of the RAM).

We're running 2.4.27 - are there patches beyond that?

Has anyone had any success with getting snapshots to work on a machine
with > 1GB RAM?

cheers,

Paul
