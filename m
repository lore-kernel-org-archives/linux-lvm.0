Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7617F2166BA3
	for <linux-lvm@redhat.com>; Wed,  2 Sep 2020 18:47:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C614811E78
	for <linux-lvm@redhat.com>; Wed,  2 Sep 2020 18:47:17 +0000 (UTC)
Date: Wed, 2 Sep 2020 20:38:54 +0200 (CEST)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Message-ID: <79061390.1069833.1599071934227.JavaMail.zimbra@karlsbakk.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Looking ahead - tiering with LVM?
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
To: linux-lvm <linux-lvm@redhat.com>
Cc: =?utf-8?Q?H=C3=A5kon?= <hawken@thehawken.org>

Hi all

I just wonder how it could be possible some day, some year, to make lvm use tiering. I guess this has been debated numerous times before and I found this lvmts project, but it hasn't been updated for eight years or so.

To detail, and I apologize if this is known stuff. I just want to underline what I'm asking for here

We have lvmcache today and it works well. Warm data moves to SSDs or similar to cache what's hot. This is nice, but all writes will eventually go to the "slow" storage in the back. With tiering, such as that used by things like Dell Compellent and suchlike, all writes go to the fast storage, given there is room, or the logical volume is flagged for only to be used with slow storage. Then, in the night or whenever there's little traffic, a batch job runs and moves the cold-ish data from the fast(er) levels to a slow(er) level based on atime/mtime/something, per block, not file. I guess this will be analogous to extents in the terms of LVM (IIRC Compellent uses 8MB blocks, but that's not really relevant). This goes on, if some data on lower (slower) levels become popular for some reason, they are elevated to a higher (faster) level at runtime.

As far as I can understand (that is, without having read the code, it's beyond me) it seems like LVM has most of this already. Perhaps not timestamps per block (which will take up a wee bit of space and I/O), but still multi-PV storage in a single VG.

So - what would it really take to move LVM to something like a working tiered storage platform?

Kind regards

roy
-- 
Roy Sigurd Karlsbakk
(+47) 98013356
http://blogg.karlsbakk.net/
GPG Public key: http://karlsbakk.net/roysigurdkarlsbakk.pubkey.txt
--
Hið góða skaltu í stein höggva, hið illa í snjó rita.
