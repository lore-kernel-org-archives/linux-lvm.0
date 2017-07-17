Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B61287B8F2
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2017 12:07:31 +0000 (UTC)
Received: from nm40-vm7.bullet.mail.ir2.yahoo.com
	(nm40-vm7.bullet.mail.ir2.yahoo.com [212.82.97.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4AEF4E357
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2017 12:07:28 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <8e7c6f6f-60e7-769b-6294-015287e7d92e@yahoo.co.uk>
Date: Mon, 17 Jul 2017 13:07:26 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Subject: [linux-lvm] raid0 extends?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

hi fellas

quickie - how does one extend raid0(by a whole identical 
phys dev)? Two dev raid0 make three dev raid0.
Is this implemented in:

   LVM version:     2.02.166(2)-RHEL7 (2016-11-16)
   Library version: 1.02.135-RHEL7 (2016-11-16)
   Driver version:  4.34.0

?
many thanks
L.
