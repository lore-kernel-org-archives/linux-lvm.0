Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iADF5Cr28600
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 10:05:12 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iADF58Xk008775
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 10:05:08 -0500
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CSzSd-0002PK-00
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 16:05:07 +0100
Received: from triangulo.it.uc3m.es ([163.117.139.109])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 16:05:07 +0100
Received: from ptb by triangulo.it.uc3m.es with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 16:05:07 +0100
From: Peter T. Breuer <ptb@lab.it.uc3m.es>
Date: Sat, 13 Nov 2004 16:04:48 +0100
Message-ID: <gdkh62-v6l.ln1@news.it.uc3m.es>
References: <89af10f90411130217467c439@mail.gmail.com>
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com>
	<72dh62-4om.ln1@news.it.uc3m.es>
	<E1CSy6Y-0006qh-00@mta2.cl.cam.ac.uk>
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

Piete Brooks <Piete.Brooks@cl.cam.ac.uk> wrote:
> > (please do not top post - fixing. Please take note!)
> (what's "top post"ing?)

The opposite of bottom posting, neither of which being apposite, let us
skip over the discussion of.

> >> ok so, i also do know, its performance is going to suck ! 
> > No, it'll be fine - merely a couple or more times slower at writing
> > large streams.
> 
> Actually, over 4 times :-(

Hi Piete! It's getting on for 20 years since you wrote me a ptty
straight off, without looking anything up, while sitting at the console
in the lab in cam. No - it won't be. He's just writing to memory in
general and he'll get the ack as fast as he usually does from that.
True, the writes will take longer to complete their whole journey to
disk, but that's way after he's gone home and had supper.  He talks to
buffers in the VMS, not the driver.

> He has a 4 way mirror on hdd.
> As well as having to send all date over the (same!) IDE bus 4 times,
> the disk head keeps having to move between the 4 partitions :-(

Yeah, I know. But he won't notice, so long as he uses the device
"normally". As soon as he starts streaming to it and placing it under
write pressure, and memory fills up and the VMS goes sync (see
bdflush settings), THEN he'll notice, but not in normal use, if what is
normal is what I think it is. Writes are async to the user.

> > What's silly is that there's no point in doing it
> 
> Not true -- there is little point.
> 
> It will protect against un-re-vectored block faults.

Yes, if his disk doesn't swap them in automatically on write (or he
runs out of spares and it does). On read I'm not sure what will happen.
I suppose he'll get a crc error and a fail from the read attempt, and
then the partition will fault out of the array, and with luck the
driver will retry on another partition. But I'm not sure from memory
of the code if it DOES the retry. Common sense wuld say that the code
for that has to be there, but I don't recall it.


> > you get no protection against the disk disappearing
> 
> Indeed -- which is the real use for RAID1 ...
> 
> > It's like making 3 sets of spare housekeys, and then putting them all
> > in the same keyholder as the original set, and walking around like that.
> 
> Which has *some* use if the keys are made of very soft metal and "wear out".

:-). Unfortunately he insists on using ALL the keys every time, out of
a sense of completeness, so they ALL wear at the same rate.

He can win only on read, which is faster if he is lucky or does it right
(uh, he won't - he only wins if he can do two reads at once, and he
can't, since it's all the same disk) and may be less wearing. Yes, it
is less wearing on read, since the frequency of reading any particular
part of the disk is only 1/4 of what it normally would be.

> [ His actual problem was that he didn't realise that mkraid is brain dead, and 
> needs a chunk size in /etc/raidtab, even when it's not used!  I showed him how 
> to use mdadm, and it worked ]

Good! Yes, I think I recall that.  Thanks very much for your
intercession :-).


Peter
