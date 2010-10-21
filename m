Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9L5JALt002915
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2010 01:19:10 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9L5Itv6007609
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2010 01:18:56 -0400
Received: by wyb28 with SMTP id 28so4839843wyb.33
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2010 22:18:54 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 21 Oct 2010 03:18:54 -0200
Message-ID: <AANLkTimQF97gTk5kHh_OqBOLbcX-fJvHD6Fz8dOfwinu@mail.gmail.com>
From: Fabricio Archanjo <farchanjo@gmail.com>
Subject: [linux-lvm] Raid 10 and LVM stripe
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hey all,
I've made a storage by myself.
This box has 24x 1,5T SATA II disks, 3 controllers 3ware PCI-Express,
6G ram memory DDR3 1333Mhz. This disks are distributed for each
controller, 8 disks for each one.  I've done at each controller Raid
10 with 256k stripe size, then I'
