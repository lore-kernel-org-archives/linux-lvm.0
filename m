From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] Re: LVM writes on raw disk of ATA RAID Mirror
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030430164310.PCQJ6100.imf48bis.bellsouth.net@tiger2>
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
Date: Wed Apr 30 11:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  In message <20030429220328.XULC259.imf39bis.bellsouth.net@tiger2>, Greg
 >>  Freemyer
 >>  writes:
 >>  > >>  Now y'all can tell me that the Promise ATA RAID cards suck and I
 >>  > >>  shouldn't use them, and I should get a hardware RAID card, [....]
 >>  > >>  And I'll happily agree with you, but for two small facts:
 >>  > >>  - the hardware RAID cards cost more than twice what the drives cost,
 >>  and
 >>  > >>  they're 120GB IDE drives with large caches; let alone SCSI hardware
 >>  > >>  RAID (which also increases the cost of the disks a lot too);
 >>  >
 >>  >Just thought I would point out that a 2-channel 3ware card is about the
 >>  price
 >>  >of a single 80GB drive.  (i.e. $130 US)

 >>  Around here (New Zealand) I can buy a 120GB IDE disk, with a 3 year
 >>  warrenty, and a 8MB cache, for that sort of price (NZ$280 -> US$140 ish).

 >>  Still, that's a lot closer to the price of the Promise cards (I'd
 >>  previously only seen the 3-ware cards with prices around the US$250 ish
 >>  sort of mark).   Is that for the 3Ware 7000-2 card, which appears to be
 >>  a 2-drive (single IDE channel?), card as best I can tell?  Or for the
 >>  3Ware 7500-4LP card which appears to be a 4-drive (2 IDE channel?) card?
 >>  (The Promise TX2000, and most of the Promise on-board ata-raid chipsets,
 >>  are 2 IDE channels, 4 drives max -- although of course for best
 >>  performance you really only want one drive per IDE channel.)

Yes, the 7000-2, but it uses 2 IDE channels. =20

3ware only talks to IDE masters.

i.e. The 4 drive card uses 4 IDE channels and 4 separate cables, one per drive.

I have not yet tried the 8 and 12 port cards, but I assume they are the same.

I want to build up a 1 TB machine for testing soon, so I need to buy a 8-port =
card.

Not sure that I will ever need a 12 port.

 >>  Now all I need to find is a source of 3ware IDE cards in New Zealand;
 >>  I haven't found any retail sources so far, and the one distributor I
 >>  found mentioned doesn't even have a website in New Zealand (it redirects
 >>  to a flash-only overseas website).

I don't know how many you need, but I buy them from Bell Micro in OEM=20
packs (no cables, no manuals, no software).  They come 10 to a box for=20
slightly less than $1000 US.  $130 US is for a retail package.

You can download the manuals and software, and we did not use their cables =
anyway.

Maybe Bell Micro ships to New Zealand?

 >>  Ewen

Greg
--=20
Greg Freemyer
