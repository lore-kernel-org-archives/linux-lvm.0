From: Ewen McNeill <ewen@naos.co.nz>
Subject: Re: [linux-lvm] Re: LVM writes on raw disk of ATA RAID Mirror 
In-Reply-To: Message from Greg Freemyer <freemyer@NorcrossGroup.com> 
   of "Tue, 29 Apr 2003 18:07:19 -0400." <20030429220328.XULC259.imf39bis.bellsouth.net@tiger2> 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4904.1051656120.1@basilica.la.naos.co.nz>
Message-Id: <20030429224201.13E0AAE4F5@basilica.la.naos.co.nz>
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
Date: Tue Apr 29 17:41:05 2003
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In message <20030429220328.XULC259.imf39bis.bellsouth.net@tiger2>, Greg Freemyer
 writes:
> >>  Now y'all can tell me that the Promise ATA RAID cards suck and I
> >>  shouldn't use them, and I should get a hardware RAID card, [....]
> >>  And I'll happily agree with you, but for two small facts:
> >>  - the hardware RAID cards cost more than twice what the drives cost, and
> >>  they're 120GB IDE drives with large caches; let alone SCSI hardware
> >>  RAID (which also increases the cost of the disks a lot too);
>
>Just thought I would point out that a 2-channel 3ware card is about the price
>of a single 80GB drive.  (i.e. $130 US)

Around here (New Zealand) I can buy a 120GB IDE disk, with a 3 year
warrenty, and a 8MB cache, for that sort of price (NZ$280 -> US$140 ish).

Still, that's a lot closer to the price of the Promise cards (I'd
previously only seen the 3-ware cards with prices around the US$250 ish
sort of mark).   Is that for the 3Ware 7000-2 card, which appears to be
a 2-drive (single IDE channel?), card as best I can tell?  Or for the
3Ware 7500-4LP card which appears to be a 4-drive (2 IDE channel?) card?
(The Promise TX2000, and most of the Promise on-board ata-raid chipsets,
are 2 IDE channels, 4 drives max -- although of course for best
performance you really only want one drive per IDE channel.)

Now all I need to find is a source of 3ware IDE cards in New Zealand;
I haven't found any retail sources so far, and the one distributor I
found mentioned doesn't even have a website in New Zealand (it redirects
to a flash-only overseas website).

Thanks for the comments.

>Obviously, LVM and MD should still work together regardless.

FWIW, my problem is with LVM and ata-raid (as implemented by various
Promise cards).  I haven't been able to determine whether LVM and MD
(Linux software RAID) will work together or not -- although based on
what I found I'd be somewhat surprised if they do work together
correctly, because it seems to be an accident rather than good design
(the same vgscan rescan issues would seem to affect MD as affect
software RAID, unless some lucky coincidence prevents the raw IDE
channels being recognised).

Perhaps making LVM and ataraid work together properly is "too hard"
(although personally I think it can be done with merely an ugly kludge
-- viz, scan the ataraid and md devices first).

But IMHO either LVM and ataraid should work properly, or it should be
really really obvious that they won't work together (eg, fails to
initialise on ataraid devices, reports errors if you try, etc).  The
current situation of mentioning ataraid support, and then silently failing 
is very dangerous.

Ewen
