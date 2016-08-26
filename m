Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7Q5EAjm018634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 01:14:10 -0400
Received: from nexus.subspacefield.org (nexus.subspacefield.org
	[64.156.192.208])
	(using TLSv1 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8218661E58
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2016 05:14:09 +0000 (UTC)
Resent-Message-ID: <20160826050823.GA27397@subspacefield.org>
Resent-To: linux-lvm@redhat.com
Date: Thu, 25 Aug 2016 21:20:22 -0700
From: travis+ml-linux-lvm@subspacefield.org
Message-ID: <20160826042022.GS1534@subspacefield.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] automatic repartitioning of devices in
	/etc/lvm/cache/.cache?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm-request@redhat.com

Hello, I've got a persistent problem in that the second two disks of my array
occasionally have their heads wiped, with a GPT showing up at the beginning
of the partition, with the same partitioning structure as the main disk GPT.

The overall structure is:

md127 = /dev/sd{b,c,d,e}1
LUKS on that
PV/VG/LV on that.

So my ONLY lead so far, that distinguishes sd{d,e}1 (which get wiped)
from sd{b,c}1 is that they were listed in /etc/lvm/cache/.cache.

Is there any way that being listed there could be a side effect, or be
a cause, of disk partition corruption in those devices?

This system crashed and failed to recover, but I strongly suspect that
it was unattended and un-administered between the last boot and an
unrelated kernel panic, whereupon I discovered the disk corruption.

So, I'm wondering, is there any unattended process, or possibly any one
triggered by an admin, that would re-partition a device listed there,
or restore a GPT from backup or something?
-- 
http://www.subspacefield.org/~travis/ | if spammer then john@subspacefield.org
"Computer crime, the glamor crime of the 1970s, will become in the
1980s one of the greatest sources of preventable business loss."
John M. Carroll, "Computer Security", first edition cover flap, 1977
