Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32B9E10075CF
	for <linux-lvm@redhat.com>; Wed, 27 May 2020 05:32:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C697101A525
	for <linux-lvm@redhat.com>; Wed, 27 May 2020 05:32:04 +0000 (UTC)
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0072g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Wed, 27 May 2020 05:30:51 +0000
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <3754b958-93fb-221c-41f6-7529b4a848c3@suse.com>
Date: Wed, 27 May 2020 12:51:48 +0800
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] question about vg underlying pv devs order
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello list,

one our customer reported a issue. After executing lvextend, the vg underlying pv devs changed.

I do a summary from my watching.

first, pv devies in /etc/lvm/backup/systemvg & /etc/lvm/archive/systemvg-xxx are correct.

but using pvdissect (url: https://wiki.syslinux.org/wiki/index.php?title=Development/LVM_support/pvdissect), the script dumped show pv related device had been changed after executing lvextend command.

the part output of pvdissect like:
```
0x00006000 (metadata.value):
systemvg {
     id = "id-xxx"
     seqno = 11
     format = "lvm2"
     status = ["RESIZEABLE", "READ", "WRITE"]
     flags = []
     extent_size = 8192
     max_lv = 0
     max_pv = 0
     metadata_copies = 0

     physical_volumes {

         pv0 {
             id = "pv0-uuid-xxxx"  <=== it didn't change
             device = "/dev/sdb"   <=== it changed to /dev/sda

             status = ["ALLOCATABLE"]
             flags = []
             dev_size = 4806528
             pe_start = 2048
             pe_count = 586
         }

         pv1 {
             id = "pv1-uuid-xxxx"   <=== it didn't change
             device = "/dev/sdc"    <=== it changed to /dev/sdb

             status = ["ALLOCATABLE"]
             flags = []
             dev_size = 4806528
             pe_start = 2048
             pe_count = 586
         }

         pv2 {
             id = "pv2-uuid-xxxx"    <=== it didn't change
             device = "/dev/sdd"     <=== it changed to /dev/sdc

             status = ["ALLOCATABLE"]
             flags = []
             dev_size = 4806528
             pe_start = 2048
             pe_count = 586
         }

     ... ... # other parts are correct
```

(the systemvg consists of many LVs, ie: usrlv, varlv, optlv, homelv.)
  

my question:
the devs order changed, but after system reboot, everything work fine. why?

I not very familiar with lvm code.
 From my watching, it looks lvm uses pv uuid not device to work, is it right?

Thanks.
