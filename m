Received: from leguan.localdomain (vpn-10-90.str.redhat.com [10.32.10.90])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mASNKqY9016906
	for <linux-lvm@redhat.com>; Fri, 28 Nov 2008 18:20:53 -0500
Message-ID: <49307CD4.9010705@redhat.com>
Date: Sat, 29 Nov 2008 00:20:52 +0100
From: Jaroslav Stava <jstava@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Let's try again with the lvm mirror failure.
References: <614f37be0811281309gb115861yea65f65979e48951@mail.gmail.com>
In-Reply-To: <614f37be0811281309gb115861yea65f65979e48951@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

Gary Desrochers wrote:
> I will try one more time. Can someone please tell me if it is possible 
> to recover a mirrored drive?  If not then why are so many people using 
> mirrors out there?
Some info:
man vgreduce (see --removemissing)
man lvm (see --partial activation)

Btw. it's a good idea to state your lvm version.

> > So how do you fix up from a crashed primary mirror?
To make the VG consistent again you use "vgreduce --removemissing VG".
That will remove any LVs that were (even partially) on any missing PV.
When mirror legs are lost this way then mirror get downconverted.
You may want to use it with --test first, to see what you would loose.
(And you may try --mirrorsonly, it should fail when anything except mirror
legs would be lost. Without guarantee, depends on version.)

>
> As a second question, I know the extents and such.  Is there a way to 
> copy off the data into a non-lvm partition?  At this point I will even 
> take that.  I just want to get to the data.
Partial activation: "vgchange -ay -P". Doesn't make much sense
if you only lost a mirror leg.


Btw. when you need realtime response to your problem,
there is an irc channel #lvm on freenode (ask question and wait).

Regards,
Jaroslav Stava
