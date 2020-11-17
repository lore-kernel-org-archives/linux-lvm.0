Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05AE9906D6
	for <linux-lvm@redhat.com>; Tue, 17 Nov 2020 03:52:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4D0F80019A
	for <linux-lvm@redhat.com>; Tue, 17 Nov 2020 03:52:49 +0000 (UTC)
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <a966550b-aacc-85bc-da74-d34a3e4ccd99@suse.com>
Date: Tue, 17 Nov 2020 11:52:28 +0800
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] issue about return value in _lvchange_activate_single
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
To: LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

Hello List, David & Zdenek,

I met a boring problem when executing lvchange cmd.

In lvm tools/errors.h, there are defines return values:
```
#define ECMD_PROCESSED      1
#define ENO_SUCH_CMD        2
#define EINVALID_CMD_LINE   3
#define EINIT_FAILED        4
#define ECMD_FAILED     5
```

In lvm functions, it treats "return 0" as error case.

if _lvchange_activate() return ECMD_FAILED, the caller _lvchange_activate_single() think as normal:
```
if (!_lvchange_activate(cmd, lv)) <== ECMD_FAILED is 5, won't enter if case.
        return_ECMD_FAILED;

return ECMD_PROCESSED;
```

So in special condition, lvchange cmd will return successfully but cmd executing failed.

the code should be changed to:
```
diff --git a/tools/lvchange.c b/tools/lvchange.c
index f9a0b54e3..ae626a05b 100644
--- a/tools/lvchange.c
+++ b/tools/lvchange.c
@@ -1437,6 +1437,7 @@ static int _lvchange_activate_single(struct cmd_context *cmd,
 {
        struct logical_volume *origin;
        char snaps_msg[128];
+       int rv;
 
        /* FIXME: untangle the proper logic for cow / sparse / virtual origin */
 
@@ -1465,8 +1466,10 @@ static int _lvchange_activate_single(struct cmd_context *cmd,
                }
        }
 
-       if (!_lvchange_activate(cmd, lv))
+       rv = _lvchange_activate(cmd, lv);
+       if (!rv || rv>1) {
                return_ECMD_FAILED;
+       }
 
        return ECMD_PROCESSED;
 }
```

maybe the same problem exist in other places of lvm2 source code.

how to trigger:

there is two nodes env, node1 & node2. they share 1 iSCSI lun disk.
node1 & node2 use systemid to control the shared disk.

1. node1 already use uname to set up systemid.

```
[tb-clustermd1 ~]# pvs --foreign
  PV         VG  Fmt  Attr PSize   PFree  
  /dev/sda   vg1 lvm2 a--  292.00m 260.00m
[tb-clustermd1 ~]# vgs --foreign -o+systemid
  VG  #PV #LV #SN Attr   VSize   VFree   System ID    
  vg1   1   1   0 wz--n- 292.00m 260.00m tb-clustermd1
[tb-clustermd1 ~]# lvs --foreign -o+Host
  LV   VG  Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert Host         
  lv1  vg1 -wi-a----- 32.00m                                                     tb-clustermd1
[tb-clustermd1 ~]# dmsetup ls
vg1-lv1 (254:0)
[tb-clustermd1 ~]#
```

2. node2 change the systemid to itself

```
[tb-clustermd2 ~]# vgchange -y --config "local/extra_system_ids='tb-clustermd1'" --systemid tb-clustermd2 vg1
  Volume group "vg1" successfully changed
[tb-clustermd2 ~]# lvchange -ay vg1/lv1
[tb-clustermd2 ~]# dmsetup ls
vg1-lv1 (254:0)
[tb-clustermd2 ~]#
```

3. this time both sides have dm device.
```
[tb-clustermd1 ~]# dmsetup ls
vg1-lv1 (254:0)
[tb-clustermd2 ~]# dmsetup ls
vg1-lv1 (254:0)
``` 

4. node1 executes lvchange cmds. please note the return value is 0
```
[tb-clustermd1 ~]# lvchange -ay vg1/lv1 ; echo $?
  WARNING: Found LVs active in VG vg1 with foreign system ID tb-clustermd2.  Possible data corruption.
  Cannot activate LVs in a foreign VG.
0
[tb-clustermd1 ~]# dmsetup ls
vg1-lv1 (254:0)
[tb-clustermd1 ~]# lvchange -an vg1/lv1 ; echo $?
  WARNING: Found LVs active in VG vg1 with foreign system ID tb-clustermd2.  Possible data corruption.
0
[tb-clustermd1 ~]# dmsetup ls
No devices found
[tb-clustermd1 ~]#
```

Thanks.
