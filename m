Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u27HVeqI030883
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 7 Mar 2016 12:31:40 -0500
Received: from nm13-vm3.bullet.mail.ir2.yahoo.com
	(nm13-vm3.bullet.mail.ir2.yahoo.com [212.82.96.182])
	by mx1.redhat.com (Postfix) with ESMTPS id 792266113
	for <linux-lvm@redhat.com>; Mon,  7 Mar 2016 17:31:39 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <56DDBAF8.8040105@yahoo.co.uk>
Date: Mon, 7 Mar 2016 17:31:36 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm protected against crypt/luks
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

hi there

would you know if kernel/lvm protects PVs (or any other 
parts for that matter) from being encrypted?
Do I need to wipe block devices clean off any LVM traces in 
order to encrypt them?
BTW, LVs cannot be luks encrypted, can they?

many thanks.
