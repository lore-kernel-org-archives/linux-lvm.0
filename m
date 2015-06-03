Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t539rfge003657
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 3 Jun 2015 05:53:41 -0400
Received: from nm18.bullet.mail.ir2.yahoo.com (nm18.bullet.mail.ir2.yahoo.com
	[212.82.96.41]) by mx1.redhat.com (Postfix) with ESMTPS id DC0066C
	for <linux-lvm@redhat.com>; Wed,  3 Jun 2015 09:53:39 +0000 (UTC)
Message-ID: <556ECEA1.1010003@yahoo.co.uk>
Date: Wed, 03 Jun 2015 10:53:37 +0100
From: lejeczek <peljasz@yahoo.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM LV raid5 - can it be extended?
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

hi everybody

I wonder - is it feasible and safe to extend LV raid5?
I'd be trying to add a few more disks which will become PVs 
in their entirety, then use whole PVs to extend LV.

Also if possible interesting would be to know if resyncing 
such an extended LV could be negated by re-creating LV anew 
if it's (resync) faster.
In other words: lvextend raid5 + resync VS lv(re)create 
raid5 resync.

many thanks
