Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r16Bh73J001697
	for <linux-lvm@redhat.com>; Wed, 6 Feb 2013 06:43:07 -0500
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r16Bh6d1002716
	for <linux-lvm@redhat.com>; Wed, 6 Feb 2013 06:43:06 -0500
Received: by mail-qc0-f169.google.com with SMTP id t2so480401qcq.28
	for <linux-lvm@redhat.com>; Wed, 06 Feb 2013 03:43:05 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 6 Feb 2013 13:43:05 +0200
Message-ID: <CAPhuxPsnfme0a=AeqAQ_CS0WNp9FEhE=5oXyO7A9iZHHpA+MdA@mail.gmail.com>
From: Robert <namibianer@gmail.com>
Subject: [linux-lvm] LVM mirror logic bug?
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

Hi,

Today I created a mirror due to some data migrations I am doing, and
the funny thing is that two mirror legs ended up on the same physical
volume:

# lvs -a -o +devices
  LV                VG     Attr   LSize   Origin Snap%  Move Log Copy%
 Convert Devices
  oraarch           sapvg  -wi-ao  20.00G
         /dev/dm-18(0)
  oracle            sapvg  -wi-ao   5.00G
         /dev/dm-18(5120)
  orapta            sapvg  mwi-ao 299.12G
100.00         orapta_mimage_0(0),orapta_mimage_1(0)
  [orapta_mimage_0] sapvg  iwi-ao 299.12G
         /dev/dm-5(11520)
  [orapta_mimage_0] sapvg  iwi-ao 299.12G
         /dev/dm-3(12800)
  [orapta_mimage_0] sapvg  iwi-ao 299.12G
         /dev/dm-3(30002)
  [orapta_mimage_0] sapvg  iwi-ao 299.12G
         /dev/dm-4(0)
  [orapta_mimage_0] sapvg  iwi-ao 299.12G
         /dev/dm-4(9913)
  [orapta_mimage_0] sapvg  iwi-ao 299.12G
         /dev/dm-6(0)
  [orapta_mimage_1] sapvg  iwi-ao 299.12G
         /dev/dm-6(34249)
  [orapta_mimage_1] sapvg  iwi-ao 299.12G
         /dev/dm-16(0)
  [orapta_mimage_1] sapvg  iwi-ao 299.12G
         /dev/dm-17(0)
...
...

Here you can see /dev/dm-6 contains part of both mirror legs.

I have to admit I just used the command:
lvconvert -m1 --corelog sapvg/orapta
not specifying the target pv's as I thought LVM would calculate it for itself.

There should be a rule in place to never use the same PV for the
second leg of a mirror that is used by the first shoudln't there?

I am using a statically compiled version of LVM so I can use it on
different machines that are older than SLES11SP2 as the older distro
won't allow me to mirror multi segmented LV's.

# /tmp/lvm.static version
  LVM version:     2.02.98(2) (2012-10-15)
  Library version: 1.02.77 (2012-10-15)
  Driver version:  4.15.0

Thanks!
Robert
