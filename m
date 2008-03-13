Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m2DDdJT8013892
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2008 09:39:19 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JZneR-0005zS-9l
	for linux-lvm@redhat.com; Thu, 13 Mar 2008 13:39:19 +0000
Date: Thu, 13 Mar 2008 13:39:19 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Trouble pvmoving lv's out of a metadatacopies=0 pv
Message-ID: <20080313133919.GW1788@agk.fab.redhat.com>
References: <20070808143454.GE12798@helsinki.fi>
	<20080313132806.GA25620@helsinki.fi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20080313132806.GA25620@helsinki.fi>
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
To: linux-lvm@redhat.com

On Thu, Mar 13, 2008 at 03:28:06PM +0200, Janne Peltonen wrote:
> On Wed, Aug 08, 2007 at 05:34:54PM +0300, Janne Peltonen wrote:
> (See bug #252150 in bugzilla.redhat.com. I submitted the bug report last
> August, but this doesn't appear to be a trivial bug to squash - so I'm
> asking here for ways to work around it.)
 
You'll see that bug was fixed in lvm2-2.02.30-1.el5 and so the fix will be
included in 5.2, which is currently going through its testing phases.

Alasdair
-- 
agk@redhat.com
