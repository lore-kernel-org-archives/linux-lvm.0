Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pB2Ig1SW003101
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 13:42:01 -0500
Received: from mx.binnacle.cx (mx.binnacle.cx [74.95.187.105])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pB2Ig0od010805
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 13:42:01 -0500
Received: from CIANNAIT.binnacle.cx (ciannait [172.29.87.10])
	by mx.binnacle.cx (envelope-from <starlight@binnacle.cx>)
	(8.14.4/8.14.4) with ESMTP id pB2Ifxwt032648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 13:42:00 -0500
Message-Id: <6.2.5.6.2.20111202132949.03b2cc68@binnacle.cx>
Date: Fri, 02 Dec 2011 13:34:24 -0500
From: starlight@binnacle.cx
In-Reply-To: <6.2.5.6.2.20111202121427.03b28738@flumedata.com>
References: <6.2.5.6.2.20111202121427.03b28738@flumedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [linux-lvm] cmp of inactive mirrored LV fails
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

After a little digging discovered and ran 'debugfs'
and used the 'testb' command to determine that the
mirror mismatch blocks are "not in use".

So that's good.

However I am rather disturbed that LVM
mirroring appears to have bugs that allow
images to become out-of-sync.

Have read that MD is the only way to go
with any kind of RAID and now I see that
is true.  If anyone can explain what
happened here in any positive light I'd
be interested in hearing about it.  For
now I see LVM mirroring as a turkey that
should be avoided.

Additional details:

* both LVs with discrepancies are "root"
file system LVs where one or the other
is selected in differing 'grub' boot
configuration lines

* both LVs have an associated mirror log

* in the past have experienced system
lockups due to a mirrored swap volume;
reported it to RH Bugzilla and was
told there are deadlock scenarios in
the kernel and that mirrored swap
volumes are not supported.  This and
today's discovery leads me to the
conclusion that LVM mirroring is
a seriously bad idea.
