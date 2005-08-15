Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7FBoEV24561
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2005 07:50:14 -0400
Received: from mail.astral.ro (mail.astral.ro [193.230.240.11])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7FBoCtQ022575
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2005 07:50:13 -0400
Received: from 127.0.0.1 (localhost.localdomain [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id E7C10303E9
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2005 14:50:04 +0300 (EEST)
Received: from [192.168.25.222] (dummy.cluj.astral.ro [193.230.240.25])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.astral.ro (Postfix) with ESMTP id 103A6303E2
	for <linux-lvm@redhat.com>; Mon, 15 Aug 2005 14:50:04 +0300 (EEST)
Message-ID: <4300816B.8060208@astral.ro>
Date: Mon, 15 Aug 2005 14:50:03 +0300
From: Imre Gergely <imre.gergely@astral.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] multiple snapshots
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


hi

i tried to create 2 snapshots of a LV, and i got in trouble ;) with one
snapshot there are apparently no problems, with two the kernel gives me
random oops-es and hangs. first, i tried with the root LV, then i tried
with a simple partition, the result were the same. i created the two
snapshots, after that i did a vgdisplay, there was everything alright, i
mounted the origin LV, i copied some files, i watched the percentage
increasing on the snapshots, then i did a 'ls -la' on the mounted
directory and then the kernel said bye-bye... i don't see any kernel
panic, just the usual register and memory dump, and the hang.

any ideas? don't tell me i cannot have more than one snapshot on one
given LV.

thx.
