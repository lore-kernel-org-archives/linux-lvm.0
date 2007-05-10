Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4AEXFvn002172
	for <linux-lvm@redhat.com>; Thu, 10 May 2007 10:33:16 -0400
Received: from ik-out-1112.google.com (ik-out-1112.google.com [66.249.90.181])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4AEXBpI012193
	for <linux-lvm@redhat.com>; Thu, 10 May 2007 10:33:12 -0400
Received: by ik-out-1112.google.com with SMTP id b35so388711ika
	for <linux-lvm@redhat.com>; Thu, 10 May 2007 07:33:11 -0700 (PDT)
Message-ID: <87f94c370705100733o2d6fb499q8370f801c6833b42@mail.gmail.com>
Date: Thu, 10 May 2007 10:33:11 -0400
From: "Greg Freemyer" <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] Should I expect snapshot origin LV's to be 10x slower?
In-Reply-To: <55c223960705100654m36b559cckada97fccb09a42ac@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <55c223960705100654m36b559cckada97fccb09a42ac@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 5/10/07, Alex Owen <r.alex.owen@gmail.com> wrote:
> Hello,
> I have just been making some snapshot performance benchmarks on a
> Debian Etch system.
> Kernel:  2.6.18-4-686 (2.6.18.dfsg.1-12etch1)
> dmsetup: 1.02.08-1
> lvm2: 2.02.06-4
>
> I have been using commands of the form:
>   time dd if=/dev/zero of=/dev/volgroup/test bs=1M count=100
> to get speeds for copying to a LVM device both WITH and WITHOUT a
> single snapshot.
>
> It seems that writes take >=10 times longer the first time a newly
> snapshot origin device is written to.
>
> I was expecting somthing like a 2x or 3x performance loss as 1
> physical read and 2 physical writes must occur for a single logical
> write. I was NOT expecting there to be a 10x overhead. As I move to
> larger devices (bs=1M count=1000) the 10x figure rises to nearer 20x.
> This is also true on mounted origin LV's.
>
> Has anyone else benchmarked this? Is this normal?
>
> Thanks for any feedback
> Alex Owen

I always ensure my snapshots are on physically separate drives than my
origin.  If they are on the same drive I'm not surprised you're having
speed issues.  You are significantly increasing the amount of disk
seek activity.  Having in separate drives should be much better.

(FYI: It has been a while since I benchmarked, so you may still have problems.)

Greg
-- 
Greg Freemyer
The Norcross Group
Forensics for the 21st Century
