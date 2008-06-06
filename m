Subject: Re: [linux-lvm] Re: Help! snapshot apparenly trashed LVM
	[recovered? but still Q's]
From: Ross Boylan <ross@biostat.ucsf.edu>
In-Reply-To: <4848D933.8060201@redhat.com>
References: <62138.128.218.6.3.1212706444.squirrel@biostat.ucsf.edu>
	<62860.128.218.6.3.1212708196.squirrel@biostat.ucsf.edu>
	<4848D933.8060201@redhat.com>
Content-Transfer-Encoding: 7bit
Date: Fri, 06 Jun 2008 00:45:55 -0700
Message-Id: <1212738355.18686.19.camel@corn.betterworld.us>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Milan Broz <mbroz@redhat.com>
Cc: tabor@biostat.ucsf.edu, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2008-06-06 at 08:29 +0200, Milan Broz wrote:
> ross@biostat.ucsf.edu wrote:
> >> I did some expanding and shrinking of my volumes and then attempted to
> >> take a snapshot.  I got an error message that started "Invalid LV in
> >> extent map".  I now see that message when I do lvscan or pvscan as well.
> >>
> >> This looks very bad, and seems to be the same situation as described here:
> >> http://weblog.pell.portland.or.us/~orc/2008/02/20/000/index.html
> 
> And where did you send bugreport for that problem?
> 
> ok, it seems that we have already one
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=209927 
> 
> Should be fixed in LVM2 2.02.36.
> 
> Milan
> --
> mbroz@redhat.com

Excellent!

Is that a kernel level or userspace fix?  How do I know if I've got it?
Currently lvm version says
  LVM version:     2.02.35 (2008-04-15)
  Library version: 1.02.24 (2007-12-20)
  Driver version:  4.12.0


The bug indicates that converting to LVM2 will fix things.  I have no
reason to stick with LVM1, so that may be the best way to go.  Are there
any gotcha's?  Can vgconvert be run while the volumes and group are in
use?

Thanks.
Ross
