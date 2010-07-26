Message-ID: <4C4D95D6.2040209@redhat.com>
Date: Mon, 26 Jul 2010 15:04:06 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <1279942095.12963.1386480183@webmail.messagingengine.com>
	<4C4D4B47.8000201@redhat.com>
	<Pine.LNX.4.64.1007260805250.3000@bmsred.bmsi.com>
	<4C4D82E6.3080303@redhat.com>
	<Pine.LNX.4.64.1007260955200.3625@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1007260955200.3625@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Disk Partitioning tools, GUI preferably- best for
 LVM Logical Volume Management ; jor
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
To: "Stuart D. Gathman" <stuart@bmsi.com>
Cc: giovanni_re <john_re@fastmail.us>, LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/26/2010 02:59 PM, Stuart D. Gathman wrote:
> On Mon, 26 Jul 2010, Bryn M. Reeves wrote:
> 
>>> Using Xen modified OSes, you don't need to partition the LVs.  The 
>>> xen storage driver presents each mapped block device as a virtual
>>> partition.
>>
>> Not used Xen for a long time but that's good to know - iirc it did not
>> behave like this the last time I used it (with xvda disks).
> 
> xen disk definition on dom0:
> 
> disk = [ "phy:/dev/rootvg/C5MAIL,xvda1,w",
>          "phy:/dev/rootvg/M_SWAP,xvda2,w",
> 	 "phy:/dev/rootvg/MAIL,xvda3,w" ]

Hmm, that's kinda neat. I think when I was using Xen routinely the disk=
syntax was limited to associating a backing store with a whole-disk xvda
device.

> # df
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/xvda1            10165048   1554800   8190820  16% /
> /dev/xvda3            83716784  48877780  30644700  62% /home
> tmpfs                  1048664         0   1048664   0% /dev/shm
> 
> However, it doesn't go so far as to let you access the first sector
> of /dev/xvda

Understandable but I can't help but wondering what happens if you try? :)

Does it return zeros or just error out?

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org/

iEYEARECAAYFAkxNldYACgkQ6YSQoMYUY96mDwCfXn5p/ecOpAgE35ngVgP9nPd0
QJcAoLsrDMAkcaPEpmvEk0r2qAlwcZT6
=AfUs
-----END PGP SIGNATURE-----
