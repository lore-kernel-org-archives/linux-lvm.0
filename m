Return-Path: <mauelshagen@sistina.com>
Date: Fri, 17 Aug 2001 11:16:36 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Message-ID: <20010817111636.C10370@sistina.com>
References: <20010815175659.A29749@sistina.com> <20010815182548.U3941@gum01m.etpnet.phys.tue.nl> <20010815185005.A32239@sistina.com> <20010815191912.V3941@gum01m.etpnet.phys.tue.nl>
Mime-Version: 1.0
In-Reply-To: <20010815191912.V3941@gum01m.etpnet.phys.tue.nl>; from garloff@suse.de on Wed, Aug 15, 2001 at 07:19:12PM +0200
Subject: [linux-lvm] Re: *** ANNOUNCEMENT *** LVM 1.0 available at www.sistina.com
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kurt Garloff <garloff@suse.de>
Cc: linux-lvm@sistina.com, lvm-devel@sistina.com

Kurt,

I just picked your e-mail standing for a couple to summarize:

- some people report, that the bi-directional upgrade path from
  <= LVM 0.9.1 Beta 7 to LVM 0.9.1 Beta 8 and beyond is fine
- some people complain that there could be an easier solution
  and that there are just 2 cases to distinguish which could easily be covered
  by a better upgrade tool which is *not* true

As Joe stated easily and I tried to explain briefly a while ago:
there's multiple cases and the solution we have right now seemed to be the
cleanest approach to cover them all *without* hitting the trape of missing some!

Because we take your complaints seriously we are investigating, if there's a
well defined finite amount of cases that we actually can cover with a simple
tool. 

If so, you are going get it ;-)

Please stay tuned and give as some time...

We'll keep you posted.

Thanks for your understanding!

Regards,
Heinz    -- The LVM Guy --


 
On Wed, Aug 15, 2001@07:19:12PM +0200, Kurt Garloff wrote:
> Hi Heinz,
> 
> thanks for your reply!
> 
> On Wed, Aug 15, 2001 at 06:50:05PM +0200, Heinz J . Mauelshagen wrote:
> > On Wed, Aug 15, 2001 at 06:25:48PM +0200, Kurt Garloff wrote:
> > > Is there finally a decent way to upgrade from 0.9.1b7?
> > > Or is it still required to have multiple versions of the utils installed
> > > just in order to be able to update from 0.9.1b7 to b8 (or 1.0)?
> > 
> > Well, as explained before on the lists we had an algorithm calculating
> > the offset to the first PE in place till 0.9.1 Beta 7.
> > 
> > Therefore, we *need* to run the installed version < LVM 0.9.1 Beta 8 to
> > retrieve that sector offset for all PVs and change the metadata to hold the
> > offset. No known way around this.
> 
> What about adding migration code to newer LVM tools?
> Make them able to get the offset to the first PE and write them to the new
> place in the PV on vgscan, so the upgrade procedure is painless, because
> it works automatically and tranparently. The only thing a user has to watch
> is to keep kernel and userspace LVM in sync then.
> 
> I can't imagine this to be too difficult, honestly. The code is there.
> You wanted to get rid of it, apparently, but why can't that be postponed?
> 
> Installing different versions of lvm tools in parallel in order to do
> the upgrade inside some ramdisk of your installation system with 100% 
> success sounds much more painful to me.
> Left alone those people who follow a different upgrade path than the
> standard one envisioned by us.
> 
> > > If yes, then I'd vote for not updating the kernel until this is fixed!
> > 
> > Well, we need to migrate the metadata in the future anyway once we want
> > to offer support for enhanced metadata reliability and redundancy.
> > We'll provide bidirectional migration tools for that then which will enable
> > the user to swicth back and forth between 2 installed LVM versions.
> 
> Now, that sounds better.
> 
> > Let's keep the ball flat WRT to the migration path here.
> > We've got mails with positive LVM 0.9.1 Beta 8 upgrade reports and
> > no complaints TTBOMK.
> 
> Because most people just refused to upgrade given the difficulties.
> Nobody wants to put his data at risk.
> As it stands, I guess, SuSE will also need to refuse :-(
> 
> This is a pain, because decoupling would be bad for both sides: 
> People (our customers) can't profit from your improvements and bugfixes any
> longer and you'll get bug reports for old versions instead of testing of
> your recent version. 
> 
> To be honest, I'd personally be disappointed if this happens:
> SuSE has supported the usage of LVM and offers support for it in the
> installation tool; I seriously suspect that the majority of LVM-users
> is using SuSE Linux. 
> Now, leaving them alone WRT upgrade is not very nice. 
> You'll get decoupled from your user base.
> 
> Let's try to avoid that, please!
> 
> Regards,
> -- 
> Kurt Garloff  <garloff@suse.de>                          Eindhoven, NL
> GPG key: See mail header, key servers         Linux kernel development
> SuSE GmbH, Nuernberg, DE                                SCSI, Security

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
