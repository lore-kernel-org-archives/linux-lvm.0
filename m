Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAF69Vr28550
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 01:09:31 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.204])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAF69NxF028483
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 01:09:23 -0500
Received: by rproxy.gmail.com with SMTP id f1so534707rne
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 22:09:21 -0800 (PST)
Message-ID: <89af10f904111422096bed519e@mail.gmail.com>
Date: Mon, 15 Nov 2004 11:39:20 +0530
From: ashwin chaugule <ashwin.chaugule@gmail.com>
Subject: Re: [linux-lvm] Re: raid 1 on a single disk
In-Reply-To: <qltk62-hg2.ln1@news.it.uc3m.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <89af10f90411130217467c439@mail.gmail.com>
	<89af10f90411130241e20e2c2@mail.gmail.com>
	<20041113211324.GA13108@dragonhold.org>
	<87f94c37041113140053f493b0@mail.gmail.com>
	<89af10f904111321441f2a3a1e@mail.gmail.com>
	<04sj62-uei.ln1@news.it.uc3m.es>
	<89af10f90411140941260b4b4b@mail.gmail.com>
	<q9jk62-oik.ln1@news.it.uc3m.es>
	<89af10f904111411023d1169bc@mail.gmail.com>
	<qltk62-hg2.ln1@news.it.uc3m.es>
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

>Then I suggest you attempt to describe what you are doing. The above
>fails!

Its really simple .. dont know why you cant comprehend it.

Hope you understand from the code ... 

in __do_rw_disk

if(MINOR(rq->rq_dev)==69 && rq->cmd==WRITE){
                rq1 = duplicate_request(rq);
                drive->rq=rq1;
        }

where duplicate_request , is a simple kmalloc and memcpy of rq.

rq1 is going to be our duplicate request.

then ....

if(MINOR(rq->rq_dev)==69 && rq->cmd==WRITE)
                        {
                                block_copy = block;
                                get_address(drive,rq1,block);
                        }
else {
                        hwif->OUTB(0x00, IDE_FEATURE_REG);
                        hwif->OUTB(nsectors.b.low, IDE_NSECTOR_REG);
                        hwif->OUTB(block, IDE_SECTOR_REG);
                        hwif->OUTB(block>>=8, IDE_LCYL_REG);
                        hwif->OUTB(block>>=8, IDE_HCYL_REG);
                       
hwif->OUTB(((block>>8)&0x0f)|drive->select.all,IDE_SELECT_REG);
      }
where get_address will do a block=block + (drive->capacity / 2);
and refill all the above registers.

then 

when its a (non DMA) WRITE ...

if(MINOR(rq->rq_dev)==69 && rq->cmd==WRITE)
                                hwgroup->wrq = *rq1; /* scratchpad */
                        else
                                hwgroup->wrq = *rq; /* scratchpad */


then ...

if(MINOR(rq->rq_dev)==69 && rq->cmd==WRITE){
                                rq1->q->queuedata=(void *)rq;

//queuedata is an unused ptr. so it stores the original rq.

                        ide_set_handler(drive,
&multwrite_intr_withoutend, WAIT_CMD, NULL);
                        }
                        else
                        ide_set_handler(drive, &multwrite_intr, WAIT_CMD, NULL);

where ... multiwrite_intr_withoutend is my custom handler ...


now in multiwrite_withoutend

if (rq->nr_sectors) {
                     if (ide_multwrite(drive, drive->mult_count))
                                 return ide_stopped;
                        ide_set_handler(drive,
&multwrite_intr_withoutend, WAIT_CMD, NULL);
                               return ide_started;
                      else

                                ndelay(400);
                                HWGROUP(drive)->handler=0;
                                kfree(drive->rq);
                                drive->rq=(struct request
*)(drive->rq->q->queuedata);
                                hwgroup->wrq = *(drive->rq); /* scratchpad */
                                restore_original_condition(drive);
                                command = ((drive->mult_count) ?
                                ((lba48) ? WIN_MULTWRITE_EXT : WIN_MULTWRITE) :
                                ((lba48) ? WIN_WRITE_EXT : WIN_WRITE));
                                hwif->OUTB(command, IDE_COMMAND_REG);
-snip-
                              ide_set_handler(drive, &multwrite_intr,
WAIT_CMD, NULL);

 etc etc
this is where , i reset the original condition , and set the handler back...
so the original request is completed.

... So you see that , when there's a write request coming to my disk , 

1) duplicate the req.
2) set the handler 
3) perform the write
4) DO NOT call end_request ... so no end_io
5) after its done , restore original condition
6) let it do its thing

Why wont it unmount ?

Ashwin
