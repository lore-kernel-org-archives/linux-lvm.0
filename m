Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62A7E10144E0
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2020 00:24:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C01D5833B7B
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2020 00:24:01 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id l17so446016iok.7
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2020 17:23:58 -0700 (PDT)
MIME-Version: 1.0
From: L A Walsh <lvm@tlinx.org>
Date: Tue, 21 Jul 2020 17:23:47 -0700
Message-ID: <CALOnQv5gib+tQTBzZBD9QDDNiZcuoybN3HoH_wQVD8rAdsMQKA@mail.gmail.com>
Subject: [linux-lvm] lvm question regarding start and placement of data
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

I have a file in the /etc/lvm/archive dir that seems to be the name of a vg.


I see:
Data {
    seqno = 1933
    format = "lvm2" # informational
    status = ["RESIZEABLE", "READ", "WRITE"]
    extent_size = 8192        # 4 Megabytes
    max_lv = 0
    max_pv = 0
    metadata_copies = 0

    physical_volumes {
        pv0 {
            device = "/dev/sdb1"    # Hint only
            status = ["ALLOCATABLE"]
            flags = []
            dev_size = 93755273216    # 43.6582 Terabytes
            pe_start = 2048
            pe_count = 11444735    # 43.6582 Terabytes
        }
    }

    logical_volumes {
        Home {
            allocation_policy = "contiguous"
            segment_count = 1
            segment1 {
                start_extent = 0
                extent_count = 393216    # 1.5 Terabytes
                type = "striped"
                stripe_count = 1    # linear
                stripes = [ "pv0", 0 ]
            }
        }
----
It appears that the start of the physical vol is at 2048 but not sure
what the units are --
Are those 2048 physical extents of size 8192 and is said to be
equivalent to 4MB?  So the 8192 is a number of 512 byte sectors
(even though they underlying disk is 4K with 512e)?

At the start of the physical volume at 2048 should I see the logical
volume 'Home' as it starts at extent '0'?

So shouldn't I see the start of the Home partition 8MB in from the
front?  Or is there something else before physical volumns?  Does
first logical volume start at pe_start?

I.e. I'm assuming I have something wrong, because I'm not seeing anything
looking like the beginning of a file system at that location...

Thanks....
