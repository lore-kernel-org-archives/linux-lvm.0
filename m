Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAEHfpr31569
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 12:41:51 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.198])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAEHfZNv006511
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 12:41:45 -0500
Received: by rproxy.gmail.com with SMTP id f1so470256rne
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 09:41:30 -0800 (PST)
Message-ID: <89af10f90411140941260b4b4b@mail.gmail.com>
Date: Sun, 14 Nov 2004 23:11:30 +0530
From: ashwin chaugule <ashwin.chaugule@gmail.com>
Subject: Re: [linux-lvm] Re: raid 1 on a single disk
In-Reply-To: <04sj62-uei.ln1@news.it.uc3m.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <89af10f90411130217467c439@mail.gmail.com>
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com>
	<20041113211324.GA13108@dragonhold.org>
	<87f94c37041113140053f493b0@mail.gmail.com>
	<89af10f904111321441f2a3a1e@mail.gmail.com>
	<04sj62-uei.ln1@news.it.uc3m.es>
Reply-To: ashwin chaugule <ashwin.chaugule@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

ok , here is what ive done ...

for my particular disk : when there's a write request, I duplicate the
req struct first(using kmalloc ), call a function to put in custom
values into the respective registers ( LBA format) using 'block' .
Then I set the interupt handler to a custom routine, where it will put
the correct desired LBA addr into the IDE_DATA_REG ( by calling
ata_output_data) ... after which without calling end_request i let the
_original_ request struct do its thing , by calling the default
interrupt handler which later calls an end_request.

That way , on one knows(or atleast i hope)  that i've performed a
duplicate write. Ive verified this, the file gets duplicated.

BUT ! for some unknown reason, when I unmount the partition , it hangs ! 

Why would this be happening ? Why should the filesystem be affected,
if it doesnt even know that i've performed a duplicate write !

Im still working on the read requests...



On Sun, 14 Nov 2004 12:28:32 +0100, Peter T. Breuer <ptb@lab.it.uc3m.es> wrote:
> ashwin chaugule <ashwin.chaugule@gmail.com> wrote:
> > I've also managed to hack into the kernel IDE susbsys. (ide-disk.c) to
> > duplicate the writes and reads for this particular disk.
> 
> It's extremely unlikely you got this right. Recall that the driver has
> to work when out of memory, and that if you generate another write
> request like the request you received, then you will need another
> request struct and another bh struct for each one in the original. You
> also have to point them at the buffers in the original request, and
> make sue that the original request's end_bh (end_bio :) functions do
> not free the original buffers, but wait till your extra request has
> completed too. Those structs take memory, and have to come from
> somewhere.
> 
> In other words, you have to do what the raid1 driver does. Maintain a
> local pool.
> 
> Note that the raid1 driver chooses to be synchronous on write, that is
> not ack your original request until all the copies have finished. It
> has to do that because it can't mark sections of the target as out of
> date on disk, so it has to complete all writes while the knowledge
> that it has to is still in memory. It can't pick up later and complete
> them. You may wish to improve that (the FR1 driver, mine, at
> fr1.sf.net, can also go async on write if you want it to).
> 
> > RAID 1 is useful here (although its on one disk) because , data will
> > not be written / read _very_ often to/from the device. And in the
> > event that the media is flaky, will provide like a backup. The other
> 
> Provided that you know WHICH of the copies is right :-).
> 
> > benefit is, I dont have to worry about the i/o errors (or any other
> > for that matter) while reading the contents back, the best copy
> > *should* be picked up by the md subsys itself.
> 
> Best?
> 
> Peter
> 
> _______________________________________________
> 
> 
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


-- 
Ashwin Chaugule
Embedded Systems Engineer
Aftek Infosys ltd.
[Embedded Division]
