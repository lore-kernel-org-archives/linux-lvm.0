Received: from [10.36.4.218] (vpn1-4-218.ams2.redhat.com [10.36.4.218])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3H8FOMJ012919
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2015 04:15:25 -0400
Message-ID: <5530C11B.8040401@redhat.com>
Date: Fri, 17 Apr 2015 10:15:23 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <441219761.721822832.1429205868173.JavaMail.root@zimbra39-e7.priv.proxad.net>
In-Reply-To: <441219761.721822832.1429205868173.JavaMail.root@zimbra39-e7.priv.proxad.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Booting through LVM. Possible ?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dne 16.4.2015 v 19:37 georges.giralt@free.fr napsal(a):
> Hello !
> I've got this new laptop which has a traditional disk and an M.2 NGFF SSD disk. So for the first time I'll plan to use LVM on a laptop. (I constantly use LVM at work on bare metal or virtual systems).
> The disk of my laptop is 4K sector size, GPT partitioned with an EFI partition for some utilities and Windows boot, and the SSD can be partitioned.
> As I plan to install a very recent Ubuntu LTS release I wonder is I still need a plain partition for the /boot or if current Grub version can handle /boot out of an lvm lv ?
> I've seen a lot of negative answer so I ask "at the source" ;-)
> Thank you in advance for your answer.

I'd strongly recommend to use separate  /boot partition.

Lvm2 does not support grub - although some distributions pretends so and in 
some cases, like plain linear volume, it somehow works...

Zdenek
