Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4ADshoq029813
	for <linux-lvm@redhat.com>; Thu, 10 May 2007 09:54:43 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.242])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4ADsMTc002742
	for <linux-lvm@redhat.com>; Thu, 10 May 2007 09:54:42 -0400
Received: by an-out-0708.google.com with SMTP id b33so149028ana
	for <linux-lvm@redhat.com>; Thu, 10 May 2007 06:54:42 -0700 (PDT)
Message-ID: <55c223960705100654m36b559cckada97fccb09a42ac@mail.gmail.com>
Date: Thu, 10 May 2007 14:54:39 +0100
From: "Alex Owen" <r.alex.owen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Should I expect snapshot origin LV's to be 10x slower?
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
To: linux-lvm@redhat.com

Hello,
I have just been making some snapshot performance benchmarks on a
Debian Etch system.
Kernel:  2.6.18-4-686 (2.6.18.dfsg.1-12etch1)
dmsetup: 1.02.08-1
lvm2: 2.02.06-4

I have been using commands of the form:
  time dd if=/dev/zero of=/dev/volgroup/test bs=1M count=100
to get speeds for copying to a LVM device both WITH and WITHOUT a
single snapshot.

It seems that writes take >=10 times longer the first time a newly
snapshot origin device is written to.

I was expecting somthing like a 2x or 3x performance loss as 1
physical read and 2 physical writes must occur for a single logical
write. I was NOT expecting there to be a 10x overhead. As I move to
larger devices (bs=1M count=1000) the 10x figure rises to nearer 20x.
This is also true on mounted origin LV's.

Has anyone else benchmarked this? Is this normal?

Thanks for any feedback
Alex Owen
