Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7F499a10513
	for <linux-lvm@redhat.com>; Sun, 15 Aug 2004 00:09:09 -0400
Received: from rwcrmhc13.comcast.net (rwcrmhc13.comcast.net [204.127.198.39])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i7F48xXn001188
	for <linux-lvm@redhat.com>; Sun, 15 Aug 2004 00:08:59 -0400
From: Stephen Nesbitt <stephen_nesbitt@alumni.mckenna.edu>
Date: Sat, 14 Aug 2004 21:08:52 -0700
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200408142108.52705.stephen_nesbitt@alumni.mckenna.edu>
Subject: [linux-lvm] Problem creating logical volumes
Reply-To: stephen_nesbitt@alumni.mckenna.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

All:

Configuration is Fedora Core 2. When trying to create a logical volume I get a 
message of the form :
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'vg01-jukebox''.
  Failed to activate new LV.

The LVM considers it present but there is no device entry.

I have seen a couple of posts asking for help regarding this problem
but no solutions. Anyone?

Thanks!

-steve
