Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAEBUKr05642
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 06:30:20 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAEBUCK8015101
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 06:30:13 -0500
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CTIaB-0007Op-00
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 12:30:11 +0100
Received: from triangulo.it.uc3m.es ([163.117.139.109])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 12:30:11 +0100
Received: from ptb by triangulo.it.uc3m.es with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 12:30:11 +0100
From: Peter T. Breuer <ptb@lab.it.uc3m.es>
Date: Sun, 14 Nov 2004 12:28:32 +0100
Message-ID: <04sj62-uei.ln1@news.it.uc3m.es>
References: <89af10f90411130217467c439@mail.gmail.com>
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com>
	<20041113211324.GA13108@dragonhold.org>
	<87f94c37041113140053f493b0@mail.gmail.com>
	<89af10f904111321441f2a3a1e@mail.gmail.com>
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
> I've also managed to hack into the kernel IDE susbsys. (ide-disk.c) to
> duplicate the writes and reads for this particular disk.

It's extremely unlikely you got this right. Recall that the driver has
to work when out of memory, and that if you generate another write
request like the request you received, then you will need another
request struct and another bh struct for each one in the original. You
also have to point them at the buffers in the original request, and
make sue that the original request's end_bh (end_bio :) functions do
not free the original buffers, but wait till your extra request has
completed too. Those structs take memory, and have to come from
somewhere.

In other words, you have to do what the raid1 driver does. Maintain a
local pool.

Note that the raid1 driver chooses to be synchronous on write, that is
not ack your original request until all the copies have finished. It
has to do that because it can't mark sections of the target as out of
date on disk, so it has to complete all writes while the knowledge
that it has to is still in memory. It can't pick up later and complete
them. You may wish to improve that (the FR1 driver, mine, at
fr1.sf.net, can also go async on write if you want it to).

> RAID 1 is useful here (although its on one disk) because , data will
> not be written / read _very_ often to/from the device. And in the
> event that the media is flaky, will provide like a backup. The other

Provided that you know WHICH of the copies is right :-).

> benefit is, I dont have to worry about the i/o errors (or any other
> for that matter) while reading the contents back, the best copy
> *should* be picked up by the md subsys itself.

Best? 

Peter
