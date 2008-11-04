Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA4CbnVq014373
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2008 07:40:03 -0500
Received: from odzwierny1.comarch.com (odzwierny1.comarch.com [217.74.69.9])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA4C8kCx025026
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2008 07:09:28 -0500
Received: from localhost (localhost [127.0.0.1])
	authenticated as marcin.kaluza@comarch.com
	by odzwierny1.comarch.com with esmtpa (ComArch ESMTP)
	id 1KxKiE-0003XE-4U
	for linux-lvm@redhat.com; Tue, 04 Nov 2008 13:08:46 +0100
From: =?iso-8859-2?Q?Marcin_Ka=B3u=BFa?= <marcin.kaluza@comarch.pl>
Subject: RE: [linux-lvm] How to monitor and possibly autoextend snapshots
Date: Tue, 4 Nov 2008 13:10:11 +0100
MIME-Version: 1.0
In-Reply-To: <855CA3E6-BFDF-4DAA-A395-D8F9C350FF92@redhat.com>
Message-Id: <E1KxKiE-0003XE-4U@odzwierny1.comarch.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>



> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Jonathan Brassow
> Sent: Wednesday, October 29, 2008 5:17 PM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] How to monitor and possibly autoextend snapshots
> 
> Firstly, thanks for the fixes to the code.  The last one you mentioned
> (s/"s->ti->table"/"s->table"/) just depends on the kernel you are
> using.  (My patch was against upstream kernel.)
> 
> On Oct 29, 2008, at 9:26 AM, Marcin Ka�u�a wrote:
> 
> > minor variation is that I needed to use
> >
> > dmsetup wait <device> event_nr
> >
> > because every time the message was signaled,
> > the counter increases and the default for event_nr is 0, not current.
> 
> Yup, I forgot to mention that...  Its done that way so that you can
> keep track if you have handled a particular event or not.
> 
> > Where can I read something about those events and messages? (Apart
> > from the
> > source code itself of course ;)  I like the way it works, but I'd
> > like to
> > know how and why - mainly to know when it can fail ;)
> 
> Yeah... there's not alot of documentation on that - except for some
> small snippets that are sprinkled in the man pages.  Let me explain
> just a little bit more.
> 
> There is inbound and outbound communication to device-mapper targets.
> The inbound (userspace -> kernel) comes in the form of the 'message'
> interface.  Every device-mapper target type (linear, stripe, mirror,
> snapshot, etc) has the option of implementing this function, but is
> not required to - in fact, most do not.  You could use the message
> interface to change device characteristics on the fly.  In our case, I
> implemented the message interface for the snapshot target - giving you
> the ability to tell a particular snapshot to raise an event when it
> gets X full.  Most targets forgo implementing this function because in
> most cases, you can specify a capability that you want when the device
> is created (through the constructor).  However, I think it our case,
> it is preferable to do it our way because we can change and reset when
> we want the notification while the device is live - rather than having
> to suspend and resume with a different constructor string.
> 
> The outbound (kernel -> userspace) communication comes in two forms -
> events and status.  Events (currently) are just a way to signal
> userspace that there is something of significance to be known.  The
> way you get that info is through status.  Events can be raised for any
> number of reasons, so you must read the status to determine if it is
> the event you are looking for.  (For example, mirrors raise events
> when the mirror becomes in-sync or when there is some sort of
> failure.  You would need to get the status to determine which it is
> and what kind of action to take.)


Thanks - his clears things up a bit :)

> 
> > My main concern is what could interfere with this mechanism? Are
> > there any
> > kinds of events and how can I know that this event that occurred is
> > the one
> > I'm waiting for.
> 
> You check the status.  :)
I still didn't figure out how to get the kind of event, that happened...
dmsetup wait -v returns the same thing as "info" and "status" just gives the
size and %usage, but I can live without it :)

 
> > I googled for it, by found no useful info...
> >
> > Is there a way to put it into mainstream lvm at some time (because
> > now I'll
> > have to maintain my custom build kernels...)?
> 
> I think it's a good idea to have this capability, and it has come up
> before; so there is interest.  It can take a while for these things to
> progress, but here is how I see it playing out:
> 
> 1) Get buy-in from the community (especially key players in device-
> mapper, like agk) and have them accept some version of the patch in
> this thread.  I like the patch because it doesn't try to do everything
> in the kernel - setting and resetting the thresholds is done by
> userspace.  This makes it's use very flexible.
> 
> The patch will then go upstream and then come back into other
> distribution kernels.  At this point, you will be able to implement
> your solution, but the features will not be automated.

I never did such things, but I'll go and ask on dm-devel.

> 2) Come to a community consensus as to the arguments and interface
> necessary to specify auto-response to thresholds in snapshots.  Then
> implement that in LVM.  This will take longer because the bulk of the
> work would be done here.
> 
> The patch will then go upstream and then come back into distribution
> LVM packages.
> 
> I'm not sure how long these steps will take - it depends on how
> enthusiastic people are about it.

I've recently found some code for doing it with dmeventd, but somehow I
can't make it work with snapshots (at least not on centos 5.2/64). Again -
I'll go and ask on dm-devel about it.

Thanks for all the help
Martin
