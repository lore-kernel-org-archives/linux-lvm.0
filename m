Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iADD0Jr09101
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 08:00:19 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iADD0HaN017663
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 08:00:18 -0500
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CSxVo-0006RA-00
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 14:00:16 +0100
Received: from triangulo.it.uc3m.es ([163.117.139.109])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 14:00:16 +0100
Received: from ptb by triangulo.it.uc3m.es with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 14:00:16 +0100
From: Peter T. Breuer <ptb@lab.it.uc3m.es>
Date: Sat, 13 Nov 2004 13:59:19 +0100
Message-ID: <72dh62-4om.ln1@news.it.uc3m.es>
References: <89af10f90411130217467c439@mail.gmail.com>
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: raid 1 on a single disk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

ashwin chaugule <ashwin.chaugule@gmail.com> wrote:

(please do not top post - fixing. Please take note!)

> > > Is this correct if I want data to be mirrored across all 4 partitions
> > > , using RAID 1 on a single disk ?
> > 
> > So, you are talking about a mirror with 4 components, all of them
> > partitions on the same disk?
> > 
> > Well, that's silly, but nothing stops you doing it. Just maek a raidtab
> > for the mirror and name the partitions as raid-disk components there.
> > The RAID howto or faq should tell you all you need to know, as should
> > the mananpage for the conf file or mdadm, or whatever ...

> ok so, i also do know, its performance is going to suck !

No, it'll be fine - merely a couple or more times slower at writing
large streams. In ordinary use you may sometimes see more latency, but 
provided you aren't streaming or running synchronous writes, you
shouldn't notice. What's silly is that there's no point in doing it -
you get no protection against the disk disappearing, because all the
mirror components are on the same disk.

It's like making 3 sets of spare housekeys, and then putting them all
in the same keyholder as the original set, and walking around like that.

Silly, no?

> but i was under the impression that RAID 1 works on more that one disks only.

I don't understand you. While a mirror with only one component is
trivial, it is a mirror.

> so you mean to say that, the linux RAID / md tools support raid 1 on
> multiple partitiions of the same disk ?

Nobody cares where the mirror components are physically sited except
you.  Why should any tool care?  Its job is to do what you say.  I don't
understand why you should think that the tool would even know (well,
there is a chance that it could look and check, but I don't recall any
significant code in the driver dedicated to optimizations based on that).

Peter
