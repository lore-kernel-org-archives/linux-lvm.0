Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2GGeaJ5014846
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 12:40:36 -0400
Received: from vodka.alita.cc (vodka.trans.am [62.12.162.173])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2GGeNkI010217
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 12:40:24 -0400
Received: from localhost (localhost [127.0.0.1])
	by localhost.alita.cc (Postfix) with ESMTP id E0C5840B61C1
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 17:40:22 +0100 (CET)
Received: from vodka.alita.cc ([127.0.0.1])
	by localhost (vodka.alita.cc [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id haGWtwIzXC1X for <linux-lvm@redhat.com>;
	Tue, 16 Mar 2010 17:40:20 +0100 (CET)
Received: from trans.am (localhost [127.0.0.1])
	by vodka.alita.cc (Postfix) with ESMTP id 4B0CA40B61AB
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 17:40:20 +0100 (CET)
Message-ID: <4ec1d19a71ad4c8a10b487a3cf49840f.squirrel@trans.am>
Date: Tue, 16 Mar 2010 17:40:20 +0100
From: blub@trans.am
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Multipath / LVM2
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

hello

I have troubles to get multipathing working on gentoo. I have an identical
setup working on a debian box.
The problem is that LVM does not detect labels on the multipath device
node; instead it does try to use a physical path (eg /dev/sda1)

the device nodes /dev/dm-X are not automaticaly created like they get on
debian, I did run dmsetup mknodes which did not create /dev/dm-X nodes, so
i created /dev/dm-0 with the minor/major of the corresponding /dev/mapper/
node. I don't know if this is a problem.

anyway, I've pasted alot of output to http://pastebin.com/wheL4nyE

hope somebody can help me :)

regards
