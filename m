Message-ID: <3DB26648.7CFB73FE@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Fwd: LVM on ATA-Raid Working - but Poorly
References: <1034915787.3daf8fcb66a42@mail.dornquast.com> <20021018224521.G8100@zealot.blacknet.de>
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
Date: Sun Oct 20 03:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Goetz Bock wrote:
> 
> On Thu, Oct 17 '02 at 23:36, Nathan Dornquast wrote:


[snip]


> > Goetz, I am interested to hear your MD RAID 1/5 - particularly how it handles
> > powering off a drive while operating.  Does your box spit, sputter and puke, or
> > can you hotswap?
> i've two of this boxes, one with a 6850 (old 3ware card) and 8 60GB
> (what was top of the line when the box was build) now running in JOBD
> mode with MD on top of it (it's a lot faster than native RAID5) there I
> can hostswap, but's a pain. The box can go down after about 18:00, so I

Why is it a pain ??
Pull out the drive, plug in a new, and then raidhotadd it to your md
device.


[snip]


> as most people on the linux-ide-arrays list will tell you: 3ware 7xxx
> are nice/fast/stable cards for RAID5 and IDE, but a version with
> 64bit/66MHz would be nice.

my cards are 64 bit ? Are they not 66 MHz ?
I thought all 64bit cards were 66MHz.


> Personaly I'm looking forward to SATA ... no more flat cables

3ware has a controller for that, with 15 disks *drool
*

 
> > I know this RAID info is off-topic.  Feel free to email me directly
> > ...
> I first thought we're on linux-ide-array already, and than I wanted to
> reply privately, but others have replied to the list already, and so did
> I (what if not RAID arrays do you want to run LVM on?)

oops, you are right, it is (getting) offtopic.




JonB
