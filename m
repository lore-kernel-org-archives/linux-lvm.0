Return-Path: <kirth@hole.org>
Date: Wed, 14 Mar 2001 13:51:08 +0000
From: Kirth <kirth@hole.org>
Subject: Re: [linux-lvm] Hardlock and volume loss ?
Message-ID: <20010314135108.A22081@prodding>
References: <20010313020851.A16727@prodding> <200103140019.f2E0JM505949@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200103140019.f2E0JM505949@webber.adilger.int>; from adilger@turbolinux.com on Tue, Mar 13, 2001 at 05:19:22PM -0700
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I was using 0.9 originally when the machine hardlocked
I then upgraded to CVS after reading the mailing lists, this didnt help
I spoke to Hans who said go back to original 0.9 and try rebooting
and just running vgchange -a y (which fixed my problem, well at least
allows me to mount the drive, vgscan etc... still reset the UUID's)

I would like to fix the problem fully, so I can carry on using the LVM and
expand it, but at least right now I can copy the data off the drive.

Regards
Richard

* Andreas Dilger (adilger@turbolinux.com) wrote:
> Richard writes:
> > The problem is if I try to make the PV active, it "looses" this information
> > and says:
> > 
> > milita:/etc/lvmconf# vgchange -ay
> > vgchange -- ERROR "Invalid argument" activating volume group "media"
> > 
> > 	I've posted what I thought was relavent to
> > 	http://black.hole.org/deadlvm.txt
> > 
> > 	I'm pretty sure the data is intact, and I hope the lvm can be
> > put back together (hopefully so I can still resize/add to it)
> > 
> > 	Any help would be apprecaited, oh and I'm running todays (12/13th
> > March 2001) cvs lvm programs.
> 
> In your other posting, you say:
> 
> > Any ideas ? the software is:
> > Logical Volume Manager 0.9
> > Heinz Mauelshagen, Sistina Software  13/11/2000  (IOP 10)
> 
> > installed from lvm-0.9-2 via debian apt-get from sistina.com
> 
> Which one?  The 0.9 software has bugs that may cause this problem
> (missing UUIDs).
> 
> Cheers, Andreas
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
