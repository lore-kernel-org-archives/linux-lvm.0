Return-Path: <jamesp@foobarhouse.com>
Date: Thu, 26 Jul 2001 00:39:20 +0100 (BST)
From: James Pattinson <jamesp@foobarhouse.com>
Subject: Re: [linux-lvm] lvm on root
In-Reply-To: <Pine.LNX.4.33.0107251827170.28361-100000@willow.nutstreet.net>
Message-ID: <Pine.LNX.4.33.0107260038030.3644-100000@greebo.foobarhouse.com>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Because it looks nice, and for the geek-factor :)

[root@greebo /root]# bdf
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/vg00/lvol1         262132     92988    169144  36% /
/dev/vg00/lvol2        3145628   2382316    763312  76% /usr
/dev/vg00/lvol3         262132    103400    158732  40% /var
/dev/vg00/lvol4        1048540    885832    162708  85% /opt
/dev/vg00/lvol5        4194172   2321108   1873064  56% /root
/dev/vg00/lvol6        4194172   2621036   1573136  63% /home
/dev/ide/host2/bus0/target0/lun0/part2
                         38859      7052     29801  20% /stand
/dev/vg00/mp3          8388348   6747516   1640832  81% /mp3
/dev/vg00/cache01       262132    189084     73048  73% /var/spool/squid
tmpfs                   131072         8    131064   1% /tmp

James

On Wed, 25 Jul 2001, Eric Smith wrote:

> Why do it?  Surely no one puts apps on root...why would you need lvm?
> Seems it would only add unneeded complexity and buys you...what?
>
> Pardon my ignorance, and I appreciate your help!
>
> -----
> Eric Smith
> Wholly and completely uneducated person
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
