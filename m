Subject: Re: [linux-lvm] Re: LVM writes on raw disk of ATA RAID Mirror
From: Andrew Rechenberg <arechenberg@shermfin.com>
In-Reply-To: <20030430193030.AF83AAE4F5@basilica.la.naos.co.nz>
References: <20030430193030.AF83AAE4F5@basilica.la.naos.co.nz>
Content-Transfer-Encoding: 7bit
Message-Id: <1051902402.4660.430.camel@cinshrlnxws01.shermfin.com>
Mime-Version: 1.0
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
Date: Fri May  2 14:07:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I forgot to mention that I move the md0 entry back into place after I
run vgscan.  It's worked quite well and across numerous reboots. 

It is VERY ugly, but it "Works For Me(TM)" :)

On Wed, 2003-04-30 at 15:30, Ewen McNeill wrote:
> In message <1051724087.19901.287.camel@cinshrlnxws01.shermfin.com>, Andrew Reche
> nberg writes:
> >>[LVM 1.0.x; vgscan finds parts of RAID arrays and uses those instead]
> >vgscan has similar problems with MD devices in a software RAID10 (but
> >not RAID1) configuration. [...]
> 
> Interesting.  I've been told, and found in the source, that there were
> some hacks in LVM to make LVM and md work in some common situations
> (basically there's a loop after the first device scan which tries to
> eliminate some of the duplicates; and there's a /* FIXME */ comment
> immediately before that loop).  It seems that you've found one of
> the situations where these hacks are too limited.
> 
> >I was trying to hack vgscan to get my setup working but I needed the box
> >working ASAP so time dictated that I use the KludgeMethod(tm).  Someone
> >on the list recommended that I move /dev/md0 before I run my vgscan. 
> >[....]
> 
> That is really quite ugly :-)  I suspect something like that might work
> for the ataraid case too, right up to the point that someone runs vgscan
> for some reason without going through the "hide things from vgscan so it
> doesn't get it wrong" ritual -- at which point (with a little prompting)
> it silently swaps over to using part of the RAID array, and the RAID
> array gets out of sync, and then on next reboot it swaps back to using
> the RAID array, and the partitions are corrupt.
> 
> I'm afraid that's a little too much potential excitement for my liking!
> 
> I've been told that LVM 2 has some support where you can say what
> devices to scan (and what devices not to scan).  I've not looked at LVM
> 2 yet, so I don't know how fine grained it is, but it might suit your
> situation.
> 
> However after all this investigation I can't help thinking that the LVM
> vgscan approach is broken by design, particularly to be run automatically
> on startup.  The idea that one can somehow look through all the connected
> devices and guess which one to use, and then automatically use those
> guesses on the assumption they'll always be right, just seems to be asking
> for trouble.  Static configuration files, and having these things under
> manual control, seems a far more reliable way to approach the situation.
> 
> For now this ataraid system will be built without LVM, as it seems the
> only way to be sure that the RAID array will actually always be used.
> 
> Thanks for your comments,
> 
> Ewen
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Andrew Rechenberg <arechenberg@shermfin.com>
Infrastrucutre Team, Sherman Financial Group
