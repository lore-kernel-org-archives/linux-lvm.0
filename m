Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u67G1YUw020415
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 7 Jul 2016 12:01:34 -0400
Received: from nm15-vm3.bullet.mail.ir2.yahoo.com
	(nm15-vm3.bullet.mail.ir2.yahoo.com [212.82.96.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F367B461D3
	for <linux-lvm@redhat.com>; Thu,  7 Jul 2016 16:01:32 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <c6001912-30cb-11a8-0481-4689718155cd@yahoo.co.uk>
Date: Thu, 7 Jul 2016 17:01:31 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove and filesystem - un/mount?
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

hi users,

must be an easy one - what should be(is allowed to do) 
filesystem doing while there is a pvmove(failed hard disk) 
taking place in underlying LV?

many thanks,

L
