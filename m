Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAEI5Fr04563
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 13:05:15 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAEI59AA010561
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 13:05:09 -0500
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CTOkO-0000FG-00
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 19:05:08 +0100
Received: from triangulo.it.uc3m.es ([163.117.139.109])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 19:05:08 +0100
Received: from ptb by triangulo.it.uc3m.es with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 19:05:08 +0100
From: Peter T. Breuer <ptb@lab.it.uc3m.es>
Date: Sun, 14 Nov 2004 19:04:10 +0100
Message-ID: <q9jk62-oik.ln1@news.it.uc3m.es>
References: <89af10f90411130217467c439@mail.gmail.com>
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com>
	<20041113211324.GA13108@dragonhold.org>
	<87f94c37041113140053f493b0@mail.gmail.com>
	<89af10f904111321441f2a3a1e@mail.gmail.com>
	<04sj62-uei.ln1@news.it.uc3m.es>
	<89af10f90411140941260b4b4b@mail.gmail.com>
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
> ok , here is what ive done ...

How about you ceasing top posting in favour of posting comprehensibly.
I've asked several times, no? It's extremely irritating - I'll do my
best to fix this post, again ... (it takes work!)
 
> On Sun, 14 Nov 2004 12:28:32 +0100, Peter T. Breuer <ptb@lab.it.uc3m.es> wrote:
> > ashwin chaugule <ashwin.chaugule@gmail.com> wrote:
> > > I've also managed to hack into the kernel IDE susbsys. (ide-disk.c) to
> > > duplicate the writes and reads for this particular disk.
> > 
> > It's extremely unlikely you got this right. Recall that the driver has
> > to work when out of memory, and that if you generate another write
> > request like the request you received, then you will need another
> > request struct and another bh struct for each one in the original. You
> > also have to point them at the buffers in the original request, and
> > make sue that the original request's end_bh (end_bio :) functions do
> > not free the original buffers, but wait till your extra request has
> > completed too. Those structs take memory, and have to come from
> > somewhere.

> for my particular disk : when there's a write request, I duplicate the
> req struct first(using kmalloc ),

Request structs come from a kernel pool. You make them by simply
submitting buffer heads to the kernel (submit_bh, make_request, etc.).
The kernel will aggregate buffer heads submitted as it thinks fit into
request structures, which it will send to the appropriate device queue.

You should not be making your own request struct, because it may
accidently be grabbed by the kernel mechanisms that assemble and
disassemble these, and then There Will Be Tears.


> call a function to put in custom
> values into the respective registers ( LBA format) using 'block' .

Registers?  What registers? Do you mean "fields"?

> Then I set the interupt handler to a custom routine, where it will put
> the correct desired LBA addr into the IDE_DATA_REG ( by calling
> ata_output_data) ...

This sounds like stuff you do in the driver , on receipt of your special
request.  Is that so and how do you recognize it

> after which without calling end_request i let the
> _original_ request struct do its thing , by calling the default
> interrupt handler which later calls an end_request.

Default interrupt handler? What? Are you talking about end_io? Your
driver will call end_request on a request (which will call end_io
on its buffer heads) when it thinks the request has been handled by the
device.



> That way , on one knows(or atleast i hope)  that i've performed a
> duplicate write. Ive verified this, the file gets duplicated.

It sounds to me that when you receive a request at very low level in
the driver, you change certain offsets that affect the handling of the
request, then change them back, and that way catch the original request
too. I am unclear as to whether you duplicate requests and submit them
twice to the driver queue, or whether you only have one request hit the
driver and when it hits you simply treat it twice, having
copied its structure for safety. I think the latter.

How do you get the requests to the driver, ensure that treatment of
your clones occurs when you think it does, etc?

> BUT ! for some unknown reason, when I unmount the partition , it hangs ! 

Probably because some stuff is returned to kernel pools and messes them
up completely.

> Why would this be happening ? Why should the filesystem be affected,

Because your code, like your description, is an uncontrolled mess,
probably.

> if it doesnt even know that i've performed a duplicate write !

Nobody knows anything.

Puhleeeeze. Please just use raid.



Peter
