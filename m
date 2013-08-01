Message-ID: <51FA3587.3000801@redhat.com>
Date: Thu, 01 Aug 2013 12:16:39 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1375197482-4824-1-git-send-email-christian@iwakd.de>
	<51F8CFDD.5060605@redhat.com>
	<573874159e2a0196c68f44d6b5dc334a@iwakd.de>
	<51F8FEB7.9050004@redhat.com> <51F94911.8080405@iwakd.de>
	<3b25d3821598bb4484b1eb9dde67b3e6@iwakd.de>
In-Reply-To: <3b25d3821598bb4484b1eb9dde67b3e6@iwakd.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] lvremove: perform retry logic also on -real
 subvolume for snapshots
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Christian Seiler <christian@iwakd.de>

Dne 1.8.2013 11:19, Christian Seiler napsal(a):
> Hi again,
>
> so I tried to use the current git version of LVM to see if I could
> reproduce the problem, and I couldn't, even with Debian's udev rules.

The problem with Debian is it's shipped with non-upstream patches which are 
changing whole udev synchronization - and unfortunately they are not correct 
and Debian maintainer is somehow nonresponsive here.
(At least the latest unstable package have been using those udev monitoring 
extentsions).

> Nevertheless, I think it might be a good idea to still apply my patch

Nope. They would mask problems - the code should already handle your
case at different level.

Anyway - before reporting any udev synchronization problem - always check with 
upstream git and udev rules first - since the Debian version is usually 
significantly changed in this area....

Zdenek
