Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41Lxqqg014584
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 17:59:53 -0400
Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m41Lxqtc015005
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 17:59:52 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1Jrgoi-0000kq-D9
	for linux-lvm@redhat.com; Thu, 01 May 2008 22:59:52 +0100
Date: Thu, 1 May 2008 22:59:52 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
Message-ID: <20080501215952.GV18935@agk.fab.redhat.com>
References: <481A1D32.6020705@Media-Brokers.com> <481A1FAF.5050303@verizon.net>
	<481A221D.80209@Media-Brokers.com> <481A262C.7080908@verizon.net>
	<20080501202534.GU18935@agk.fab.redhat.com>
	<481A286E.80309@verizon.net> <481A2947.9070907@Media-Brokers.com>
	<481A29DD.6040108@verizon.net> <481A2BB4.7080504@Media-Brokers.com>
	<481A2EB3.40703@verizon.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <481A2EB3.40703@verizon.net>
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

On Thu, May 01, 2008 at 04:57:23PM -0400, Gerry Reno wrote:
> LVM should be robust enough to fully recover from this without any 
> corruption.  It just should have discarded the old snapshot.  The 
> original volume should not be affected.  But as I said, I suspect there 
> may be a bug.  Probably some scenario is not being handled in the code.
 
Once again, lvm2 provides the distribution or sysadmin with the facilities to
handle these scenarios.  It's up to your initrd and/or initscripts whether or
not and how to use those facilities.

Alasdair
-- 
agk@redhat.com
