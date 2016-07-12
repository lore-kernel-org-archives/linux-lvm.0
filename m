Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6CFNtpo013026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 12 Jul 2016 11:23:55 -0400
Received: from nm10-vm4.bullet.mail.ir2.yahoo.com
	(nm10-vm4.bullet.mail.ir2.yahoo.com [212.82.96.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98F0281F07
	for <linux-lvm@redhat.com>; Tue, 12 Jul 2016 15:23:53 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <96ed1c73-85ca-f20d-f249-cf1d775c0a92@yahoo.co.uk>
Date: Tue, 12 Jul 2016 16:23:51 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] export/migrate - but only a LV - how?
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

.. if possible?

hi users,

I'd like to ask, while reading different docs, whether it's 
possible to migrate/export just a LV?

What I'm hoping to achieve is to take a LV out of a VG and 
move it over to another system so a can restore that LV and 
carry on using it, while having a reduced VG on original, 
source system.

I see there some docs tell how to do a VG, how only a LV can 
be migrated?

many thanks
