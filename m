Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7LGBua16697
	for <linux-lvm@redhat.com>; Sat, 21 Aug 2004 12:11:56 -0400
Received: from hotmail.com (bay18-dav16.bay18.hotmail.com [65.54.187.196])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i7LGBoXn011500
	for <linux-lvm@redhat.com>; Sat, 21 Aug 2004 12:11:50 -0400
From: "J.Smith" <temp201@hotmail.com>
Date: Sat, 21 Aug 2004 18:10:41 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <BAY18-DAV16OZxYS0qP0000d743@hotmail.com>
Subject: [linux-lvm] RedHat LVM2/DM/SAN Architecture Overview info ?
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com



Ok, somebody shoot me if im screwing things up here myself, but ...


Im looking for some (global overview/architecture) information on the
current state of Logical Volume Management and multi-path software for Linux
/Redhat. Please note that im not looking for any configuration guides or
anything, but more for an overview of the architecture, and the
(in-)possibilities (like boot from SAN support with LVM2/DM, lilo/grub boot
manager support for a /boot partition on LVM2 and DM, etc ?) of the current
technology.

But it looks like since RedHat has acquired sistina, I cant seem to find any
decent information on this topic ? The only thing I can find is the "Red Hat
Global File System" web page that I get redirected to when I access
www.sistina.com, and that page is really not all that helpful for finding
the kind of information that I am currently looking for - it seems aimed at
people that want to build clusters and Im just looking for LVM/mirroring/SAN
information for regular Linux systems. Doesnt RedHat have some kind of white
paper that provides this information for the RedHat server systems ? Yes, I
could of course read the device mapper, LVM2, and boot-manager HOWTO's and
mailing list myself and try to patch the information together for myself.
But isnt the added value of a distribution supposed to be that you dont have
to do that yourself cause the vendor does this for you ?
;)

Oh, well.

Anyways, if anyone happens to know a URL that can help me clear up this
issue for me, that would be appreciated very much indeed.




Sincerely,

John Smith.
