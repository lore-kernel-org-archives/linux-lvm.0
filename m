Message-ID: <3560BA143F45D5118E670000E82459214C2084@ssk.schneiderkenzingen.de>
From: "Koch, Steffen" <steffen.koch@sphinx-electronics.de>
Subject: RE: [linux-lvm] snapshots+highmem+'md raid5'
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
Date: Thu Jun 12 08:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> > Anyone out there using MD RAID5 as physical volumes, high 
> memory enabled
> > (> 960m of physical memory) and snapshots under load successfully ?
> FYI: I use MD RAID5 as physical but I had to disable the
> himem completely, because otherwise 1.0.7 would live-lock
> the entire system ...

I've a similar problem. My machine has only 768M RAM but I think it may be
related. I've 4 IDE disks making up a MD raid5. This md is a single PV in a
VG. If I copy some amount of data (mostly from about 2-4 gigabytes) to a LV
created in that VG the complete system locks up, no chance to press
ctrl-alt-del, only hard reset works.

If someone has a solution for this please help.

BTW: I'm using LVM 1.0.7
