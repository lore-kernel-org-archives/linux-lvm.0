Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qAE8pU37022190
	for <linux-lvm@redhat.com>; Wed, 14 Nov 2012 03:51:30 -0500
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAE8pTC8029124
	for <linux-lvm@redhat.com>; Wed, 14 Nov 2012 03:51:30 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so225323pbc.33
	for <linux-lvm@redhat.com>; Wed, 14 Nov 2012 00:51:29 -0800 (PST)
Date: Wed, 14 Nov 2012 16:51:47 +0800
From: majianpeng <majianpeng@gmail.com>
Mime-Version: 1.0
Message-ID: <201211141651437145651@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM and Raid5 alignment
Reply-To: majianpeng <majianpeng@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm <linux-lvm@redhat.com>

Hi all,
	In this thread:http://www.redhat.com/archives/linux-lvm/2009-September/msg00090.html, it talked about lvm and raid5 alignment.
As it said, when created pv, it thought the alignment.So the first lv must be aligned with stripe.But the second,third lv(specifically for linear)?
I'm used latest lvm2 to test and also found this problem.
I think we be  add parameter like "lv-alignment" when creating lv to avoiding this problem.


Thanks!
Jianpeng
