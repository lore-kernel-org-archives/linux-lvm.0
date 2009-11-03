Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA3FA53N026487
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 10:10:05 -0500
Received: from mail2.ontariocreditcorp.com (mail2.ontariocreditcorp.com
	[209.217.204.70])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA3F9rL6030227
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 10:09:54 -0500
Received: from backoffice.bplinux.com
	(pool-98-118-141-73.bflony.fios.verizon.net [98.118.141.73])
	by mail2.ontariocreditcorp.com (8.12.10/8.12.10) with ESMTP id
	nA3F9qZv013642
	for <linux-lvm@redhat.com>; Tue, 3 Nov 2009 10:09:52 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by backoffice.bplinux.com (Postfix) with ESMTP id CBD843E8002
	for <linux-lvm@redhat.com>; Tue,  3 Nov 2009 10:07:45 -0500 (EST)
Received: from backoffice.bplinux.com ([127.0.0.1])
	by localhost (backoffice.bplinux.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id F+VlzOwgjL2x for <linux-lvm@redhat.com>;
	Tue,  3 Nov 2009 10:07:44 -0500 (EST)
Received: from backoffice.bplinux.com (backoffice.bplinux.com [192.168.1.4])
	by backoffice.bplinux.com (Postfix) with ESMTP id 8D92C3E8001
	for <linux-lvm@redhat.com>; Tue,  3 Nov 2009 10:07:44 -0500 (EST)
Date: Tue, 3 Nov 2009 10:07:44 -0500 (EST)
From: Christopher Hawkins <chawkins@bplinux.com>
Message-ID: <29594910.781257260864226.JavaMail.javamailuser@localhost>
In-Reply-To: <21080952.761257260436402.JavaMail.javamailuser@localhost>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] kernel panic on lvcreate
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

Hoping there's a quick answer to this issue and that I'm doing something wrong. Have verified this on 2 machines now, trying a third shortly. When I create a root snapshot on a fairly typical Centos 5.3 server:
lvcreate -s --size=500M --name=LogVol00_snapshot /dev/VolGroup00/LogVol00

then remove it:
lvremove /dev/VolGroup00/LogVol00_snapshot

then create another one later:
lvcreate -s --size=500M --name=LogVol00_snapshot /dev/VolGroup00/LogVol00

I get a kernel panic. The server reboots ok, no issues with corrupt volumes. And the snapshot does exist after the reboot, so it looks like it is getting created ok before the panic stops the machine. Interestingly, lvcreate can create a regular LV without a panic and also a snapshot of another volume, but not another snapshot of the root volume. 

BUT, if I rmeove the snapshot, reboot, and THEN create another root snapshot, it completes without errors. Any ideas on how to flush out lvm2 and manually do whatever is happening on reboot so I can create and remove snapshots without power cycling?

Thanks List!!
  
Christopher Hawkins
