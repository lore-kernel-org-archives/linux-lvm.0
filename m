Message-ID: <3DAFB7D4.B88B6737@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Fwd: LVM on ATA-Raid Working - but Poorly
References: <1034915787.3daf8fcb66a42@mail.dornquast.com>
Content-Transfer-Encoding: 7bit
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
Date: Fri Oct 18 02:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Nathan Dornquast wrote:
> 
> Thx, Goetz.

[snip]

> 3ware 7500-4 is on order. ;)  Sadly it adds $260 to box.
> 
> Goetz, I am interested to hear your MD RAID 1/5 - particularly how it handles
> powering off a drive while operating.  Does your box spit, sputter and puke, or
> can you hotswap?  How about with the 3ware card?  Which 3ware card are you
> working with?

i've got 3 3ware cards, and i've tried 3 different kinds.
I've got 2 7410, and one 7810, and i've tried a 7450 (better raid5
performance)
You can hot swap, i've removed drives, i put them back in. You do have
to tell
the controller trough the diskmanagement tool, to use the "new" disk.
But it
works. I've benchmarked all of them vs. software for various raid
devices.
(mirror, stripped, raid10, and raid5)


Unfortunately i forgot to test it with lvm ontop :/




JonB
