Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i8BLDvrI029196
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 22:13:57 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C6FC1-0004fS-Js
	for linux-lvm@redhat.com; Sat, 11 Sep 2004 22:13:57 +0100
Date: Sat, 11 Sep 2004 22:13:57 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [PATCH] Fix for hanging resize on root filesystem
Message-ID: <20040911211357.GH1094@agk.surrey.redhat.com>
References: <4141A25C.70701@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4141A25C.70701@suse.com>
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

On Fri, Sep 10, 2004 at 08:47:24AM -0400, Jeff Mahoney wrote:
> When a user has their root filesystem on an LV and attempts to resize
> the LV, the kernel will deadlock while trying to update the atime on the
> device node.
 
Indeed, and if you push harder you'll probably find some trickier
problems there too.  This is one of the reasons I've said numerous
times we don't support pvmove/snapshots of the devices used by the
tools themselves.  I shall add a test to the tools to detect when
people do this.  [See also the old 2.4 kernel patch included in the
source tree (but not applied by default) which disables the relevant
*time updates - write as well as read. I've not had time to look at 
equivalents for 2.6 yet.]

The way I envisage snapshots/pvmoves being supported most safely 
is by using temporary copies of the relevant inodes on a filesystem
that does not get suspended.

Alasdair
-- 
agk@redhat.com
