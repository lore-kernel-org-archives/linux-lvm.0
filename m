Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBUJKYr26567
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2004 14:20:34 -0500
Received: from hal9000.jaa.iki.fi (gw.jaa.iki.fi [64.81.100.231])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBUJKSZL009606
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2004 14:20:28 -0500
Date: Thu, 30 Dec 2004 12:20:23 -0700
From: Jani Averbach <jaa@jaa.iki.fi>
Subject: Re: [linux-lvm] Very long startup times of the lv*-tools
Message-ID: <20041230192023.GB26134@jaa.iki.fi>
References: <200412291742.04569.erik.wasser@iquer.net>
	<20041230191239.GW26670@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041230191239.GW26670@agk.surrey.redhat.com>
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

On 2004-12-30 19:12+0000, Alasdair G Kergon wrote:
> Upgrade LVM2!
> 
> Anyone know why so many gentoo users find themselves using old 
> versions like that and don't upgrade?

At the moment gentoo list lvm2 as following:

lvm2-2.00.08:    KEYWORDS="x86 ppc sparc amd64"
lvm2-2.00.15:    KEYWORDS="~x86 ppc ~sparc ~amd64 ppc64 ~alpha"
lvm2-2.00.15-r1: KEYWORDS="~x86 ~ppc ~sparc ~amd64 ~ppc64 ~alpha"
lvm2-2.00.25:    KEYWORDS="~x86 ~ppc ~sparc ~amd64 ~ppc64 ~alpha hppa"

Where '~' meand "testing", and arch code w/o '~' means stable.

2.00.25 is the latest version offered by portage-system.

I am not any way accosiated to the those ebuilds, I just use them. If
you like, I could file a bug about the current state of offers to the
Gentoo's bugzilla.

BR, Jani

-- 
Jani Averbach
