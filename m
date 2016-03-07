Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.rdu2.redhat.com
	[10.11.55.2])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u27Ka2FA017764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 7 Mar 2016 15:36:03 -0500
Received: from bella.media.mit.edu (bella.media.mit.edu [18.85.58.176])
	by mx1.redhat.com (Postfix) with ESMTP id 922C22A6C2
	for <linux-lvm@redhat.com>; Mon,  7 Mar 2016 20:36:01 +0000 (UTC)
From: f-lvm@media.mit.edu
In-reply-to: <56DDBAF8.8040105@yahoo.co.uk> (message from lejeczek on Mon, 7
	Mar 2016 17:31:36 +0000)
References: <56DDBAF8.8040105@yahoo.co.uk>
Message-Id: <20160307202920.1529D403BC@darkstar.media.mit.edu>
Date: Mon,  7 Mar 2016 15:29:20 -0500 (EST)
Subject: Re: [linux-lvm] lvm protected against crypt/luks
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

    > Date: Mon, 7 Mar 2016 17:31:36 +0000
    > From: lejeczek <peljasz@yahoo.co.uk>

    > hi there

    > would you know if kernel/lvm protects PVs (or any other 
    > parts for that matter) from being encrypted?

Not that I've ever seen.

    > Do I need to wipe block devices clean off any LVM traces in 
    > order to encrypt them?

No.

    > BTW, LVs cannot be luks encrypted, can they?

Yes, they can.  I do this routinely.

LVM is agnostic about what's inside any LV.  They're just blocks.

I often build filesystems with either bare disk or RAID on the bottom,
with LVM on top of that, LUKS on top of that, and ext4fs (for example)
on top of that.  By using LVM under LUKS, I can make a single FS that
spans multiple disks but is entirely encrypted with a single key.
