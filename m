Date: Mon, 26 Jul 2010 12:48:25 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4C4D95D6.2040209@redhat.com>
Message-ID: <Pine.LNX.4.64.1007261245490.5669@bmsred.bmsi.com>
References: <1279942095.12963.1386480183@webmail.messagingengine.com>
	<4C4D4B47.8000201@redhat.com>
	<Pine.LNX.4.64.1007260805250.3000@bmsred.bmsi.com>
	<4C4D82E6.3080303@redhat.com>
	<Pine.LNX.4.64.1007260955200.3625@bmsred.bmsi.com>
	<4C4D95D6.2040209@redhat.com>
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

> > # df
> > Filesystem           1K-blocks      Used Available Use% Mounted on
> > /dev/xvda1            10165048   1554800   8190820  16% /
> > /dev/xvda3            83716784  48877780  30644700  62% /home
> > tmpfs                  1048664         0   1048664   0% /dev/shm
> > 
> > However, it doesn't go so far as to let you access the first sector
> > of /dev/xvda
> 
> Understandable but I can't help but wondering what happens if you try? :)
> 
> Does it return zeros or just error out?

It doesn't create the /dev entry:

# ls -l /dev/xvda*
brw-r----- 1 root disk 202, 1 Jul 26 06:11 /dev/xvda1
brw-r----- 1 root disk 202, 2 Jul 26 06:10 /dev/xvda2
brw-r----- 1 root disk 202, 3 Jul 26 06:10 /dev/xvda3

I will try manually creating minor device 0 sometime, but not on a
production system!

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
