From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] vgscanfailed"novolumegroupsfound"
Message-ID: <20011025014038.X23590@turbolinux.com>
References: <200110250515.OAA15476@center01.shooting-star.ne.jp>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200110250515.OAA15476@center01.shooting-star.ne.jp>
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
Date: Thu Oct 25 02:39:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Oct 25, 2001  14:15 +0900, appendix@hatsune.cc wrote:
> I've a LVM one physical volume "vg0" that created on 9 RAID devices.
> 
> My VG structure is following
> /dev/md2,md3,md4,md5,md6,md7,md8,md9,md10 => vg0

You say 9 md devices, and list 9 above for vg0.

> Kernel Linux melody.angelic.jp 2.4.5 #10 SMP
> 
> The pvscan report is following
> >pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/md2"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/md3"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/md4"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/md5"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/md6"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/md7"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/md8"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/md9"   is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/md10" of VG "vg1" [4.48 GB / 4.48 GB free]
One of your PVs says it is in another VG   ^^^ very strange.  
> pvscan -- total: 9 [68.48 GB] / in use: 9 [68.48 GB] / in no VG: 0 [0]
> 
> The pvdata report is following
> >pvdata -U /dev/md2
> 000: w1ozGmggQJ7LqDumRFhBWpxAcBuinvkV
> 001: gyivka8v8Rs8N6UHW1mXO2A7pe3V2UtL
> 002: N1rBqi3J4SXDpRwYCh65eXCtH98zrkYQ
> 003: vy3JnFfm4b4j5t1kcnnmPBVnqvKE1454
> 004: 3qwEJ6e08fnjyfEtYh2VUwNLSlAv7WHC
> 005: bCf2F3RgkdCqz0qs605zpQiMDF738U7Q
> 006: Ao8MnMZSLrDhk1pbTHatNA5KHiZXv5vG
> 007: 3ztQ2cfoGMc15y1TTXQzSpSkTIBzLcas
> 008: 9VW0My6FYEh4T1WnwBP3m0OSlMhdM7Gq
> 009: BIxTWheupMeCfEjU8UuyW0LX8gAq4aoD
  ^^^ 10 PVs listed.  This is wrong.
> 
> >pvdata -PP pvdata -PP /dev/md2
> --- Physical volume ---
> PV#                   2
> PV UUID               gyivka-8v8R-s8N6-UHW1-mXO2-A7pe-3V2UtL

This matches "001" above.  You need to check each of the other MD devices
to see which ones have valid UUIDs.  You may need to use the uuid-fixer
tool.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
