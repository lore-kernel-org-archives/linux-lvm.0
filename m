Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAE5iLr24826
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 00:44:21 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.202])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAE5iKuP026275
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2004 00:44:21 -0500
Received: by rproxy.gmail.com with SMTP id f1so435879rne
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 21:44:20 -0800 (PST)
Message-ID: <89af10f904111321441f2a3a1e@mail.gmail.com>
Date: Sun, 14 Nov 2004 11:14:20 +0530
From: ashwin chaugule <ashwin.chaugule@gmail.com>
Subject: Re: [linux-lvm] Re: raid 1 on a single disk
In-Reply-To: <87f94c37041113140053f493b0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <89af10f90411130217467c439@mail.gmail.com>
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com>
	<20041113211324.GA13108@dragonhold.org>
	<87f94c37041113140053f493b0@mail.gmail.com>
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
To: Greg Freemyer <greg.freemyer@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

There Greg ! , you got it right !
The media onto which the data will be stored is a small device, that
functions like a hdd,
this endeavour was just for a proof of concept.

I've also managed to hack into the kernel IDE susbsys. (ide-disk.c) to
duplicate the writes and reads for this particular disk.

So now I have two options for them.

RAID 1 is useful here (although its on one disk) because , data will
not be written / read _very_ often to/from the device. And in the
event that the media is flaky, will provide like a backup. The other
benefit is, I dont have to worry about the i/o errors (or any other
for that matter) while reading the contents back, the best copy
*should* be picked up by the md subsys itself.

However, in my driver (modified IDE) I have to take care of the writes
and reads individualy.
The advantage here is that, i dont need to make 4 partitions of the
disk, one is good enough, and the remaining can be unallocated. I make
the write at fixed offsets into the unallocated space, and when read
is requested, I read em one by one, and check.

So, there.


On Sat, 13 Nov 2004 17:00:35 -0500, Greg Freemyer
<greg.freemyer@gmail.com> wrote:
> >
> > P.S. I'd be really tempted to talk to the person asking you to do this, and ask them what they hope to achieve...
> > 
> I can almost envision times it would be useful.  i.e. disk speed is
> unimportand, disk data rarely changes, but when it does it is very
> important, and traditional backups are not feasible for some unknown
> reason?
> 
> By having the data written to 2 different places on the disk, the
> likelyhood of a failure making it  truly unrecoverable is extremely
> small.
> 
> ie. If you have disk media problems, likely only one location of the
> other will be affected.
> 
> If you have a drive electronics failure, you can ship the drive off to
> have recovery performed.  (Over $1000 I know, but if the data is
> important.)
> 
> Greg
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
