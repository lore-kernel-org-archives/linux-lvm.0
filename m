Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAEJ2sr16720
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 14:02:54 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.207])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAEJ2sFw021640
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 14:02:54 -0500
Received: by rproxy.gmail.com with SMTP id f1so476702rne
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 11:02:53 -0800 (PST)
Message-ID: <89af10f904111411023d1169bc@mail.gmail.com>
Date: Mon, 15 Nov 2004 00:32:53 +0530
From: ashwin chaugule <ashwin.chaugule@gmail.com>
Subject: Re: [linux-lvm] Re: raid 1 on a single disk
In-Reply-To: <q9jk62-oik.ln1@news.it.uc3m.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <89af10f90411130217467c439@mail.gmail.com>
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com>
	<20041113211324.GA13108@dragonhold.org>
	<87f94c37041113140053f493b0@mail.gmail.com>
	<89af10f904111321441f2a3a1e@mail.gmail.com>
	<04sj62-uei.ln1@news.it.uc3m.es>
	<89af10f90411140941260b4b4b@mail.gmail.com>
	<q9jk62-oik.ln1@news.it.uc3m.es>
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

>Because your code, like your description, is an uncontrolled mess,
>probably.

WHAT !!!!!

>Registers?  What registers? Do you mean "fields"?

yes i mean fields, my bad.


>This sounds like stuff you do in the driver , on receipt of your special
>request.  Is that so and how do you recognize it

by checking the MAJOR and MINOR num of my disk !!!!! ?

>Default interrupt handler? 

remember i said , i set a different intr. handler if its my disk !? 
well, after its handled there, i dont call end_request , simple.
eg.
mult_write is the default intr. handler for multiple writes ?
i set mult_write_withoutend as the handler, then after the handling is
done , i again set
mult_write as the handler.... this will call the end_request.

>or whether you only have one request hit the
>driver and when it hits you simply treat it twice

bingo !

>Probably because some stuff is returned to kernel pools and messes them
>up completely.

what stuff ? im not returning anything to any queue whatsoever !

>Because your code, like your description, is an uncontrolled mess,
>probably.

about the code .. umm , maybe not , coz the write is duplicated alright ..
my description , a mess ?... nope , what im doing is really simple ,
as i stated in the very first mail , im doing something similar to
RAID 1 !! , what s so hard to understand in that ?
I also said , why im continuing with the IDE modifications inspite of
the RAID 1 drivers.


--snipped--

However, in my driver (modified IDE) I have to take care of the writes
and reads individualy.
The advantage here is that, i dont need to make 4 partitions of the
disk, one is good enough, and the remaining can be unallocated. I make
the write at fixed offsets into the unallocated space, and when read
is requested, I read em one by one, and check.

--snipped--

So now ( after im done with the read requests ) i have two options for them...
RAID 1 and the modified the IDE driver.

Ashwin
