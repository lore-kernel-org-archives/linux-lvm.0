Subject: Re: [linux-lvm] Can someone _please_ tell me whats going on?
From: Bradley Alexander <storm@tux.org>
In-Reply-To: <Pine.LNX.4.33.0112180820400.22382-100000@dragon.inside.ntisys.com>
References: <Pine.LNX.4.33.0112180820400.22382-100000@dragon.inside.ntisys.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1008700601.785.25.camel@defiant>
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
Date: Tue Dec 18 13:07:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'm going to respond to both of these in the same post.

On Tue, 2001-12-18 at 08:22, Benjamin Scott wrote:
> On 17 Dec 2001, Bradley Alexander wrote:
> > Swapped controllers (was originally on the first controller with the
> >    other drive, now on the second.)
> 
>   FYI, both IDE ports on the motherboard use the same IDE controller chip,
> so if it *is* the controller that is your problem (and given that your disk
> activity light is stuck on, that may be), that will not fix it.

This is true, however, I now have (unlike at the point of my first
attempt to set this up) a vg on the first drive that is working
perfectly. I have seen no problems with it. The problems are only
occurring on the second drive. Also, for the record, I have created a
standard Linux partition via fdisk, made a reiserfs partition, and it is
happily schlepping data without hint of error or problem.

On Tue, 2001-12-18 at 08:50, Lewis Bergman wrote:
>
> Seems strange since so many of us have not had any problems with LVM.
> Have you looked at the kernel notes for any clues to your particular 
> hardware? You may find that some controllers/drives/PIO modes do not 
> work together. Further tuning with hdparam may alleviate the problem.
> As for myself. I wouldn't put much that is important on a Quantum as 
> the quality seems to be fading. I have gone to IBM exclusively. Prices
> are good and I don't know of any better drive out there for ide or 
> scsi.

The thing is that the drives are identical (and as I said, vg00 on
/dev/hda is operating without error), so if I was seeing problems, it
should stand to reason that I would see them on both drives.

I am looking at the kernel trap that LVM has been generating. It is
trapping on the vgchange process. I'm limping my way through it with
help.

-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm [at] debian.org
                                         |   storm [at] tux.org
============================================================================
Why are cigarettes sold at gas stations when smoking is prohibited?
