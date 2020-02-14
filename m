Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 599AA101B566
	for <linux-lvm@redhat.com>; Fri, 14 Feb 2020 15:25:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 383A41011A6C
	for <linux-lvm@redhat.com>; Fri, 14 Feb 2020 15:25:33 +0000 (UTC)
References: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <28bcae47-4657-8466-c1e2-0151d9ee9f1e@suse.com>
Date: Fri, 14 Feb 2020 23:18:31 +0800
In-Reply-To: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] commit c527a0cbfc3 may have a bug
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
Cc: teigland@redhat.com


Hello list & David,

The stable-2.02 branch commit c527a0cbfc391645d30407d2 may intruduce a bug.
There is a new function label_scan_pvscan_all(), which uses 
cmd->lvmetad_filter to create devices list for scan.

code:
```
label_scan_pvscan_all
  if (!(iter = dev_iter_create(cmd->lvmetad_filter, 0)))
  ... ...
  while ((dev = dev_iter_get(iter)))
  ... ...
```

It looks it is wrong to use cmd->lvmetad_filter in label_scan_pvscan_all.
The behaviour is changed after the patch applied. (legacy code use 
cmd->full_filter)

When system has duplicated devices and startup, with patch c527a0cb, the 
duplicated devs will pass global_filter (usually it's empty). It makes 
lvmetad fail to build up LV, then the system boot failed. This case is 
not my imagination, one of our customer met recently.

So I suggest to change the cmd->lvmetad_filter to cmd->full_filter in 
label_scan_pvscan_all().

The steps to reproduce:
```
create a loop dev.
use this loop to create some mapper devs. (share the same loop dev)
pvcreate on these mapper devs

# this cmd will output warning msg.
pvscan --cache --config ' devices { filter = [ "r|/dev/loop0|" } '
# this cmd will not output warning msg.
pvscan --cache --config ' devices { filter = [ "a|/dev/loop0|" ] 
global_filter = [ "r|/dev/loop0|" ] } '
```

Thanks.
