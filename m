Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3L48wEn024833
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2016 00:08:58 -0400
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 956AFBDD2
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2016 04:08:56 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id e185so84128675vkb.1
	for <linux-lvm@redhat.com>; Wed, 20 Apr 2016 21:08:56 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 21 Apr 2016 12:08:55 +0800
Message-ID: <CAAYit8QQKv1gwtQ5TQx1+aX2f0y8jmTMDU83cMqp2Obosom=jQ@mail.gmail.com>
From: Ming-Hung Tsai <mingnus@gmail.com>
Subject: [linux-lvm] Why LVM metadata locations are not properly aligned
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I'm trying to find any opportunity to accelerate LVM metadata IO, in order to
take lvm-thin snapshots in a very short time. My scenario is connecting
lvm-thin volumes to a Windows host, then taking snapshots on those volumes for
Windows VSS (Volume Shadow Copy Service). Since that the Windows VSS can only
suspend IO for 10 seconds, LVM should finish taking snapshots within 10 seconds.

However, it's hard to achieve that if the PV is busy running IO. The major
overhead is LVM metadata IO. There are some issues:

1. The metadata locations (raw_locn::offset) are not properly aligned.
   Function _aligned_io() requires the IO to be logical-block aligned,
   but metadata locations returned by next_rlocn_offset() are 512-byte aligned.
   If a device's logical block size is greater than 512b, then LVM need to use
   bounce buffer to do the IO.
   How about setting raw_locn::offset to logical-block boundary?
   (or max(logical_block_size, physical_block_size) for 512-byte logical-/4KB
    physical-block drives?)

2. In most cases, the memory buffers passed to dev_read() and dev_write() are
   not aligned. (e.g, raw_read_mda_header(), _find_vg_rlocn())

3. Why LVM uses such complex process to update metadata?
   The are three operations to update metadata: write, pre-commit, then commit.
   Each operation requires one header read (raw_read_mda_header),
   one metadata checking (_find_vg_rlocn()), and metadata update via bounce
   buffer. So we need at least 9 reads and 3 writes for one PV.
   Could we simplify that?

4. Commit fb003cdf & a3686986 causes additional metadata read.
   Could we improve that? (We had checked the metadata in _find_vg_rlocn())

5. Feature request: could we take multiple snapshots in a batch, to reduce
   the number of metadata IO operations?
   e.g., lvcraete vg1/lv1 vg1/lv2 vg1/lv3 --snapshot
   (I know that it would be trouble for the --addtag options...)

   This post mentioned that lvresize will support resizing multiple volumes,
   but I think that taking multiple snapshots is also helpful.
   https://www.redhat.com/archives/linux-lvm/2016-February/msg00023.html
   > There is also some ongoing work on better lvresize support for more then 1
   > single LV. This will also implement better approach to resize of lvmetad
   > which is using different mechanism in kernel.

   Possible IOCTL sequence:
     dm-suspend origin0
     dm-message create_snap 3 0
     dm-message set_transaction_id 3 4
     dm-resume origin0
     dm-suspend origin1
     dm-message create_snap 4 1
     dm-message set_transaction_id 4 5
     dm-resume origin1
     dm-suspend origin2
     dm-message create_snap 5 2
     dm-message set_transaction_id 5 6
     dm-resume origin2
     ...

6. Is there any other way to accelerate LVM operation? I had enabled lvmetad,
   setting global_filter and md_component_detection=0 in lvm.conf.


Thanks,
Ming-Hung Tsai
