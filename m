Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1R3os811323
	for <linux-lvm@redhat.com>; Thu, 26 Feb 2004 22:50:54 -0500
Received: from office.labsysgrp.com (wsip-68-14-253-125.ph.ph.cox.net [68.14.253.125])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1R3orb09680
	for <linux-lvm@redhat.com>; Thu, 26 Feb 2004 22:50:54 -0500
Received: from [127.0.0.1] (helo=localhost)
	by office.labsysgrp.com with esmtp (Exim 4.24)
	id 1AwZ1U-0000aa-BA
	for linux-lvm@redhat.com; Thu, 26 Feb 2004 20:50:48 -0700
Received: from office.labsysgrp.com ([127.0.0.1])
 by localhost (office.lsg.internal [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02240-01 for <linux-lvm@redhat.com>;
 Thu, 26 Feb 2004 20:50:37 -0700 (MST)
Received: from jeeves.kpf.internal ([192.168.170.1])
	by office.labsysgrp.com with esmtp (Exim 4.24)
	id 1AwZ1J-0000aU-QJ
	for linux-lvm@redhat.com; Thu, 26 Feb 2004 20:50:37 -0700
Received: from [192.168.172.107] (helo=backtobasicsmgmt.com)
	by jeeves.kpf.internal with esmtp (Exim 4.05)
	id 1AwZ1J-0001pu-00
	for linux-lvm@redhat.com; Thu, 26 Feb 2004 20:50:37 -0700
Message-ID: <403EBE9A.4060000@backtobasicsmgmt.com>
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Another lvm2create_initrd for having a root filesystem
 on LVM2
References: <403E8A0E.9070308@ist.utl.pt>
In-Reply-To: <403E8A0E.9070308@ist.utl.pt>
Content-Transfer-Encoding: quoted-printable
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 26 22:49:14 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Miguel Cabe=EF=BF=BDa wrote:

> BUSYBOXSYMLINKS=3D"ar cat chgrp chmod chown chroot clear cp cut df dirnam=
e dmesg echo expr false find free grep gunzip gzip halt head hostname id if=
config kill killall klogd linuxrc ln loadkmap logger losetup ls md5sum mkdi=
r mknod mkswap more mount mv ping poweroff ps pwd reboot reset rm rmdir rou=
te sed sleep sort swapoff swapon sync syslogd tail tar test touch tr true t=
ty umount uname uniq uptime wc wget which whoami zcat"

busybox can make its own symlinks, so you shouldn't build them into the=20
script. This will also work better if someone decides to build busybox=20
with a different set of tools than you built it with.
