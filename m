Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9L5Rnip032601
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2010 01:27:49 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9L5RYqY013861
	for <linux-lvm@redhat.com>; Thu, 21 Oct 2010 01:27:34 -0400
Received: by wyb28 with SMTP id 28so4845232wyb.33
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2010 22:27:34 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 21 Oct 2010 03:27:33 -0200
Message-ID: <AANLkTinB4J+NkZHt1buQsFeZU7ErrvkR+wKMMssJrHQx@mail.gmail.com>
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
This box has 24x 1,5T SATA II disks, 3 controllers 3ware
PCI-Express,6G ram memory DDR3 1333Mhz. This disks are distributed for
each controller, 8 disks for each one.  I've done at each controller
Raid 10 with 256k stripe size, then I've created one volume group with
all disks and I've created one logical volume with 10G, 3 stripes and
256k of stripe size. I've gotten a great result with it, but i'd like
to know what all think about it.

Sorry my last e-mail, I'm falling asleep and i've sent  unintentionally.


Thanks all,
Fabricio
