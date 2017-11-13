Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB02E7DF46
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2017 13:51:30 +0000 (UTC)
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5B4080099
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2017 13:51:27 +0000 (UTC)
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
Message-ID: <6cfeccb2-b3f6-dbd0-f5b8-b5e79a25baf8@strike.wu.ac.at>
Date: Mon, 13 Nov 2017 14:41:24 +0100
MIME-Version: 1.0
Content-Language: de-AT
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM hangs
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi!

I have a EL7 desktop box with two sata harddisks and two ssds in a
LVM raid1 - thin pool - cache configuration. (Just migrated to this
setup a few weeks ago.)

After some days, individual processes start to block in disk wait.
I don't know if the problem resides in the cache-, thin- or raid1-layer
but the underlying block-devices are fully responsive.

I have prepared some info at:
  http://leo.kloburg.at/tmp/lvm-blocks/

Do the stack backtraces provide enough information to locate the source
of the blocks?

I'd be happy to provide additional info, if necessary.
Meanwhile I'll disable the LVM cache layer to eliminate this potential
candidate.

Cheers,
--leo

Kernel is 3.10.0-693.5.2.el7.x86_64
filesystem is XFS
lvm2-2.02.171-8.el7.x86_64

-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
