Date: Tue, 2 May 2000 21:15:58 -0300 (ADT)
From: Marco Shaw <marco@nbnet.nb.ca>
Subject: Re: [linux-lvm] SuSE/LVM boot problem
In-Reply-To: <20000502114113.C1608@archimedes.suse.com>
Message-ID: <Pine.LNX.4.21.0005022111490.956-100000@localhost.localdomain>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@e35.marxmeier.com

On Tue, 2 May 2000 dgould@suse.com wrote:

Well I just have the eval version so no 2nd CD.  I tried creating a lilo
disk with another system, but I guess lilo needs the same
boot.b/system.map files to create a lilo disk?

So now I'm left with creating lilo on a disk somehow with another
system...  How could I create it?  Otherwise, I could always install a
copy of SuSE 6.3 in a VMWare VM and create a disk there...

Marco


> On Tue, May 02, 2000 at 11:51:31AM +0000, Michael Marxmeier wrote:
> > > 
> > > I lost my floppy with lilo on it.  Now I have to reconstruct it.  I've
> > > tried booting in rescue mode, but even the rescue SuSE CD doesn't appear to
> > > have LVM support.
> > > 
> > > What can I do at this point?
> > 
> > Use the installation disk - it has LVM support while the Rescue disk has not.
> > You can boot from the 2nd CD-ROM into the old Yast, do a "expert install"
> > and switch to a shell.
> > 
> 
> Be careful. I have found that the install disks are very happy to create
> systems that cannot be booted because lilo does not know about lvm.
> 
> On this topic, what is needed to make lvm work for both / and /boot with
> full lilo support? I think it somewhat limits the utility of lvm not to
> be able to make a fully lvm system, and might be tempted to do some of
> the heavy lifting if it is not too gruesome.
> 
> -dg
> 
> 
