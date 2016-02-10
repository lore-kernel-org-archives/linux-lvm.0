Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1A9hNos031348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 10 Feb 2016 04:43:23 -0500
Received: from nm2-vm6.bullet.mail.ir2.yahoo.com
	(nm2-vm6.bullet.mail.ir2.yahoo.com [212.82.96.86])
	by mx1.redhat.com (Postfix) with ESMTPS id BC03FC00230B
	for <linux-lvm@redhat.com>; Wed, 10 Feb 2016 09:43:22 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <56BB0636.5090403@yahoo.co.uk>
Date: Wed, 10 Feb 2016 09:43:18 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] iscsi loopback of a logical volume
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
To: linux-lvm@redhat.com

fellow users
probably not exactly for lvm list but I hope somebody could 
share an advice or two.
I've looped back my LV and I thinking of best way to mount 
that iscsi device. I though UUID would be natural choice but 
it's exposed twice in this case and I'm not sure how kernel 
would act.
If you have your LVs as iscsi loopbacks how do you mount them?
I thought lvm via iscsi was a good idea, is it?

many thanks
