Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o9B7uJTl023498
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 03:56:19 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.171])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9B7u4AY023301
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2010 03:56:04 -0400
Message-ID: <4CB2C290.7040307@johestephan.de>
Date: Mon, 11 Oct 2010 09:53:52 +0200
From: =?ISO-8859-15?Q?J=F6rg_Stephan?= <ml@johestephan.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Lvm Strange Problem
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

Hi all,

i have some trouble at work caused by strange thing happend at our lvm
volumes. I hope that some of you have any idea, because i'am out of any
good one.

We use an EMC Storage system with iscsi volume on different xen hosts.
These gentoo hardened xen hosts have an lv on that iscsi target. Now
there are many machines running for more than 400 days. Some days ago
the datacenter moved over to a new building and all the machines were
turned off.
We powered them up, and about 50% of the more than 30 servers on the
iscsi were timestamped 23. feb 2010.

For now it seems that most of the freezed systems were snapshoted last year.

So, any hint would be useful

Thx

Joerg
