Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2IJIi6h013262
	for <linux-lvm@redhat.com>; Sun, 18 Mar 2007 15:18:44 -0400
Received: from web52908.mail.re2.yahoo.com (web52908.mail.re2.yahoo.com
	[206.190.49.18])
	by mx2.redhat.com (8.13.1/8.13.1) with SMTP id l2IJIedZ009070
	for <linux-lvm@redhat.com>; Sun, 18 Mar 2007 15:18:40 -0400
Message-ID: <20070318191835.11959.qmail@web52908.mail.re2.yahoo.com>
Date: Sun, 18 Mar 2007 12:18:35 -0700 (PDT)
From: Rik Herrin <rikherrin@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Using LVM to simulate Copy-on-Write
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
To: linux-lvm@redhat.com

Hi,
  I was wondering if there was some way to use LVM to
simulate the Copy-on-Write technique used in User Mode
Linux.  Basically, the idea is as follows:

"The way to share a filesystem between two virtual
machines is to use the copy-on-write (COW) layering
capability of the ubd block driver. As of 2.4.6-2um,
the driver supports layering a read-write private
device over a read-only shared device. A machine's
writes are stored in the private device, while reads
come from either device - the private one if the
requested block is valid in it, the shared one if not.
Using this scheme, the majority of data which is
unchanged is shared between an arbitrary number of
virtual machines, each of which has a much smaller
file containing the changes that it has made. With a
large number of UMLs booting from a large root
filesystem, this leads to a huge disk space saving. It
will also help performance, since the host will be
able to cache the shared data using a much smaller
amount of memory, so UML disk requests will be served
from the host's memory rather than its disks. " [Taken
from
http://user-mode-linux.sourceforge.net/UserModeLinux-HOWTO-7.html]

Any ideas?  Thanks for your help.


 
____________________________________________________________________________________
Finding fabulous fares is fun.  
Let Yahoo! FareChase search your favorite travel sites to find flight and hotel bargains.
http://farechase.yahoo.com/promo-generic-14795097
