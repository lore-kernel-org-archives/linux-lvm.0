Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4AIaJOD003387
	for <linux-lvm@redhat.com>; Thu, 10 May 2007 14:36:19 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.240])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4AIaH7Q020609
	for <linux-lvm@redhat.com>; Thu, 10 May 2007 14:36:18 -0400
Received: by an-out-0708.google.com with SMTP id b33so176287ana
	for <linux-lvm@redhat.com>; Thu, 10 May 2007 11:36:17 -0700 (PDT)
Subject: Re: [linux-lvm] Should I expect snapshot origin LV's to be 10x slower?
From: Ming Zhang <blackmagic02881@gmail.com>
In-Reply-To: <87f94c370705100733o2d6fb499q8370f801c6833b42@mail.gmail.com>
References: <55c223960705100654m36b559cckada97fccb09a42ac@mail.gmail.com>
	<87f94c370705100733o2d6fb499q8370f801c6833b42@mail.gmail.com>
Date: Thu, 10 May 2007 14:36:13 -0400
Message-Id: <1178822173.3869.53.camel@dhcp-136.ibrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: blackmagic02881@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
> >   time dd if=/dev/zero of=/dev/volgroup/test bs=1M count=100
> > to get speeds for copying to a LVM device both WITH and WITHOUT a
> > single snapshot.
> >
> > It seems that writes take >=10 times longer the first time a newly
> > snapshot origin device is written to.
> >
> > I was expecting somthing like a 2x or 3x performance loss as 1
> > physical read and 2 physical writes must occur for a single logical
> > write. I was NOT expecting there to be a 10x overhead. As I move to
> > larger devices (bs=1M count=1000) the 10x figure rises to nearer 20x.
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
> (FYI: It has been a while since I benchmarked, so you may still have problems.)
> 
> Greg
