Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA33ZTnG019891
	for <linux-lvm@redhat.com>; Mon, 2 Nov 2009 22:35:29 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA33ZEJ8014494
	for <linux-lvm@redhat.com>; Mon, 2 Nov 2009 22:35:15 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nA33ZEgT021011
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 2 Nov 2009 22:35:14 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nA33ZEYi026285
	for <linux-lvm@redhat.com>; Mon, 2 Nov 2009 22:35:14 -0500
Date: Mon, 2 Nov 2009 22:35:14 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Message-ID: <Pine.LNX.4.64.0911022226110.26129@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] error creating snapshots
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Is this a harmless error having to do with some misreported option to notify a
user process when the snapshot is almost full?  Or should I switch backups over
to network based because this means LVM might corrupt data?

CentOS-5.4

# uname -a
Linux xerces.jsconnor.com 2.6.18-164.el5xen #1 SMP Thu Sep 3 04:03:03 EDT 2009 x86_64 x86_64 x86_64 GNU/Linux
# lvcreate -s -L20G -n dmm_snap bms_data/dmm
  bms_data-dmm_snap: event registration failed: 10071:3 
libdevmapper-event-lvm2snapshot.so dlopen failed: 
/usr/lib64/liblvm2cmd.so.2.02: undefined symbol: dm_list_empty
  bms_data/snapshot0: snapshot segment monitoring function failed.
  Logical volume "dmm_snap" created
# echo $?
0
# lvremove bms_data/dmm_snap
Do you really want to remove active logical volume dmm_snap? [y/n]: y
  Logical volume "dmm_snap" successfully removed
# diff /etc/lvm/backup/bms_data /etc/lvm/archive/bms_data_00290.vg
6c6
< description = "Created *after* executing 'lvremove bms_data/dmm_snap'"
---
> description = "Created *before* executing 'lvremove bms_data/dmm_snap'"
13c13
<       seqno = 430
---
>       seqno = 429
235a236,271
> 
>               dmm_snap {
>                       id = "2KshBd-67nj-nyrX-RUKK-LEl2-ZXBP-bJrtwe"
>                       status = ["READ", "WRITE"]
>                       flags = []
>                       segment_count = 1
> 
>                       segment1 {
>                               start_extent = 0
>                               extent_count = 640      # 20 Gigabytes
> 
>                               type = "striped"
>                               stripe_count = 1        # linear
> 
>                               stripes = [
>                                       "pv0", 7648
>                               ]
>                       }
>               }
> 
>               snapshot0 {
>                       id = "zUturd-IQZR-3xYu-SgpB-NnzK-0XKL-JN3fWh"
>                       status = ["READ", "WRITE", "VISIBLE"]
>                       flags = []
>                       segment_count = 1
> 
>                       segment1 {
>                               start_extent = 0
>                               extent_count = 1280     # 40 Gigabytes
> 
>                               type = "snapshot"
>                               chunk_size = 8
>                               origin = "dmm"
>                               cow_store = "dmm_snap"
>                       }

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
