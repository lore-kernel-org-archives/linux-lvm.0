Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBIKW89A016543
	for <linux-lvm@redhat.com>; Sat, 18 Dec 2004 20:32:08 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CflFI-0001aa-Ry
	for linux-lvm@redhat.com; Sat, 18 Dec 2004 20:32:08 +0000
Date: Sat, 18 Dec 2004 20:32:08 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] patch for separator option
Message-ID: <20041218203208.GN26670@agk.surrey.redhat.com>
References: <20041214093850.GA16922@suse.de> <20041216110052.GA4410@suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041216110052.GA4410@suse.de>
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

> > I realized that the -s/--short option for vgdisplay doesn't work
> > in lvm 2.2.00.31 (but also older versions).  That's because the
> > option --separator also gets the short option 's' in args.h.

> It the patch ok and will it be included in lvm2?
 
Not in that precise form:
Need to check for all other existing conflicts, if any, and
find a generic way to resolve them so 'vgs -s,' for
example can hopefully still work.
[e.g. if multiple possible use of same short form letter with a 
command, the first one listed is the one that applies]

Alasdair
-- 
agk@redhat.com
