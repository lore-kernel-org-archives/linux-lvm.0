MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <16280.27015.741563.601954@gargle.gargle.HOWL>
From: "John Stoffel" <stoffel@lucent.com>
Subject: Re: [linux-lvm] RAID 1 on Device Mapper - best practices?
In-Reply-To: <20031021171817.GA28462@mail.parplies.de>
References: <200310172212.06301.mike@gaima.co.uk>
	<20031021171817.GA28462@mail.parplies.de>
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
Date: Thu Oct 23 18:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

wopp> I believe that is not true. How do you resize a RAID device? The
wopp> only option I can think of is to re-create it, which is clearly
wopp> beside the point. With LVM on top of RAID, you can lvextend (or
wopp> lvreduce), pvmove and so on - where's the problem?

Well, the problem as I see it is that it really puts the model for
device/block management upside down on it's head.  

wopp> To put it differently, LVM devices are not just "another block
wopp> device", they're resizeable block devices. You get this benefit
wopp> at the level you use LVM on. Below RAID it's not really worth
wopp> much (which is probably why Debian starts RAID first).

I don't think this is really right, but if that's what we have, that's
what I have to deal with. 

Basically, I'm very used to the Veritas Volume Manager (VxVM) and
other mature LVM offerings from other Unix vendors.  In those setups,
you have the low level disk(s).  On top of them you create logical
disks (or sub-disks) which are then strung together at the next higher
layer into sub-volumes (or plexes).  At this point you have alot of
options.  You can mirror sub-volumes, or you can build them into a
RAID0 stripe set, or even RAID0+1 (or the more flexible and resilient
RAID 1+0).  Then on top of that you have your actual volumes, which
provide the block devices to build the file systems on.

In my case, I setup some PVs (a pair of disks), then made a pair of
VGs, then a pair of LVs per VG, and then I used those LVs to create a
pair of MD devices, upon which I put my ext3 filesystems.

Now I think I need to go back and invert the model, where instead I
take the two disks, mirror them, then build my VGs, LVs and
filesystems up from there.  Which is mostly a pain, and mostly not how
I think it should be done.  

time for more research in EVMS and DM and how they can work together
under the 2.4.22+ and 2.6.0-test8+ kernels.  

I'd love to see more of a discussion on this.  I've read the EVMs web
site, but it's poorly written and doesn't do a good job of explaining
the basics and how they layer together, which is a shame since it
looks like a fairly flexible model to manage block devices.

Since really, all most people want is a way to grow/shrink their file
systems, and spread them across multiple physical disks in various
flavors of RAID 0, RAID 1 and RAID 5.  I'll ignore the RAID 3 & 4,
since they are just variations on a theme.

John
   John Stoffel - Senior Unix Systems Administrator - Lucent Technologies
	 stoffel@lucent.com - http://www.lucent.com - 978-952-7548
