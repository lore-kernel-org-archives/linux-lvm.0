Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C679194644
	for <linux-lvm@redhat.com>; Tue, 17 Nov 2020 08:00:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5468680118B
	for <linux-lvm@redhat.com>; Tue, 17 Nov 2020 08:00:25 +0000 (UTC)
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <3e4cbb06-6428-45f2-0b42-d7dc5abdfc81@suse.com>
Date: Tue, 17 Nov 2020 16:00:10 +0800
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] discussion about activation/auto_activation_volume_list
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
To: agk@redhat.com, David Teigland <teigland@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hello LVM-maintainers,

Currently activation/auto_activation_volume_list is not enable and it does the default behavior:
  pvscan will activate all the devices on booting.

This rule will trigger a clumsy process in HA (corosync+pacemaker stack) env.

## let me show the scenario:

2 nodes (A & B) share a disk, and using systemid to manage vg/lv on this shared disk.
(keep the activation/auto_activation_volume_list default style: comment out this cfg item)

(below steps come from resource-agent LVM-active script)
1. Node A own & active shared vg/lv, node B standby status.
2. A reboot, B detect & wait for A rejoined cluster.
3. because systemid doesn't be changed, lvm2-pvscan@.service will active the vg/lv on A during booting.
4. A finishes reboot, B starts to switch systemid & active shared vg/lv.
5. on B, pacemaker detects lvm resource is running on both nodes.
6. on B, pacemaker restarts lvm resource and enable it on single node.

## rootcause:

we can see step 3,4,5 is useless if step 3 is non-existent. 
So the rootcause is step <3>: node A auto activate shared vg/lv.

## discussion (how to fix):

Could activation/auto_activation_volume_list support a new symbol/function like "!".
e.g.
auto_activation_volume_list = [ "!vg1", "!vg2/lvol1" ]
the '!' means lvm absolutely doesn't active this vg1 & vg2/lvol1 automatically.

my question:
Does it acceptable for LVM2 adding this new function?

Thanks.
