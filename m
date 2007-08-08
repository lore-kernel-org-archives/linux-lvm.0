Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l78LL3Ur014787
	for <linux-lvm@redhat.com>; Wed, 8 Aug 2007 17:21:03 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IIsxi-0007YJ-Fj
	for linux-lvm@redhat.com; Wed, 08 Aug 2007 22:21:02 +0100
Date: Wed, 8 Aug 2007 22:21:02 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Best practice: metadata backup
Message-ID: <20070808212102.GP2064@agk.fab.redhat.com>
References: <20070807213412.GC2064@agk.fab.redhat.com>
	<Pine.LNX.4.44.0708081447350.23150-100000@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0708081447350.23150-100000@bmsred.bmsi.com>
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

On Wed, Aug 08, 2007 at 03:03:38PM -0400, Stuart D. Gathman wrote:
> That's good.  But I've been lurking and noticed that when things
> go disastrously wrong, and some poor admin posts here hoping for a miracle,
> the key to the miracle is having a copy of the LVM metadata somewhere for
> use with vgcfgrestore.  Apparently, the PV copies are not enough for
> current tools to allow recovery from some situations.
 
No distribution that I'm aware of uses the existing facilities in full
to solve problems at system boot.  If things aren't exactly right they
fail and leave the user to work out how to clean up the mess.  There's
quite a bit of logic that could be added to the initrd/initscripts to
handle - or at least report on - certain failure situations using the
existing LVM2 features.

Secondly, by the time admins seek help, they've sometimes already made
their situation many times worse by attempting to fix things the wrong
way.  Worse, they sometimes realise they did something stupid and
convince themselves they can still get sensible advice without revealing
everything they know they did.  So someone providing that help needs to
try to check everything in more than one way in case relevant
information is being withheld.  Mechanisms to help skilled support
engineers deal with such situations efficiently pervade the LVM2 design.  

The lvm_dump.sh script is being developed to capture the essential
information about an LVM2 system, and eventually we hope to have tools
to analyse and report upon the contents of the dump.  'pvck' is also
under development to aid recovery from one class of problems.

> Certainly, automatically bringing all remaining LVs online after
> PV failure is a must.
 
That's an example in point.  The LVM2 tools have offered facilities to
do that for several years.  The distributions do not yet make use of
them.

Alasdair
-- 
agk@redhat.com
