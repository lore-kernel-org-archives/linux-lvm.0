Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m1G0mgHH003867
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 19:48:42 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JQBEQ-0000vx-Lp
	for linux-lvm@redhat.com; Sat, 16 Feb 2008 00:48:42 +0000
Date: Sat, 16 Feb 2008 00:48:42 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove safety
Message-ID: <20080216004842.GG1788@agk.fab.redhat.com>
References: <1C8CF1EA1A5B5940B81B0710B2A4C93850BB382BA1@an-ex.ActiveNetwerx.int>
	<C3E4CC38-3764-4EC3-910E-9FBD91667701@redhat.com>
	<1C8CF1EA1A5B5940B81B0710B2A4C93850BB382BD6@an-ex.ActiveNetwerx.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C93850BB382BD6@an-ex.ActiveNetwerx.int>
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

On Fri, Feb 15, 2008 at 12:21:12PM -0700, Joseph L. Casale wrote:
> If the pvmove is stopped at any point and an -abort is given, are all the
> PE's that *were* reserved automatically freed up? Also, I assume the old PE's
> aren't freed up until everything is copied over and in sync?
 
Read the pvmove man page: the operation is done in stages with checkpoints,
and an abort reverts to the last checkpoint.  So part might have moved
and part might not have moved.
No old PEs are freed until the whole operation completes (or --abort).

Alasdair
-- 
agk@redhat.com
