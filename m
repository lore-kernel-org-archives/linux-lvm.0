From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Fwd: LVM on ATA-Raid Working - but Poorly
Message-ID: <20021018224521.G8100@zealot.blacknet.de>
References: <1034915787.3daf8fcb66a42@mail.dornquast.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1034915787.3daf8fcb66a42@mail.dornquast.com>; from Nathan@Aberon.Net on Thu, Oct 17, 2002 at 11:36:27PM -0500
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
Date: Fri Oct 18 15:39:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


On Thu, Oct 17 '02 at 23:36, Nathan Dornquast wrote:
> Very good suggestions.  They mostly point out what I suspected, that I will not 
> have much luck getting the built in Promise RAID chips to work with LVM.
I've two boxes with buildin Fasttrack100 (IIRC) working just fine with
the (colsed source) driver provided by promise, never had any problems,
they are not required to run 24x7 and so I don't care about hotswap and
stuff. The 2 boxes are loadbalancing each other, so one can go down, but
should not take too long to come back up again (and as the boards came
with fasttrack buildin, the customer did not want to spend money on a
3ware card :-( )
 
> I am actually running without the PROMISE PDC202{46|62|65|67|68|69|70} 
> support.  Some of the How-to's I've come accross say to include it, but when I 
> do, I can not boot off the ATA-Raid.
very bad idea, than the controller runs in ATA compatible mode, and that
just sucks (performance, features, stability). With promise support, the
card is detected as a fasttrack and you need the promise driver I've
mentioned above.

> I spent some time with the Promise drivers... they are released for RH 7.2/3, I 
> haven't been successful at getting them to install on my Debian 3.0 box.  
Oh, IC. I'm using redhat 7.3 :-)

> 3ware 7500-4 is on order. ;)  Sadly it adds $260 to box.  
For my newer boxes, that should not go down due to one drive failing, I'm using 
7500-2, its chaep, do RAID1, can boot, work fine, and have the 3dm
managing tool (to hotswap drives). 
I'm just using a 7500-4 in raid1 mode on a paranoids box who wanted
RAID1 and a hotspare ... he pays it, he gets it ;-)

> Goetz, I am interested to hear your MD RAID 1/5 - particularly how it handles 
> powering off a drive while operating.  Does your box spit, sputter and puke, or 
> can you hotswap?
i've two of this boxes, one with a 6850 (old 3ware card) and 8 60GB
(what was top of the line when the box was build) now running in JOBD
mode with MD on top of it (it's a lot faster than native RAID5) there I
can hostswap, but's a pain. The box can go down after about 18:00, so I
just power it down, remove the broken driven and power it up again, if a
drive should fail. 
The seccond if my home server running 6x120GB on 3 promise ATA100 cards.
This box can go down when ever I need it, and all I care is that I've A
LOT of storage with some redundancy. I just can not back it up, but that
does not matter (no RAID5 does not replace backups) as everything on
there can be reconstructed from CDs or the internet ;-)
My homeserver as a RAID1 with 2x40GB with important data on it, that I
can/do backup.

> How about with the 3ware card?  
They are a good pice of work, not cheap, but definetely worth the money
(at last the 7xxx)
> Which 3ware card are you working with?
2x 6850, both where bought do to RAID5 and are used as JBOD with MD
         ontop. 
1x 7500-8: mission critical storage server, 8x120GB, RAID5 rock solid,
           performance is as expected from 32bit bus (mainboard does not
           have 64bit pci)
2x 7500-2: mission critical servers, 2x??GB, RAID1
1x 7500-4: RAID1 with hotspare

as most people on the linux-ide-arrays list will tell you: 3ware 7xxx
are nice/fast/stable cards for RAID5 and IDE, but a version with
64bit/66MHz would be nice.
Personaly I'm looking forward to SATA ... no more flat cables

> I know this RAID info is off-topic.  Feel free to email me directly
> ...
I first thought we're on linux-ide-array already, and than I wanted to
reply privately, but others have replied to the list already, and so did
I (what if not RAID arrays do you want to run LVM on?)
-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
