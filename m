Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBLKmqge001678
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 20:48:52 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Cgqw8-0007qL-Eb
	for linux-lvm@redhat.com; Tue, 21 Dec 2004 20:48:52 +0000
Date: Tue, 21 Dec 2004 20:48:52 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20041221204852.GR26670@agk.surrey.redhat.com>
References: <41BB808E.60108@danielroth.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41BB808E.60108@danielroth.se>
Subject: [linux-lvm] Re: Can't mount after crash
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Dec 12, 2004 at 12:19:42AM +0100, Daniel Roth wrote:
> My lvm-system crashed a day ago and I was really lost in how to do. 

You don't say how you actually first discovered something had gone wrong,
or give any clues about what might have led up to the problem causing it.

Your message doesn't show any LVM problems.

Did something scribble over your disks?
Have you tried mounting with alternative superblocks?

> I found the metadatafile and could with
> pvcreate --uuid ... --restorefile ... .... /hdg5,

You should only use those if you've lost a disk or accidentally overwritten
the start of one and vgcfgrestore isn't working.

Alasdair
-- 
agk@redhat.com
