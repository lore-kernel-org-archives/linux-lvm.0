Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC2872026D5D
	for <linux-lvm@redhat.com>; Sat, 23 May 2020 14:04:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7755A185A78B
	for <linux-lvm@redhat.com>; Sat, 23 May 2020 14:04:30 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0014g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Sat, 23 May 2020 14:03:49 +0000
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <7a26b791-9739-d6dc-1744-7471f3c00af8@suse.com>
Date: Sat, 23 May 2020 22:03:50 +0800
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] issue (or bug): when vgremove does removing lvmcache
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

Hello List,

when using below reproduced steps, lvm command show error info.
```
# pvcreate /dev/sda /dev/sdb

# vgcreate test /dev/sda /dev/sdb

# lvcreate --name main --size 200m test /dev/sda

# lvcreate --name fast --size 50m test /dev/sdb

# lvconvert -y --type cache --cachevol fast test/main

# lvs -a -o name,vgname,lvattr,origin,segtype,devices test
   LV           VG   Attr       Origin       Type   Devices
   [fast]       test Cwi-aoC---              linear /dev/sdb(0)
   main         test Cwi-a-C--- [main_corig] cache  main_corig(0)
   [main_corig] test owi-aoC---              linear /dev/sda(0)

# vgremove test --force
   Logical volume "main" successfully removed
   Assertion failed: can't _pv_write non-orphan PV (in VG )
   Failed to remove physical volume "/dev/sdb" from volume group "test"
   Volume group "test" not properly removed

# lvs # <==  output none

# vgs # <==  output none

# pvs
   WARNING: PV /dev/sdb is marked in use but no VG was found using it.
   WARNING: PV /dev/sdb might need repairing.
   PV         VG        Fmt  Attr PSize   PFree
   /dev/sda             lvm2 ---  300.00m 300.00m
   /dev/sdb   [unknown] lvm2 u--  300.00m      0
```

rootcause analysis:

1>
why output: Assertion failed: can't _pv_write non-orphan PV (in VG )

_vgremove_single
  vg_remove
   vg_remove_direct
    pv_write(vg->cmd, pv, 0)

pv_write
  if (!allow_non_orphan &&
     (!is_orphan_vg(pv->vg_name) || pv->pe_alloc_count)) {
         log_error("Assertion failed: can't _pv_write non-orphan PV "
               "(in VG %s)", pv_vg_name(pv));
         return 0;
     }

the pv->pe_alloc_count is non-zero.

2>
why pv->pe_alloc_count is non-zero.

_vgremove_single
  process_each_lv_in_vg
         /*
          * Only let hidden LVs through if --all was used or the LVs
          * were specifically named on the command line.
          */
         if (!lvargs_supplied && !lv_is_visible(lvl->lv) && !arg_is_set(cmd, all_ARG) &&
             (!cmd->process_component_lvs || !lv_is_component(lvl->lv)))
             continue;

cmd->process_component_lvs and  lv_is_component(lvl->lv) are false,
then lv can't join in final_lvl and won't be removed later.


At last,
I can't find a good solution for this issue. the 112846ce0b01e5353 introduced this issue.
one solution maybe to add CACHE_POOL_METADATA in lv->status when _read_lvnames constructs lv.


Thanks.
