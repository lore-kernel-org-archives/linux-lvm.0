Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAEFiJ0r031030
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 10:44:19 -0500
Received: from officeexchange.office.smartechcorp.net
	(exchange.office.smartechcorp.net [64.203.96.71])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id mAEFi9Vh009629
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 10:44:09 -0500
From: Chris Edwards <cedwards@smartechcorp.net>
Date: Fri, 14 Nov 2008 10:44:00 -0500
Subject: RE: [linux-lvm] Moving Xen LV to image and mounting the image.
Message-ID: <61252CC53A97634BA52256DCF2344FBC66CA1457CC@OFFICEEXCHANGE.office.smartechcorp.net>
References: <491BF3CF.2090800@knebb.de>
	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>
	<491C019F.6060205@knebb.de>
	<361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
	<491D34F3.7030108@knebb.de>
	<61252CC53A97634BA52256DCF2344FBC66CA1457C7@OFFICEEXCHANGE.office.smartechcorp.net>
	<87f94c370811140735s7687cabbp78179e646b556109@mail.gmail.com>
In-Reply-To: <87f94c370811140735s7687cabbp78179e646b556109@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Here are some things I have tried with no luck...

losetup /dev/loop5 ~/wdcdns1.img
sfdisk -l /dev/loop5

Disk /dev/loop5: 606 cylinders, 255 heads, 63 sectors/track

sfdisk: ERROR: sector 0 does not have an msdos signature
 /dev/loop5: unrecognized partition table type
No partitions found
---
mount -o loop wdcdns1.img /mnt/tmp/

mount: you must specify the filesystem type
---
mount -t xfs -o loop,ro,noatime,nodev,nofsck ~/wdcdns1.img /mnt/tmp/

mount: unknown filesystem type 'xfs'
---

Thanks for your input!

---
Chris Edwards


-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Greg Freemyer
Sent: Friday, November 14, 2008 10:36 AM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Moving Xen LV to image and mounting the image.

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

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
