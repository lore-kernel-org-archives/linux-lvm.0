From: ratler@lunar-linux.org
Subject: Re: [linux-lvm] LVM1 problem, exported volumegroup with one dead
 drive (fwd)
In-Reply-To: <1058913244.3f1dbbdca4242@webmail.phys.unsw.edu.au>
Message-ID: <Pine.LNX.4.56.0307230921240.18176@gumpie.wea.se>
References: <Pine.LNX.4.56.0307221242540.30328@gumpie.wea.se>
 <1058913244.3f1dbbdca4242@webmail.phys.unsw.edu.au>
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
Date: Wed Jul 23 02:25:30 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Melinda,

Yes I tried using LVM2 very early since it was said it could cope with
disks that were inaccesible. However the vgreduce --removemissing doesn't
work. I believe it is because I did a vgexport before the 2nd disk went
out of business. And since I cant import the VG because one of the drives
are gone Im kinda in a dead end.

Sincerely
Stefan Wold

On Wed, 23 Jul 2003, Melinda Taylor wrote:

> Hi Stefan,
>
> I am working through the exact same scenario so you may like to look through my
> posts and peoples advice in the LVM archive (july):
>
> http://lists.sistina.com/pipermail/linux-lvm/2003-July/subject.html
>
> Basically I had 2 disks fail which were part of my VG. I now have 2 of 4 LV's
> left and am trying to retrieve the data. As suggested the only way to recover
> data from a partial VG is to upgrade to LVM2.
>
> I have done that and LVM2 can now activate my partial VG - but I haven't quite
> retrieved the data from it yet.
>
> Hope that helps,
>
> Melinda
>
>
> Quoting ratler@lunar-linux.org:
>
> > Hi,
> >
> > I think I have tried all solutions google could give me without any luck
> > restoring any data.
> >
> > The problem is the following:
> >
> > 1. I had to reinstall a server to where this volumegroup belonged
> > 2. I umounted all LVs. And deactivated the VG. And then I did a vgexport
> > of the VG
> > 3. After the reinstall of the linux server it was time to import the VG
> > that had 2 harddrives. I ran a pvscan and it only detected one drive! I
> > started some investigation and i noticed the second drive was totaly dead!
> >
> >
> > And of course since this was a server at my home I didnt have any backups
> > of this VG. And since one drive is missing it's impossible to import the
> > part of the VG I have left. I know that most of all PEs for my /home
> > are on the drive that is still working.
> >
> > Now I wonder how on earth can I restore any of the data that is still on
> > my working drive? I had 4 years of mail and some source code I would die
> > for to get back. Since I only have metadata from the only drive working I
> > think I have a little problem ;)
> > All I want is to get as much of the data out from datavg/homelv.
> >
> > I attached a log file with the output from pvscan and pvdata.
> >
> > Sincerely
> > Stefan Wold
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
