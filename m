Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBN7Y7119716
	for <linux-lvm@redhat.com>; Fri, 23 Dec 2005 02:34:07 -0500
Received: from ramoth.dragonhold.org (ramoth.dragonhold.org [80.229.192.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBN7Y3JL029755
	for <linux-lvm@redhat.com>; Fri, 23 Dec 2005 02:34:03 -0500
Message-ID: <12325.208.178.77.200.1135323228.squirrel@mnementh.dragonhold.org>
In-Reply-To: <20051222131023.2E6280035DF3@relay.vip.sohu.com>
References: <20051222131023.2E6280035DF3@relay.vip.sohu.com>
Date: Fri, 23 Dec 2005 07:33:48 -0000 (GMT)
Subject: Re: [linux-lvm] a question about lvm in linux
From: gwood@dragonhold.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-lvm@sistina.com

> Hello ,I am a linux user, because I am a Chinese ,so my English is not
> good
> ,please forgive me for language mistake. after I used the command -----
> lvextend ,I find that the logical volumn space is changed .but after I
> mount
> it to the file  system , and use the df command to see the filesystem, I
> find that the space of the file system is not changed .

The filesystem needs to be extended independently of the underlying block
device.  You will need to look at the man pages for the filesystem you are
using.

For example, xfs_growfs for xfs and ext2online for ext2/ext3.

Hope this helps,

Graham
