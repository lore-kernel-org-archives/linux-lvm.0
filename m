Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB61010F26E0
	for <linux-lvm@redhat.com>; Wed,  8 Jul 2020 03:56:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C13298008A5
	for <linux-lvm@redhat.com>; Wed,  8 Jul 2020 03:56:03 +0000 (UTC)
From: Gang He <GHe@suse.com>
Date: Wed, 8 Jul 2020 03:55:55 +0000
Message-ID: <HE1PR0402MB3514D6153AB2978268A015BDCF670@HE1PR0402MB3514.eurprd04.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] About online pvmove/lvresize on shared VG
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hello List,

I use lvm2-2.03.05, I am looking at online pvmove/lvresize on shared VG, since there are some problems in old code.
Now, I setup three node cluster, and one shared VG/LV, and a cluster file system on top of LV.
e.g.
primitive ocfs2-2 Filesystem \
params device="/dev/vg1/lv1" directory="/mnt/ocfs2" fstype=ocfs2 options=acl \
op monitor interval=20 timeout=40
primitive vg1 LVM-activate \
params vgname=vg1 vg_access_mode=lvmlockd activation_mode=shared \
op start timeout=90s interval=0 \
op stop timeout=90s interval=0 \
op monitor interval=30s timeout=90s \
meta target-role=Started
group base-group dlm lvmlockd vg1 ocfs2-2

Now, I can do online LV extend from one node (good),
but I cannot do online LV reduce from one node, 
the workaround is to switch VG activation_mode to exclusive, run lvreduce command on the node where VG is activated.
Does this behaviour is by-design? or a bug?

For pvmove command, I cannot do online pvmove from one node,
The workaround is to switch VG activation_mode to exclusive, run pvmove command on the node where VG is activated.
Does this behaviour is by-design? do we do some enhancements in the furture?
or any workaround to run pvmove under shared  activation_mode? e.g. --lockopt option can help this situation?

Thanks a lot.
Gang
