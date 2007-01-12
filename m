Message-Id: <45A766F3.A9E3.000B.0@novell.com>
Date: Thu, 11 Jan 2007 22:19:06 -0700
From: "Vijai Babu Madhavan" <mvijai@novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [RFC] Out of order snapshot deletion
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
To: evms-devel@lists.sourceforge.net, dm-devel@redhat.com, linux-lvm@redhat.com

Hi,

I thought I would bring this topic in a separate thread so that 
it can be discussed independently.

As users start taking a bunch of snapshots and keep them as 
backups, we see the following use pattern when the snapshots 
get recycled.

Different snapshots have different life cycle. When some one 
decides to keep 'x' snapshots, at the recycle phase, the least 
recent does not necessarily get deleted.

As users want to keep the daily snapshots for a much longer period
than the bi-hourly snapshots. In the same way, weekly snapshots 
live longer than daily snapshots.

I think this is pretty much similar to the way the current backup tapes
are managed.

I want to know if this is the kind of use case that users are having or 
the developers are thinking.

The reason why I am posting this is that this out of snapshot deletion
scenario, poses some interesting challenges in the design on the solution 
of multiple snapshots that share blocks with each other, as it is a lot easier 
to design a solution where the least recent gets deleted always.

Vijai
