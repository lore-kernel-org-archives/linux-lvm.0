Return-Path: <smdenton@bellsouth.net>
Message-ID: <01C0B04F.5EFB3400.smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] Apparent performance degradation for each PV with striping
Date: Mon, 19 Mar 2001 08:34:09 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Monday, 19 March 2001 02:07, Jason Walker [SMTP:unseen@sover.net]
wrote:
> 
> I have 2 45gb IBM drives and a 3ware controller for them. I am just
> writing to second this e-mail in saying the controller is
> fantastic. in fact, my frined has the same exact setup as I do
> (he's not bold enough to LVM it...but I am working on that :) I
> have LVM'd the entire thing and have XFS on it all. Anyways, you
> can't go wrong with these cards. (just thought I would put my $.02
> in)
> 
> Jason

I tend to agree.  In general software RAID will bog the system down
and if performance is key, you should take the load off the CPU
whereever possible.  The obvious conclusion with data volumes is to
use a hardware RAID controller, beit SCSI or IDE... I've used both
SCSI raid controllers and the IDE promise raid controller with good
results.  The other thing that may be killing your performance is IO
contention.  Check for other highly-used devices on the same PCI
bus... on PCs there are quite a few points of possible contention.

Just -my- 2 cents :)

> On Mon, 19 Mar 2001 lvm@winux.com wrote:
> 
> 
> > Donald Thompson writes:
> > > I notice during the dd operation that my system CPU state is
> > > 90% or more.  So I think I just answered my own question, I'm
> > > CPU bound. Moving on, is there any known ways to improve my
> > > performance off each PV with this type of hardware setup?
> > > ...
> > > Should I expect that I won't see the performance drop on
> > > individual PV's with striping on SCSI drives? I originally
> > > setup this system with no intentions of it being a high
> > > performance file server, until a few people I work with decided
> > > they wanted to use it for a database machine. So I'm not afraid
> > > to spend a couple grand to get some faster disks in it if thats
> > > the only thing
> > > thats gonna help me.
> > 
> > Hi Donald,
> > 
> > I think what you're seeing is to be expected from vanilla IDE.
> > Not only is it not Linux LVM's fault but Linux LVM can't fix it.
> > IDE controllers are not able to do the things more sophisicated
> > controllers and host adapters do to increase performance in a
> > multi-spindle environment.  Fortunately, there is a solution
> > that's fast, cheap, and reliable.
> > 
> > I suggest that, rather than replacing the drives with
> > expensive SCSI drives and an expensive SCSI host adapter,
> > you buy an Escalade Switch from http://www.3ware.com/ and
> > use your existing drives.
> > 
> > The Escalade is a hybrid controller of sorts.  It presents itself
> > as a SCSI host adapter to the host's PCI bus and as multiple (up
> > to 8) independent IDE controllers to the IDE drives.  It's
> > essentially a cross-bar switch that lets multiple IDE drives act
> > independently of one another.  They use some clever controller
> > software to get a BETTER than 2x boost in read-performance when
> > you mirror drives.
> > 
> > It has the additional advantage of providing RAID for the
> > attached drives. It supports RAID 0, 1, 10, and 5, so you get all
> > those benefits without imposing ANY additional CPU load.  The
> > controller is actually quite a gem and is very reasonably priced.
> >  I've been using them on all of my systems where performance
> > and/or reliability are critical.  
> > 
> > The Escalade driver is supported in the standard 2.2.x and 2.4.x
> > Linux kernels.  
> > 
> > In short, let 3ware's hardware handle the striping/RAID and use
> > Linux LVM to manage the volume.  It's a powerful combination.
> > 
> > Larry
> > 
> > DISCLAIMER:  These statements reflect my personal opinions... bla
> > bla bla. I don't have any affiliation with 3ware or anyone else
> > in this business.  
> > 
> > CLAIMER:  3ware makes good stuff that works very well.
> > It solved my problems and it could solve yours.
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > 
> 
> -- 
> Jason Walker -- unseen@sover.net, perlgod@hotmail.com
> UIN: 110493687
> AIM: Nightface
> 
> /"\
> \ /     ASCII RIBBON CAMPAIGN
>  X        AGAINST HTML MAIL
> / \
> 			 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm


Scott Denton
smdenton@bellsouth.net
EFnet Handle: SteelWyng
ICQ UIN: 24149258
AIM Screen Name: SteelWyng

-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 6.5.3 for non-commercial use <http://www.pgp.com>

iQA/AwUBOrYK0XC+DNfF0nVpEQJSBQCgrSWfAmAtjFod5+F+n7A0vw3sZQAAni/0
wnb49uCl8xeE8DNEcMGxcH5A
=vrnk
-----END PGP SIGNATURE-----
