Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m54EvagJ016424
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 10:57:36 -0400
Received: from mail.terrascale.net ([64.254.245.115])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m54EvKfo029862
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 10:57:20 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.terrascale.net (Postfix) with ESMTP id 776214B843F
	for <linux-lvm@redhat.com>; Wed,  4 Jun 2008 10:02:00 -0400 (EDT)
Received: from mail.terrascale.net ([127.0.0.1])
	by localhost (andrei2.ts [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ABPnzNNwuZaG for <linux-lvm@redhat.com>;
	Wed,  4 Jun 2008 10:01:57 -0400 (EDT)
Received: from monkey.ts (monkey.ts [172.20.6.11])
	by mail.terrascale.net (Postfix) with ESMTP id DC5064B843D
	for <linux-lvm@redhat.com>; Wed,  4 Jun 2008 10:01:54 -0400 (EDT)
Message-ID: <4846A052.10607@rackable.com>
Date: Wed, 04 Jun 2008 10:01:54 -0400
From: Steeve McCauley <steeve@rackable.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of snapshot
	merging
References: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
In-Reply-To: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: steeve@terrascale.net,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


Is this change meant to add cluster support for merging?  I had
been under the assumption that merging was already a feature of
snapshots.

What is the difference between the current implementation using
lvremove (which I assumed was where the COW blocks were merged back
into the original volume) and lvconvert as below?  Why was this
functionality not kept in lvremove?

Mikulas Patocka wrote:
> Hi
> 
> Here I release the first experimental implementation of snapshot 
> merging. Merging allows you to copy data in snapshot back to the origin 
> device. Once merging starts, it runs on background. When the merging 
> finishes (you see "0%" with "lvs" command), you should remove the 
> merging snapshot with lvremove command.
> 
> The userspace will still be changed, the kernel is already finished 
> (there are no known bugs in the kernel, I'm curious about the unknown 
> ones :)
> 
> Merging is initiated with "lvconvert -M vg/lv_snapshot" command. When 
> you initiate merging, make sure that the origin device is not mounted. 
> Snapshot can be mounted while it's merging is initiated.
> 
> During merging, aby reads and writes to the origin device are identical 
> to accesses to the merging snapshots.
> 
> There may be multiple snapshots while one of them is being merged --- 
> exceptions in other snapshots are being allocated and there snapshots 
> are kept stable.
> 
> Don't try to concurrently merge more than one snapshot (the kernel 
> refuses to do it, the userspace tools don't know about it --- the 
> userspace will be rewritten anyway).
> 
> The patches are at:
> http://people.redhat.com/mpatocka/patches/
> The patches are for 2.6.26-rc4
> 
> (besides merging, there are some other bugfixes, I made for the kernel)
> 
> Mikulas
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Steeve McCauley
Director of Research and Development
Rackable Systems
407 McGill Street, Suite 1002
Montreal, Quebec, H2Y 2G3 (Canada)
Tel: 514-288-3343
http://www.rackable.com
:wq
