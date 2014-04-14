Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3E8gPT5002360
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2014 04:42:25 -0400
Received: from smtpo.poczta.interia.pl (smtpo.poczta.interia.pl
	[217.74.65.155])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3E8gNB4009666
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2014 04:42:23 -0400
Date: Mon, 14 Apr 2014 10:42:21 +0200
From: gk180984@interia.pl
Message-Id: <murxfqtymobkgufwnwhr@kvwl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] GRUB boot problem with lvm mirror type raid1
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
To: linux-lvm@redhat.com

Hi
I want to ask it is possible boot root file system (via GRUB) from LVM RAID1 volume?
I can boot root file system (with /boot) from linera LVM volume and from mirror volume, but when I create raid1 mirror GRUB can't boot from it:

lvconvert --type raid1 -m1 gsys/vsys

LVM mirror is work:
lvconvert -m1 gsys/vsys

I have two disk and use only LVM, not other raid software. GRUB have lvm module.
Thanks

-- 
Grzesiek
