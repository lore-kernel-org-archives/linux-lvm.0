Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95E9E600C8
	for <linux-lvm@redhat.com>; Mon,  4 Jun 2018 00:46:22 +0000 (UTC)
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E533D316B794
	for <linux-lvm@redhat.com>; Mon,  4 Jun 2018 00:46:10 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id q4-v6so13250269wmq.1
	for <linux-lvm@redhat.com>; Sun, 03 Jun 2018 17:46:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAANaKqcv2bF1X1S3L5xi-7HOsV2J29a4BvhMjiqwigRm2SGbVw@mail.gmail.com>
References: <CAANaKqdnGfgxxHwQVA+L3uNDe5aMydssLius94wcp6LxA1-w+g@mail.gmail.com>
	<CAANaKqdPjq9sK=DvZjDDSm8Vd_28C1k2i2xLyTrkFzwVq69NZw@mail.gmail.com>
	<CAANaKqdRgfcZvUZXUgwSX-WXaQ0K=yg6ubDGwRkMk8mU+bDpUw@mail.gmail.com>
	<CAANaKqcv2bF1X1S3L5xi-7HOsV2J29a4BvhMjiqwigRm2SGbVw@mail.gmail.com>
From: Jim Haddad <jimhaddad46@gmail.com>
Date: Sun, 3 Jun 2018 17:46:09 -0700
Message-ID: <CAANaKqd98zjbv2Mh60aeny=UL8oMGadGcLUXgOURbQmnFxojEA@mail.gmail.com>
Subject: Re: [linux-lvm] "write failed.. No space left", "Failed to write VG",
 and "Failed to write a MDA"
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

On Sun, Jun 3, 2018 at 5:19 PM, Inbox <jimhaddad46@gmail.com> wrote:
> Kernel 4.16.8, lvm 2.02.177.

Again, I setup this disk in 2016 using lvm 2.02.162.

I tried reproducing the "--pvmetadatacopies 2" bug in a VM, and did
not, so I presume the calculation of the offset and size to make mda1
was fixed somewhere between 2.02.162 - 2.02.177.  That, or the bug
might still happen on a 4.53t (5TB) disk, but not on my 40G VM.

In the VM, the output of pvdissect is below.  mda0 size is 0xff000,
and mda1.size is 0x100000.  So, mda1 is actually slightly bigger by
4096 bytes, but as long as the circular buffers are handled
independently and these don't need to be the same, that's OK.

The previous problem was that the XML area was being shrunk from
966,656 bytes to 48,640 (so mda1 could hold a whopping 5% as much xml
as mda0.)

But, kernel 4.16.8, lvm 2.02.177 is still trying to write past the
disk given a really small mda1.

I'd be fine if I could run "vgconvert --pvmetadatacopies 1" and forget
the one at the end of the disk.  I don't know if that could be
dangerous to run though, in this situation especially.

(I'm thinking the alternative would be getting another drive, running
the new pvcreate on it, and copying everything over.  Since, I can't
shrink the existing thin pool to make room for a bigger mda1, not that
there's a way to really expand it anyway.  I'd rather lose the extra
copy.)



# python2 pvdissect
0x00000200 (label_header.id):
    LABELONE
0x00000208 (label_header.sector):
1
0x00000210 (label_header.crc):
    0xfa4129bd
0x00000214 (label_header.offset):
    0x20
0x00000218 (label_header.type):
    LVM2 001
0x00000220 (pv_header.uuid):
    SHLDkE-wyYu-2xFJ-jhA9-armj-WOFS-X3d7Sh
0x00000240 (pv_header.device_size):
    0x9fff00000
0x00000248 (pv_header.disk_areas.da0.offset):
    0x100000
0x00000250 (pv_header.disk_areas.da0.size):
    0x0
0x00000268 (pv_header.disk_areas.mda0.offset):
    0x1000
0x00000270 (pv_header.disk_areas.mda0.size):
    0xff000
0x00000278 (pv_header.disk_areas.mda1.offset):
    0x9ffe00000
0x00000280 (pv_header.disk_areas.mda1.size):
    0x100000
0x00001000 (mda_header.checksum):
    0xb4cd28c6
0x00001004 (mda_header.magic):
     LVM2 x[5A%r0N*>
0x00001014 (mda_header.version):
1
0x00001018 (mda_header.start):
    0x1000
0x00001020 (mda_header.size):
    0xff000
0x00001028 (mda_header.raw_locns0.offset):
    0x2000
0x00001030 (mda_header.raw_locns0.size):
    0x3e6
0x00001038 (mda_header.raw_locns0.checksum):
    0x1f264f08
0x0000103c (mda_header.raw_locns0.flags):
0
0x00001028 (mda_header.raw_locns0.offset):
    0x2000
0x00001030 (mda_header.raw_locns0.size):
    0x3e6
0x00001038 (mda_header.raw_locns0.checksum):
    0x1f264f08
0x0000103c (mda_header.raw_locns0.flags):
0
0x9ffe00000 (mda_header.checksum):
    0x566e3e24
0x9ffe00004 (mda_header.magic):
     LVM2 x[5A%r0N*>
0x9ffe00014 (mda_header.version):
1
0x9ffe00018 (mda_header.start):
    0x9ffe00000
0x9ffe00020 (mda_header.size):
    0x100000
0x9ffe00028 (mda_header.raw_locns0.offset):
    0x2000
0x9ffe00030 (mda_header.raw_locns0.size):
    0x3e6
0x9ffe00038 (mda_header.raw_locns0.checksum):
    0x1f264f08
0x9ffe0003c (mda_header.raw_locns0.flags):
0
0x9ffe00028 (mda_header.raw_locns0.offset):
    0x2000
0x9ffe00030 (mda_header.raw_locns0.size):
    0x3e6
0x9ffe00038 (mda_header.raw_locns0.checksum):
    0x1f264f08
0x9ffe0003c (mda_header.raw_locns0.flags):
0
0x00003000 (metadata.value):
...
0x9ffe02000 (metadata.value):
...
