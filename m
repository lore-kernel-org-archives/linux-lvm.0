Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i32IJZj19986
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 13:19:35 -0500
Received: from cs.selu.edu (cs.selu.edu [147.174.59.5])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i32IJYjj021936
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 13:19:34 -0500
Received: from cs.selu.edu (jholland@localhost [127.0.0.1])
	by cs.selu.edu (8.12.10/8.12.10) with ESMTP id i32IJSYK043833
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 12:19:28 -0600 (CST)
	(envelope-from jholland@cs.selu.edu)
Received: from localhost (jholland@localhost)
	by cs.selu.edu (8.12.10/8.12.10/Submit) with ESMTP id i32IJSew043830
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 12:19:28 -0600 (CST)
	(envelope-from jholland@cs.selu.edu)
Date: Fri, 2 Apr 2004 12:19:28 -0600 (CST)
From: Jason P Holland <jholland@cs.selu.edu>
Subject: Re: [linux-lvm] Lost Disk, any way to recover data?
In-Reply-To: <001501c418de$9303c280$0400a8c0@vector>
Message-ID: <20040402121915.O43829@cs.selu.edu>
References: <20040402114054.F43447@cs.selu.edu>
	<001501c418de$9303c280$0400a8c0@vector>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


Thanks a lot!  I'll give this a try and see what happens!

Jason

On Fri, 2 Apr 2004, Perplexer wrote:

> Hi. I think I had a similar problem myself a few days ago.
> Unfortunately there seemed to be noone willing to help me
> out so I tried various stuff myself. I'll try to help you with
> what worked for me.
>
> I couldn't mount my LV with one drive missing from the VG
> and I think there are two ways to solve this. One is to put in
> an idential drive to the one you lost, use pvcreate on it and
> restore the VGDA to it using vgcfgrestore. I myself didn't
> have a spare drive but I had a small unused partition on some
> other drive which I used instead. I used pvcreate on that
> partition and then used vgcfgrestore with the -i option which
> ignored the size mismatch between my partition and the previous
> drive that was in.
>
> I used:
>
> vgcfgrestore - vg1 -i -o /dev/hdc1 -v /dev/hdd1
>
> where hdc(1) was the old drive that died and hdd1
> was the 'fake' partition. After that I ran vgscan and
> activated the VG. That allowed me to mount the LV and
> backup the data off it. I later had to recreate the VG and
> LV but at least I saved the remaining data.
>
> I won't say that's the only or the best way to do it but
> that's all I've been able to figure out myself which worked
> and I guess it's the best suggestion you'll get around here.
>
> Good luck.
>
> ---------
> Perplexer
>
> ----- Original Message -----
> From: "Jason P Holland" <jholland@cs.selu.edu>
> To: <linux-lvm@redhat.com>
> Sent: Friday, April 02, 2004 7:43 PM
> Subject: [linux-lvm] Lost Disk, any way to recover data?
>
>
> >
> > Hello all,
> >
> > I just lost a disk in my lvm set, and was wondering if there is a way to
> > recover the data from the first disk.  I don't believe anything had been
> > written to an LE's on the second disk. Is there a way to mount the first
> > one and see if my data is still there?  Or is this a lost cause and I
> > should forget about it?  Thanks
> >
> > Jason
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
