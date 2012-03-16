Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q2G6S6dh030842
	for <linux-lvm@redhat.com>; Fri, 16 Mar 2012 02:28:06 -0400
Received: from mail-pz0-f46.google.com (mail-pz0-f46.google.com
	[209.85.210.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2G6S5Ce017508
	for <linux-lvm@redhat.com>; Fri, 16 Mar 2012 02:28:05 -0400
Received: by dajr28 with SMTP id r28so5770953daj.33
	for <linux-lvm@redhat.com>; Thu, 15 Mar 2012 23:28:05 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 16 Mar 2012 01:28:05 -0500
Message-ID: <CA+6TzyL_vM717b7Atw+Y9zN4tHeAqoisYmTwUAmJxPeB+zzv1w@mail.gmail.com>
From: John Mesmon <jmesmon@gmail.com>
Subject: [linux-lvm] lvm fails when /proc/devices contains "-1 smblk"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
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

It filters out all the possible devices, resulting in almost all
operations failing (maybe all, I haven't checked that far).

Introduced by c929a0b3c8c1cd4a32458b5db0aa3d221a949aad

My opinion is that there is no need for the check that commit adds, It
can only break things (when the range of valid block devices changes).

For reference, the relavent portion of my /proc/devices:

Character devices:
  1 mem
  4 /dev/vc/0
  4 tty
...
251 macvtap
252 kcopy
253 bsg
254 rtc

Block devices:
 -1 smblk
  1 ramdisk
256 rfd
257 ssfdc
259 blkext
  7 loop
...



--
Cody
