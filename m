Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l65GlFGQ007145
	for <linux-lvm@redhat.com>; Thu, 5 Jul 2007 12:47:16 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l65GlDqN030357
	for <linux-lvm@redhat.com>; Thu, 5 Jul 2007 12:47:13 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l65Gl7Bs028058
	for <linux-lvm@redhat.com>; Thu, 5 Jul 2007 12:47:07 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l65Gl7ho008716
	for <linux-lvm@redhat.com>; Thu, 5 Jul 2007 12:47:07 -0400
Date: Thu, 5 Jul 2007 12:47:07 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0707051234061.8628-100000@bmsred.bmsi.com>
Message-ID: <Pine.LNX.4.44.0707051242290.8628-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Debugging partial drive failure
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 5 Jul 2007, Stuart D. Gathman wrote:

> On Wed, 4 Jul 2007, Jim Schatzman wrote:
> 
> > I made the mistake of trying to use pvmove to move any good data from a bad
> > disk to a new identical good disk in an LV. Unfortunately, the Pvmove failed
> > in midoperation. It cannot now be aborted, presumably because of the bad
> > disk.
> 
> I wish there was a SMART command to a drive that would tell it to pretend a
> range of sectors is bad until further notice (without actually remapping said
> sectors).  This would be a great help is debugging the error handling of
> things like LVM.  In fact, maybe there already is such a feature in SMART,
> and it just isn't widely known.

This could be added to the linux disk driver.  There could be an
option for a disk module that would pretend that a range of sectors
got an I/O error from the drive.  This would allow debugging the LVM
layer.

E.g. modprobe.conf:

options mptbase debug_bad=450000-500000

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
