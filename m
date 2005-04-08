Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j38GGGO02243
	for <linux-lvm@redhat.com>; Fri, 8 Apr 2005 12:16:16 -0400
Received: from postfix3-1.free.fr (postfix3-1.free.fr [213.228.0.44])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j38GGFeF029126
	for <linux-lvm@redhat.com>; Fri, 8 Apr 2005 12:16:15 -0400
Message-ID: <4256AE5A.3010904@free.fr>
Date: Fri, 08 Apr 2005 18:16:26 +0200
From: Stephane Dupuis <Hoper@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Debian (Sarge) 2.6.8 lvm2 on software raid
References: <11707185.1112814904249.JavaMail.root@wamui03.slb.atl.earthlink.net>
In-Reply-To: <11707185.1112814904249.JavaMail.root@wamui03.slb.atl.earthlink.net>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "linuxboy123@mindspring.com" <linuxboy123@mindspring.com>, LVM general discussion and development <linux-lvm@redhat.com>


Hi,

 > # lvcreate -L 500 /dev/vg00
 >   Volume group "vg00" doesn't exist

Did you try : lvcreate -L 500 vg00
I think you don't need the /dev

About the change in lvm.conf, I had to do it once,
for using LVM over a /dev/mapper device.
Anyway it's just a filter you can change to tell LVM
what device it can or canot use for creating VG.
I'm quite sure you don't need to change anything to
be abble to use LVM over a software raid device.
