Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3RAoNh8013520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 06:50:23 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B8BBC00B8E5
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 10:50:17 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 5EEA67FB8F
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 12:50:13 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 27 Apr 2016 10:50:13 +0000
From: Xen <list@xenhideout.nl>
Message-ID: <29e7f847e1150949aa52c58fa33cf8cd@dds.nl>
Subject: [linux-lvm] 2 questions on LVM cache
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux lvm <linux-lvm@redhat.com>

1. Does LVM cache support discards of the underlying blocks (in the 
cache) when the filesystem discards the blocks?

I was reading https://lwn.net/Articles/293658/ which makes it clear that 
years ago kernel developers were introducing discard behaviour into 
Linux filesystems with respect to flash devices and their need to copy 
for wear leveling.

I know so little about it, but I have seen the "discard" flag mentioned 
so much with respect to SSDs, that I must assume these discards are 
there. Are LVM cache blocks discarded when the filesystem layer discards 
these blocks?

Where can I find this info?

In https://www.redhat.com/archives/linux-lvm/2016-April/msg00030.html I 
mentioned that such a discard feature would be necessary in order for a 
filesystem to communicate to a block device layer which blocks are in 
use, and for a block device layer to communicate back a set of available 
blocks if these dynamically change.




I forgot the other question lol.

I'm interested in this solution to 
"https://bugzilla.redhat.com/show_bug.cgi?id=1189215" but I will respond 
in my other email (LVM Thin: Handle out of space conditions better).
