Subject: Re: [linux-lvm] Progress on LVM2 snapshots
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <4abcc002bdbba2935bc93443c3beec65@redhat.com>
References: <1119267914.21477.3.camel@dilbert>
	<1122572640.9888.27.camel@localhost.localdomain>
	<4abcc002bdbba2935bc93443c3beec65@redhat.com>
Date: Thu, 28 Jul 2005 16:26:30 -0400
Message-Id: <1122582390.9888.54.camel@localhost.localdomain>
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
To: Jonathan E Brassow <jbrassow@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Thanks a lot for this information.

Is there anything external people like us can do to speed up this? There
are many people waiting for this snapshot feature since it is so useful
and essential. frankly, i know there are plan to replace md with dm, but
since md is already stable and this snapshot is very unstable, why not
do this first? :P

Ming

On Thu, 2005-07-28 at 15:06 -0500, Jonathan E Brassow wrote:
> #2
> 
> I know agk had some plans for cleaning up single machine snapshots, but 
> he is backed up behind reviewing/working on multipath and mirroring (in 
> addition to traveling all over for conferences:).
> 
>   brassow
> 
> On Jul 28, 2005, at 12:44 PM, Ming Zhang wrote:
> 
> > yes, i believe now a lot of people has this question now.
> >
> > is this question
> >
> > 1) very hard to solve technically. or
> > 2) not so easy but doable, just no time and human resource?
> >
> > thanks!
> >
> > Ming
> >
> >
> > On Mon, 2005-06-20 at 12:45 +0100, Mukund wrote:
> >> Dear all,
> >>
> >> 	Please can anyone -authoritative- tell me about the current state of
> >> snapshots support in LVM2? It was broken a while ago and I want to 
> >> know
> >> if it has been fixed now. I am the author of a storage management
> >> project (www.openfiler.org), and we are currently stuck with LVM1 (and
> >> the RHEL3 2.4 kernel and hence smaller device sizes) due to 
> >> non-working
> >> snapshots. Can LVM2 snapshots now be created and used reliably?
> >>
> >> 				Mukund
> >>
> >>
> >>
> >> _______________________________________________
> >> linux-lvm mailing list
> >> linux-lvm@redhat.com
> >> https://www.redhat.com/mailman/listinfo/linux-lvm
> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> 
