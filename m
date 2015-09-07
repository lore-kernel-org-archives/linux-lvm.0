Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Chris Webb <chris@arachsys.com>
In-Reply-To: <55ED8DC0.40302@redhat.com>
Date: Mon, 7 Sep 2015 14:44:18 +0100
Content-Transfer-Encoding: 7bit
Message-Id: <B5E3ACA3-D8D1-49F5-A195-EE2345F4B79A@arachsys.com>
References: <C3D2E832-AC9D-40DA-9DB9-D70B4F716894@arachsys.com>
	<55ED3D10.4070203@redhat.com> <55ED77AA.7030708@redhat.com>
	<5012B517-1C69-427E-8BF5-9C35F48F40C5@arachsys.com>
	<55ED8DC0.40302@redhat.com>
Subject: Re: [linux-lvm] devices.filter changed behaviour in 80ac8f37d6
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: Richard Davies <richard.davies@elastichosts.com>, LVM general discussion and development <linux-lvm@redhat.com>

Peter Rajnoha <prajnoha@redhat.com> wrote:

> Yes, without lvmetad daemon, each LVM command needs to run full device
> scan at its start to look for PVs and then when a PV is found, it needs
> to read all LVM metadata it finds (and check for consistency etc etc).
> Of course, not including those devices which are filtered out.
>
> However, with lvmetad, you can save some disk access here since all the
> metadata are taken from lvmetad cache...
>
> Lvmetad doesn't have any extra deps except what lvm binary already has.

Sounds like a clear performance win for us. I'll have a play.

> If you're not using udev to handle kernel uevents (hmm, what are you using
> then?)

Nothing particularly clever or interesting I'm afraid: just a very trivial  
daemon which translates events from a NETLINK_KOBJECT_UEVENT socket into a  
continuous blocking stream.

   https://github.com/arachsys/init/blob/master/uevent.c

This is then consumed by a simple read loop to implement the handful of  
rules we actually want.

It'd be easy to add pvscan --cache when the relevant devices appear or  
disappear. Thanks for the pointer.

(I note from the pvscan(8) man page that global_filter applies to pvscan  
--cache but not standard filter, which sounds like another good reason to  
switch to global_filter!)

Cheers,

Chris.
