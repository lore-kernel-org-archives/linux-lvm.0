Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GG68md012497
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 12:06:09 -0400
Received: from mrpostman.ahc.uk.com (mrpostman.ahc.uk.com [217.33.8.131])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8GG5nvC000858
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 12:05:50 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Wed, 16 Sep 2009 17:05:04 +0100
Message-ID: <7D744808831C6C47A09643429C7095814CFA05@mrpostman.ahc.uk.com>
From: "Mark Round" <mark.round@ahc.uk.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Shared access to LVM2 metadata
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

Hi all,

Quick question - is this page :
http://tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html only applicable to
LVM1, and not LVM2 ? I suspect that it is, based on the URL and my own
experiments but would like to be certain.

The reason I ask is that I have a number of hosts on a SAN (Xen Dom0
systems), which utilise a shared block device. I want to create a volume
group on this block device, and split this up into LVMs for each virtual
machine. The Dom0 systems would then see all volumes, although each
volume would only be active and mounted on one host at a time. 

I have run my own tests, and I can see that if I create, modify or
delete logical volumes within a shared volume group on one host, the
changes are immediately reflected on another (e.g. "lvcreate" on one
host shows the volume immediately on the other host with "lvs"). 

I have tried creating, resizing, delete, and performing various
file-system related activity on this shared volume group, and I haven't
run into any kind of LVM metadata or filesystem corruption, and was
happy to put this into production. But the stark warnings in that
document made me wary - am I missing something ? Am I risking some form
of latent LVM2 metadata corruption ?

Googling around didn't produce a definitive answer, so I apologise if
this has already been asked before.

Many thanks,

-Mark
