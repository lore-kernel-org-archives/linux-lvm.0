Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAEFZwEK025539
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 10:35:58 -0500
Received: from qw-out-2122.google.com (qw-out-2122.google.com [74.125.92.27])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAEFZgRl003041
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 10:35:43 -0500
Received: by qw-out-2122.google.com with SMTP id 3so814126qwe.39
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 07:35:42 -0800 (PST)
Message-ID: <87f94c370811140735s7687cabbp78179e646b556109@mail.gmail.com>
Date: Fri, 14 Nov 2008 10:35:41 -0500
From: "Greg Freemyer" <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] Moving Xen LV to image and mounting the image.
In-Reply-To: <61252CC53A97634BA52256DCF2344FBC66CA1457C7@OFFICEEXCHANGE.office.smartechcorp.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <491BF3CF.2090800@knebb.de>
	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>
	<491C019F.6060205@knebb.de>
	<361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
	<491D34F3.7030108@knebb.de>
	<61252CC53A97634BA52256DCF2344FBC66CA1457C7@OFFICEEXCHANGE.office.smartechcorp.net>
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

On Fri, Nov 14, 2008 at 9:53 AM, Chris Edwards
<cedwards@smartechcorp.net> wrote:
> Hello All!
>
> I have been trying to solve a problem.  In my current scenario I created on our SAN multiple volume groups with a single logical volume on each taking the entire groups space.  I realized that I made a mistake and did not leave room for doing snapshots.  Now I am moving each of the LV's to a new single large logical group and leaving space for snap shots.  So then I realized that I could do a "dd" to an image file (example: "dd if=/dev/VolGroup00/LogVol00 of=/root/wdcdns1.img").  I was wondering if there was a way to mount this image file?  I can't seem to mount it no matter what I do.  Am I doing this correctly?
>

Chris,

I don't remember the details exactly, but I've done this before.

You tried mounting it loopback, right?

ie.  mount -t xfs -o loop,ro,noatime,nodev,nofsck somesystem.img /image

If that fails, it may be because you imaged it with it mounted.  If
so, you will may need to apply any outstanding journal entries to get
it to mount.

Greg
-- 
Greg Freemyer
Litigation Triage Solutions Specialist
http://www.linkedin.com/in/gregfreemyer
First 99 Days Litigation White Paper -
http://www.norcrossgroup.com/forms/whitepapers/99%20Days%20whitepaper.pdf

The Norcross Group
The Intersection of Evidence & Technology
http://www.norcrossgroup.com
