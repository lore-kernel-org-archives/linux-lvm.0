Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5HHD5032649
	for <linux-lvm@redhat.com>; Thu, 17 Jun 2004 13:13:05 -0400
Received: from home.miksis.com (ip-69-33-35-121.lax.megapath.net
	[69.33.35.121])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5HHD5e1011559
	for <linux-lvm@redhat.com>; Thu, 17 Jun 2004 13:13:05 -0400
Received: from [192.168.1.3] (unknown [192.168.1.3])
	by home.miksis.com (Postfix) with ESMTP id 7135DBD48A8
	for <linux-lvm@redhat.com>; Thu, 17 Jun 2004 10:13:04 -0700 (PDT)
Message-ID: <40D1D120.3070605@miksis.com>
Date: Thu, 17 Jun 2004 10:13:04 -0700
From: Mark Miksis <mark.nospamplease@miksis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to extend a root LVM volume?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I'm trying to extend a root LVM.  I'm using LVM2 on FC2.  Here is what
I've tried:

I ran lvextend when the system was booted normally and the volumes were
mounted.  This worked as expected and lvdisplay properly shows the new
larger size.

Then I booted into the FC2 rescue CD and instructed it to NOT search for
and mount Fedora installations.  I then ran:
# resize2fs /dev/Volume00/LogVol00
I don't have the specific error, but it basically says that the
specified volume doesn't exist.  Indeed if I look in /dev, my volume
group and volumes are nowhere to be found.

At that point I tried:
# lvm
lvm> vgscan
After only about 1 second, it responds that no volumes are found.

I also tried rebooting from the CD and letting it mount my
installations.  In this case, the volume and volume groups are properly
discovered and mounted.  However, if I try to unmount the volume, it
always responds with "device busy".

Is this a problem with how the FC2 rescue disk scans for volumes?  Any
help would be appreciated.
