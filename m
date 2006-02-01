Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k11NMT116016
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 18:22:29 -0500
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k11NMSA0008860
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 18:22:28 -0500
Subject: Re: [linux-lvm] 'snapshot' target still experimental :-(
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <1138830708.15727.20.camel@pc.ilinx>
References: <43E0E3E3.3030407@starnetworks.us>
	<1138829354.26648.85.camel@seki.nac.uci.edu>
	<1138830708.15727.20.camel@pc.ilinx>
Date: Wed, 01 Feb 2006 18:22:09 -0500
Message-Id: <1138836130.4762.146.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2006-02-01 at 16:51 -0500, Brian J. Murrell wrote:
> On Wed, 2006-02-01 at 13:29 -0800, Dan Stromberg wrote:
> > It just maintains a series of hardlink trees, so any time a file is
> > deleted or added, the actual disk usage increase is only due to the
> > changes.
> 
> Yes, this is quite a popular technique.  To be clear though, a change in
> a file does not consume just the amount of the change in the file on the
> backup target, but it consumes the entire size of the new file.  A
> not-so-insignificant amount for very large files.  This is where a
> (block level or filesystem level) snapshotting scheme would excel as it
> would likely only consume an amount of space rounded up to the next
> "unit" size more even for changes within a file.

it depends.

assume u have a huge text file. u change 1 char, the snapshot is useful.
u add one line at the beginning, the snapshot is useless here.

the offset shift.

some delta tech will be useful here.


> 
> Indeed (and to keep quite on topic), perhaps rather than hardlink trees,
> LVM snapshots would be even more space efficient.  Maybe that is what
> this thread has been about.  I just jumped in.  Apologies if it was.
> 
> b.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
