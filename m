Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i82DSC315795
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 09:28:12 -0400
Received: from main.gmane.org (main.gmane.org [80.91.224.249])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i82DS2S0008274
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 09:28:11 -0400
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1C2rdC-0007Ji-00
	for <linux-lvm@redhat.com>; Thu, 02 Sep 2004 15:28:02 +0200
Received: from adsl-214-28-210.asm.bellsouth.net ([68.214.28.210])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 02 Sep 2004 15:28:01 +0200
Received: from ecashin by adsl-214-28-210.asm.bellsouth.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 02 Sep 2004 15:28:01 +0200
From: Ed L Cashin <ecashin@coraid.com>
Date: Thu, 02 Sep 2004 09:27:58 -0400
Message-ID: <874qmghkbl.fsf@coraid.com>
References: <87k6vdhf0p.fsf@coraid.com>
Mime-Version: 1.0
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: LVM2 configure options for CLVM with GFS
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Ed L Cashin <ecashin@coraid.com> writes:

...
>   --with-pool=TYPE        GFS pool read-only support: internal/shared/none
>                           TYPE=internal
>   --with-cluster=TYPE     Cluster LVM locking support: internal/shared/none
>                           TYPE=internal
>   --with-snapshots=TYPE   Snapshot support: internal/shared/none
>                           TYPE=internal
>   --with-mirrors=TYPE     Mirror support: internal/shared/none
>                           TYPE=internal

Alasdair pointed out to me in the IRC channel that these options do
not configure LVM's ability to share state with other nodes in the
cluster.  Rather, they simply choose how to link in the components of
the LVM binaries -- shared or static.

So it doesn't matter, and the example in GFS' usage.txt should work
fine. 

-- 
  Ed L Cashin <ecashin@coraid.com>
