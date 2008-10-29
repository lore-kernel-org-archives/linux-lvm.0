Received: from dhcp80-216.msp.redhat.com (dhcp80-216.msp.redhat.com
	[10.15.80.216])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m9TGHejh025664
	for <linux-lvm@redhat.com>; Wed, 29 Oct 2008 12:17:41 -0400
Message-Id: <855CA3E6-BFDF-4DAA-A395-D8F9C350FF92@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <E1KvByv-00079Y-Ae@odzwierny1.comarch.com>
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] How to monitor and possibly autoextend snapshots
Date: Wed, 29 Oct 2008 11:16:50 -0500
References: <E1KvByv-00079Y-Ae@odzwierny1.comarch.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

Firstly, thanks for the fixes to the code.  The last one you mentioned  
(s/"s->ti->table"/"s->table"/) just depends on the kernel you are  
using.  (My patch was against upstream kernel.)

On Oct 29, 2008, at 9:26 AM, Marcin Kałuża wrote:

> minor variation is that I needed to use
>
> dmsetup wait <device> event_nr
>
> because every time the message was signaled,
> the counter increases and the default for event_nr is 0, not current.

Yup, I forgot to mention that...  Its done that way so that you can  
keep track if you have handled a particular event or not.

> Where can I read something about those events and messages? (Apart  
> from the
> source code itself of course ;)  I like the way it works, but I'd  
> like to
> know how and why - mainly to know when it can fail ;)

Yeah... there's not alot of documentation on that - except for some  
small snippets that are sprinkled in the man pages.  Let me explain  
just a little bit more.

There is inbound and outbound communication to device-mapper targets.   
The inbound (userspace -> kernel) comes in the form of the 'message'  
interface.  Every device-mapper target type (linear, stripe, mirror,  
snapshot, etc) has the option of implementing this function, but is  
not required to - in fact, most do not.  You could use the message  
interface to change device characteristics on the fly.  In our case, I  
implemented the message interface for the snapshot target - giving you  
the ability to tell a particular snapshot to raise an event when it  
gets X full.  Most targets forgo implementing this function because in  
most cases, you can specify a capability that you want when the device  
is created (through the constructor).  However, I think it our case,  
it is preferable to do it our way because we can change and reset when  
we want the notification while the device is live - rather than having  
to suspend and resume with a different constructor string.

The outbound (kernel -> userspace) communication comes in two forms -  
events and status.  Events (currently) are just a way to signal  
userspace that there is something of significance to be known.  The  
way you get that info is through status.  Events can be raised for any  
number of reasons, so you must read the status to determine if it is  
the event you are looking for.  (For example, mirrors raise events  
when the mirror becomes in-sync or when there is some sort of  
failure.  You would need to get the status to determine which it is  
and what kind of action to take.)

> My main concern is what could interfere with this mechanism? Are  
> there any
> kinds of events and how can I know that this event that occurred is  
> the one
> I'm waiting for.

You check the status.  :)

> I googled for it, by found no useful info...
>
> Is there a way to put it into mainstream lvm at some time (because  
> now I'll
> have to maintain my custom build kernels...)?

I think it's a good idea to have this capability, and it has come up  
before; so there is interest.  It can take a while for these things to  
progress, but here is how I see it playing out:

1) Get buy-in from the community (especially key players in device- 
mapper, like agk) and have them accept some version of the patch in  
this thread.  I like the patch because it doesn't try to do everything  
in the kernel - setting and resetting the thresholds is done by  
userspace.  This makes it's use very flexible.

The patch will then go upstream and then come back into other  
distribution kernels.  At this point, you will be able to implement  
your solution, but the features will not be automated.

2) Come to a community consensus as to the arguments and interface  
necessary to specify auto-response to thresholds in snapshots.  Then  
implement that in LVM.  This will take longer because the bulk of the  
work would be done here.

The patch will then go upstream and then come back into distribution  
LVM packages.

I'm not sure how long these steps will take - it depends on how  
enthusiastic people are about it.

  brassow




>
>
> Are there any chances to implement snapshot autoextension mechanism,  
> so it
> doesn't require external programs?
