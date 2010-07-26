Date: Mon, 26 Jul 2010 09:59:05 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4C4D82E6.3080303@redhat.com>
Message-ID: <Pine.LNX.4.64.1007260955200.3625@bmsred.bmsi.com>
References: <1279942095.12963.1386480183@webmail.messagingengine.com>
	<4C4D4B47.8000201@redhat.com>
	<Pine.LNX.4.64.1007260805250.3000@bmsred.bmsi.com>
	<4C4D82E6.3080303@redhat.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: giovanni_re <john_re@fastmail.us>, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 26 Jul 2010, Bryn M. Reeves wrote:

> > Using Xen modified OSes, you don't need to partition the LVs.  The 
> > xen storage driver presents each mapped block device as a virtual
> > partition.
> 
> Not used Xen for a long time but that's good to know - iirc it did not
> behave like this the last time I used it (with xvda disks).

xen disk definition on dom0:

disk = [ "phy:/dev/rootvg/C5MAIL,xvda1,w",
         "phy:/dev/rootvg/M_SWAP,xvda2,w",
	 "phy:/dev/rootvg/MAIL,xvda3,w" ]

What guest OS running xen kernel sees:

# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/xvda1            10165048   1554800   8190820  16% /
/dev/xvda3            83716784  48877780  30644700  62% /home
tmpfs                  1048664         0   1048664   0% /dev/shm

However, it doesn't go so far as to let you access the first sector
of /dev/xvda

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
