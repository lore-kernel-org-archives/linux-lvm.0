Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qAEFGKJF028100
	for <linux-lvm@redhat.com>; Wed, 14 Nov 2012 10:16:20 -0500
Received: from tropek.jajcus.net (tropek.jajcus.net [84.205.176.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAEFGIXm021310
	for <linux-lvm@redhat.com>; Wed, 14 Nov 2012 10:16:18 -0500
Received: from localhost (jajo.ipv6.eggsoft.pl [IPv6:2001:6a0:117::1])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by tropek.jajcus.net (Postfix) with ESMTPSA id 8CD155002
	for <linux-lvm@redhat.com>; Wed, 14 Nov 2012 16:16:16 +0100 (CET)
Date: Wed, 14 Nov 2012 16:16:13 +0100
From: Jacek Konieczny <jajcus@jajcus.net>
Message-ID: <20121114151612.GD14396@jajo.eggsoft>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Why do lvcreate with clvmd insist on VG being available
	on all nodes?
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hello,

I am building a system where I use clustered LVM on a DRBD to provide
shared block devices in a cluster. And I don't quite like and quite not
understand some behaviour.

Currently I have two nodes in the cluster, running: Corosync, DLM,
clvmd, DRBD, Pacemaker and my service.

Everything works fine when both nodes are up. When I put one to standby
with 'crm node node1 standby' (which, among others, stops the DRBD) the
other note is not fully functional.

If I leave DLM and CLVMD running on the inactive node, then:

lvchange -aey shared_vg/vol_name
lvchange -aen shared_vg/vol_name

work properly, as I would expect (make the volume available/unavailable
on the node). But an attempt to create a new volume:

lvcreate -n new_volume -L 1M shared_vg

fails with:

Error locking on node 1: Volume group for uuid not found: Hlk5NeaVF0qhDF20RBq61EZaIj5yyUJgGyMo5AQcLfZpJS0DZUcgj7QMd3QPWICL

Indeed, the VG is not available at the standby node at that moment. But,
as it is not available there, I see no point in locking it there.



Is there some real, important reason to block lvcreate in such case?




I have also tried stopping (cleanly) dlm_controld and clvmd on the standby node,
hoping LVM will then work like in a single-node cluster, but then even
volume activation fails with:

  cluster request failed: Host is down

…until I restart clvmd on the active host with 'clvmd -S'.

When clvmd is stopped on the inactive node and 'clvmd -S' has been run
on the active node, then both 'lvchange' and 'lvcreate' work as
expected, but that doesn't look like a graceful switch-over. And another
'clvmd -S' stopped clvmd all together (this seems like a bug to me)

And one more thing bothers me… my system would be very scalable to many
nodes, where only two share active storage (when using DRBD). But this
won't work if LVM would refuse some operations when any VG is not
available on all nodes.

Greets,
        Jacek
