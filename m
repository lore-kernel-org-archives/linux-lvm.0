Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAEEu7pU028679
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 09:56:07 -0500
Received: from officeexchange.office.smartechcorp.net
	(exchange.office.smartechcorp.net [64.203.96.71])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAEEtuWT007398
	for <linux-lvm@redhat.com>; Fri, 14 Nov 2008 09:55:56 -0500
From: Chris Edwards <cedwards@smartechcorp.net>
Date: Fri, 14 Nov 2008 09:53:27 -0500
Message-ID: <61252CC53A97634BA52256DCF2344FBC66CA1457C7@OFFICEEXCHANGE.office.smartechcorp.net>
References: <491BF3CF.2090800@knebb.de>
	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>
	<491C019F.6060205@knebb.de>
	<361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
	<491D34F3.7030108@knebb.de>
In-Reply-To: <491D34F3.7030108@knebb.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Moving Xen LV to image and mounting the image.
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

Hello All!

I have been trying to solve a problem.  In my current scenario I created on our SAN multiple volume groups with a single logical volume on each taking the entire groups space.  I realized that I made a mistake and did not leave room for doing snapshots.  Now I am moving each of the LV's to a new single large logical group and leaving space for snap shots.  So then I realized that I could do a "dd" to an image file (example: "dd if=/dev/VolGroup00/LogVol00 of=/root/wdcdns1.img").  I was wondering if there was a way to mount this image file?  I can't seem to mount it no matter what I do.  Am I doing this correctly?

Thanks for any help!

---

Chris Edwards
