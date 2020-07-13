Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0AE12156A2D
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2020 14:51:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6FFF858EE4
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2020 14:51:24 +0000 (UTC)
Message-Id: <1juzXg-0002Wp-5c@mx1.helsinki.tools>
From: =?utf-8?q?Janne_He=C3=9F?= <janne+lvm@hess.ooo>
MIME-Version: 1.0
Date: Mon, 13 Jul 2020 16:34:52 +0200
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] =?utf-8?q?RAID-less_parity=3F?=
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
To: linux-lvm@redhat.com

Hello everyone,

I'm currently testing dm-integrity and its use with LVM.
For RAID 1,5,6 LVM should just be able to recover the RAID when integrity fails (and the block device returns a read error).
However some of my systems are single-disk systems. For those, RAIDs are not possible so I was thinking if LVM has some support for single-PV setups with parity on the same PV.
While this is probably a niche feature right now, I can see other projects like Stratis benefit from the integrity checks provided by dm-integrity (and dm-crypt in the future) to detect (and thanks to parity fix) bit rots.
So is there any way to get a parity setup with the current state of LVM? I was thinking of a RAID-4 with one PV but the current tooling (more specifically lvcreate) doesn't let me do that.

Thanks and regards
Janne
