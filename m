Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4FJX4bf016859
	for <linux-lvm@redhat.com>; Tue, 15 May 2007 15:33:04 -0400
Received: from mail.wrs.com (mail.windriver.com [147.11.1.11])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4FJWxXW020414
	for <linux-lvm@redhat.com>; Tue, 15 May 2007 15:33:00 -0400
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.wrs.com (8.13.6/8.13.6) with ESMTP id l4FJWsSP020296
	for <linux-lvm@redhat.com>; Tue, 15 May 2007 12:32:54 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Should I expect snapshot origin LV's to be 10x slower?
Date: Tue, 15 May 2007 12:32:48 -0700
Message-ID: <37B62E0F71C9E14B9859FADB1FC3E3E13891D2@ala-mail02.corp.ad.wrs.com>
In-Reply-To: <1178822173.3869.53.camel@dhcp-136.ibrix.com>
From: "Kottaridis, Chris" <chris.kottaridis@windriver.com>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

 
>by putting it into separate device, you might see a 5x slow instead of
10x. still because
>disk seek activity 
>
>do not use current snapshot on a write intense lv.
>and adjust your lv chunk size base on your application workload can
remedy it a bit.

I  am a little curious about the warning here to not use current
snapshot on a write intensive logical volume. Are you saying that if the
original volume that you are taking a snapshot of has intensive writes
that there are problems in snapshotting it ?

I have a situation where I have lots of writes going on to a lv and then
I want to make a snapshot and back it up during the storm of writes. At
the moment I seem to be able to make the snapshot and then mount it and
tar off of it what I want. I unmount it, but the the lvremove hangs. I'm
still testing things to try and narrow things down. But, are there known
issues with snapshots of volumes that are experiencing high rate of
writes ?

Thanks

Chris Kottaridis
Senior Engineer
Wind River Systems
719-522-9786

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Ming Zhang
Sent: Thursday, May 10, 2007 12:36 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Should I expect snapshot origin LV's to be 10x
slower?

On Thu, 2007-05-10 at 10:33 -0400, Greg Freemyer wrote:
> On 5/10/07, Alex Owen <r.alex.owen@gmail.com> wrote:
> > Hello,
> > I have just been making some snapshot performance benchmarks on a 
> > Debian Etch system.
> > Kernel:  2.6.18-4-686 (2.6.18.dfsg.1-12etch1)
> > dmsetup: 1.02.08-1
> > lvm2: 2.02.06-4
> >
> > I have been using commands of the form:
> >   time dd if=/dev/zero of=/dev/volgroup/test bs=1M count=100 to get 
> > speeds for copying to a LVM device both WITH and WITHOUT a single 
> > snapshot.
> >
> > It seems that writes take >=10 times longer the first time a newly 
> > snapshot origin device is written to.
> >
> > I was expecting somthing like a 2x or 3x performance loss as 1 
> > physical read and 2 physical writes must occur for a single logical 
> > write. I was NOT expecting there to be a 10x overhead. As I move to 
> > larger devices (bs=1M count=1000) the 10x figure rises to nearer
20x.
> > This is also true on mounted origin LV's.
> >
> > Has anyone else benchmarked this? Is this normal?
> >
> > Thanks for any feedback
> > Alex Owen
> 
> I always ensure my snapshots are on physically separate drives than my

> origin.  If they are on the same drive I'm not surprised you're having

> speed issues.  You are significantly increasing the amount of disk 
> seek activity.  Having in separate drives should be much better.

by putting it into separate device, you might see a 5x slow instead of
10x. still because disk seek activity 

do not use current snapshot on a write intense lv. and adjust your lv
chunk size base on your application workload can remedy it a bit.



> 
> (FYI: It has been a while since I benchmarked, so you may still have 
> problems.)
> 
> Greg

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
