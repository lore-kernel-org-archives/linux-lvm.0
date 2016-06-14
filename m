Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5ELoxWb025107
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 17:51:00 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D176490E5C
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 21:50:56 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id AD2367F5B3
	for <linux-lvm@redhat.com>; Tue, 14 Jun 2016 23:50:54 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 14 Jun 2016 23:50:54 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <acceb03e2956c251bf847b4b9eb4d315@dds.nl>
Subject: [linux-lvm] cache IO blocking
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

I am sorry if this sounds repetitive,


I have an SDD + HDD cache combination.

And I am not sure it is not related to the SSD entirely.



I do test runs of dd if=/dev/zero of=/dev/<vg>/<cached lv>, and the 
system can freeze when I do so.

The cache for the specific volume I dd to is very small in relation to 
the volume itself.

However, that "vault cache" is not even used (1 block out of 60800) yet.


So I am writing to the combined volume called /dev/linux/vault.

   vault               linux Cwi-aoC--- 435,27g [vault_cache] 
[vault_corig] 0,00   9,18            0,00
   [vault_cache]       linux Cwi---C---   3,71g                           
   0,00   9,18            0,00
   [vault_cache_cdata] linux Cwi-ao----   3,71g
   [vault_cache_cmeta] linux ewi-ao----   8,00m
   [vault_corig]       linux owi-aoC--- 435,27g


I try to put a little load on the system (such as media library rescan) 
and processes can block for more than 2 minutes.

Such that a TTY will output messages such that "Process <X> has been 
blocking for more than 120 seconds".

It doesn't happen all the time or constantly. The first 2 test runs, it 
did happen. Without the cache, it hasn't happened yet.

I mean without the cache to "vault". "root" is also cached using the 
same:

   root                linux Cwi-aoC---  20,00g [root_cache]  
[root_corig]  64,74  11,95           0,00
   [root_cache]        linux Cwi---C---   7,42g                           
   64,74  11,95           0,00
   [root_cache_cdata]  linux Cwi-ao----   7,42g
   [root_cache_cmeta]  linux ewi-ao----  12,00m
   [root_corig]        linux owi-aoC---  20,00g


So basically I can get _huge IO blocking_ where the CPU (top) is 
indicating waiting for IO, (io wait is near 100%) and the entire system 
freezes for basically all pieces of harddisk IO, (to the affected 
drives) for a cache that is not actually getting utilized much (as I 
said, 1/60800 currently) but writing to it causes the other volume (in 
this case) (which is "root") to block IO.

So "vault_cache" and "root_cache" are both on the SSD, and "vault_corig" 
and "root_corig" are both on the HDD. Writing to "vault" using DD can 
cause "root" to stop responding, in the sense of incurring huge IO 
blocks.

This is irrespective of cache mode (writethrough/writeback) and cache 
policy (smq vs mq). And I wonder if this is just related to the SSD, or 
whether I will keep seeing this behaviour when I replace it.

Regards.
