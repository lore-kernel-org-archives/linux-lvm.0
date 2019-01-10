Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DCB719940
	for <linux-lvm@redhat.com>; Thu, 10 Jan 2019 03:06:10 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
	[209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 186C981DE2
	for <linux-lvm@redhat.com>; Thu, 10 Jan 2019 03:06:10 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id t204so8137096oie.7
	for <linux-lvm@redhat.com>; Wed, 09 Jan 2019 19:06:10 -0800 (PST)
MIME-Version: 1.0
From: james harvey <jamespharvey20@gmail.com>
Date: Wed, 9 Jan 2019 22:05:58 -0500
Message-ID: <CA+X5Wn6TiCUp7aEn5Tkc8vpZfET9-7Ke2Wh1GHTOwy3CrMvN+w@mail.gmail.com>
Subject: [linux-lvm] Is "man lvcreate" for "-Z|--zero" incorrectly worded?
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
To: linux-lvm@redhat.com

On lvm2 2.02.183, man lvcreate includes:

-Z|--zero y|n
   Controls zeroing of the first 4KiB of data in the new LV.  Default
is y.  Snapshot COW volumes are always zeroed.  LV is not zeroed if
the read only flag is set.  Warning: trying to mount an unzeroed LV
can cause the system to hang.

This says only the "first 4KiB" is zeroed.

Yet, when running "lvcreate --chunksize <something large>", it says:

   WARNING: Pool zeroing and ###.00 MiB large chunk size slows down
thin provisioning.
   WARNING: Consider disabling zeroing (-Zn) or using smaller chunk
size (<512.00 KiB).

Which seems to indicate it's going to zero the entire newly allocated
chunk size, rather than only the first 4KiB.

The lvcreate warning goes more along with the purpose of zeroing, to
prevent reading data one shouldn't have access to.
