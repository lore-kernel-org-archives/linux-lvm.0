Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAEL5Vr05103
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 16:05:31 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAEL5Ou5006818
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 16:05:25 -0500
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CTRYl-0000c1-00
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 22:05:19 +0100
Received: from triangulo.it.uc3m.es ([163.117.139.109])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 22:05:19 +0100
Received: from ptb by triangulo.it.uc3m.es with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 22:05:19 +0100
From: Peter T. Breuer <ptb@lab.it.uc3m.es>
Date: Sun, 14 Nov 2004 22:01:14 +0100
Message-ID: <qltk62-hg2.ln1@news.it.uc3m.es>
References: <89af10f90411130217467c439@mail.gmail.com>
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com>
	<20041113211324.GA13108@dragonhold.org>
	<87f94c37041113140053f493b0@mail.gmail.com>
	<89af10f904111321441f2a3a1e@mail.gmail.com>
	<04sj62-uei.ln1@news.it.uc3m.es>
	<89af10f90411140941260b4b4b@mail.gmail.com>
	<q9jk62-oik.ln1@news.it.uc3m.es>
	<89af10f904111411023d1169bc@mail.gmail.com>
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
> >Registers?  What registers? Do you mean "fields"?
> 
> yes i mean fields, my bad.

Fields of the request struct, and its buffer head structs, in other
words?  Or fields in the struct that provides your device state
description (or real registers in the device!)!

> >This sounds like stuff you do in the driver , on receipt of your special
> >request.  Is that so and how do you recognize it
> 
> by checking the MAJOR and MINOR num of my disk !!!!! ?

But how do you recognise YOUR request, the one you made?  Are you saying
that you invent a special minor number to use in it?

> >Default interrupt handler? 
> 
> remember i said , i set a different intr. handler if its my disk !? 

I think that what you are saying is that you have a standard 
device driver that handles a whole class of devices, over several
majors, and that you have subverted it to use your driver instead as
a special "personality" if requests arrive for a particular major and minor.

Well, the normal thing to do would be to simply register your driver
for the major and minor. But I guess  you could also do the
"extra personality of existing driver" trick. 


> well, after its handled there, i dont call end_request , simple.
> eg.
> mult_write is the default intr. handler for multiple writes ?
> i set mult_write_withoutend as the handler, then after the handling is
> done , i again set
> mult_write as the handler.... this will call the end_request.

But how do you know you have handled your request? As opposed to a
request somebody else has sent?

> >or whether you only have one request hit the
> >driver and when it hits you simply treat it twice
> 
> bingo !

OK - that is different. It means you never have to worry about
recognizing YOUR request, becuae YOUR request never hits the driver. It
is simply a copy you maintain for reference purposes.

> >Probably because some stuff is returned to kernel pools and messes them
> >up completely.
> 
> what stuff ? im not returning anything to any queue whatsoever !

When you run end_io you are!

> 
> >Because your code, like your description, is an uncontrolled mess,
> >probably.
> 
> about the code .. umm , maybe not , coz the write is duplicated alright ..
> my description , a mess ?... nope , what im doing is really simple ,

Then I suggest you attempt to describe what you are doing. The above
fails!

> as i stated in the very first mail , im doing something similar to
> RAID 1 !! , what s so hard to understand in that ?

Because Raid1 does it, and it does not do what you described.

RAID1, as *I* described, when it gets a write request, looks at all the
buffer heads.  For each buffer head it makes a master raid buffer head
of its own design and links a pair of new buffer heads into it.  It gets
the master and the buffer heads from a private pool, as I recall, to
avoid running out of memory.  The new buffer heads point into the same
buffers as the originals, but point them at different devices.  It's
careful to increment reference counts to stop the buffers vanishing.  It
then submits the buffer heads in the normal way with make request,
having first replaced their end_io functions with dummies that only
decrement a count in the raid master buffer head.  The dummy that zeros
te count is the last to run and it then goes and returns the buffer head
structs to the pool, and kills the master buffer head, and runs the
original end_io's for the original request, telling the user that all
is OK.


> I also said , why im continuing with the IDE modifications inspite of
> the RAID 1 drivers.

I must have not noticed.

> However, in my driver (modified IDE) I have to take care of the writes
> and reads individualy.
> The advantage here is that, i dont need to make 4 partitions of the
> disk, one is good enough, and the remaining can be unallocated. I make

That is not an advantage. It is a disadvantage. Now somebody can 
write partitions in your "free space". ANd now you can't check them
individually in case you need to.

> the write at fixed offsets into the unallocated space, and when read
> is requested, I read em one by one, and check.

What on earth!

> So now ( after im done with the read requests ) i have two options for them...
> RAID 1 and the modified the IDE driver.

If you don't know why the drievr cannot work, then you can be sure it
doesn't, because it won't.  Try streaming data to it.  You should get a
lock up.

Peter
