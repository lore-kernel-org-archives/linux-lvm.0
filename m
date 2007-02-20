Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KETjpD030779
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 09:29:45 -0500
Received: from pat.uio.no
	(IDENT:U2FsdGVkX18vrkyDkbnxFIKxLnGx3JLA09fhE+OMAkI@pat.uio.no
	[129.240.10.15])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1KETiE9018938
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 09:29:44 -0500
Received: from mail-mx2.uio.no ([129.240.10.30])
	by pat.uio.no with esmtp (Exim 4.66)
	(envelope-from <terjekv@nommo.uio.no>) id 1HJVzy-0006sG-T3
	for linux-lvm@redhat.com; Tue, 20 Feb 2007 15:29:42 +0100
Received: from nommo.uio.no ([129.240.222.179])
	by mail-mx2.uio.no with esmtp (Exim 4.66)
	(envelope-from <terjekv@nommo.uio.no>) id 1HJVzy-0000hX-In
	for linux-lvm@redhat.com; Tue, 20 Feb 2007 15:29:42 +0100
Received: from terjekv by nommo.uio.no with local (Exim 4.44)
	id 1HJVzy-0007Px-Be
	for linux-lvm@redhat.com; Tue, 20 Feb 2007 15:29:42 +0100
From: Terje Kvernes <terjekv@math.uio.no>
Date: Tue, 20 Feb 2007 15:29:42 +0100
Message-ID: <wxx3b50297t.fsf@nommo.uio.no>
MIME-Version: 1.0
Sender: Terje Kvernes <terjekv@math.uio.no>
Subject: [linux-lvm] devsize problems.
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


  (my apologies if you see this twice, I couldn't see my previous
  attempt reach the archives)

  I've been trying to create a large (4TB) volume on a 3ware raid
  controller, and I get "device-mapper: reload ioctl failed: Invalid
  argument" from lvcreate and 

Feb 19 13:42:10 siniolchu kernel: device-mapper: device 8:3 too small for target
Feb 19 13:42:10 siniolchu kernel: device-mapper: dm-linear: Device lookup failed
Feb 19 13:42:10 siniolchu kernel: device-mapper: error adding target to table

  from the logs.  interestingly enough, the DevSize reports the
  following:

siniolchu:/# pvs  -o +dev_size
  PV         VG       Fmt  Attr PSize PFree DevSize
  /dev/sda3  internvg lvm2 a-   4.09T 4.06T  89.86G

  if I'm reading this correctly, the device seems to be telling LVM
  that it's 89.86G only?  any suggestions on how to solve this would
  be appreciated.


-- 
Terje
