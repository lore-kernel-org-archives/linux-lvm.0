Return-Path: <root@srv.sistina.com>
Date: Mon, 28 May 2001 16:14:12 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Root on LVM and vgscan
Message-ID: <20010528161412.B21043@sistina.com>
References: <20010528112030.H26710@sistina.com> <200105281244.NAA14609@queeg.britain.agilent.com>
Mime-Version: 1.0
In-Reply-To: <200105281244.NAA14609@queeg.britain.agilent.com>; from dick@britain.agilent.com on Mon, May 28, 2001 at 01:44:34PM +0100
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

On Mon, May 28, 2001 at 01:44:34PM +0100, Dick Middleton wrote:
> 
> Thanks for your answers - as usual they provoke more questions...
> 
> >  On Fri, May 25, 2001 at 09:28:34AM +0100, Dick Middleton wrote:
> >  > I have root running on lvm on sw raid partitions on linux 2.2.18.  It all
> >  > works fine.  However I have had difficulty during booting after adding new
> >  > LVs.  The symptom is that the initial mounts of LVs fails or the wrong
> >  > partition is mounted.
> >  > 
> >  > What happens is that vgscan is run during the initrd phase and so the lvmtab
> >  > is updated on the ram disk.  Once the root file system on the hard disk has
> >  > been mounted the lvmtab on that comes into use.  That has not been updated by
> >  > vgscan and so does not reflect the changes. 
> >  > 
> >  > Obviously it's possible to run vgscan again (between remounting root rw and
> >  > checking the other discs) to update the lvmtab but it does beg a few
> >  > questions.
> 
> >  Yes, that's the option (forcing some overhead).
> >  The other would be to get the actual /etc/lvmtab* from the initial ram disk :-)
> 
> Ah yes, I discovered that it lives in /initrd! Can I assume from this that
> it's safe to copy the lvmtab.  Is that a good solution?

Sure.
This has the actual vgscan results *and* causes as little overhead as possible
to get it into the real root.

> 
> >  > 
> >  > 1) why does mount use the data in lvmtab and not in /proc to find out about
> >  >    active VGs?
> 
> >  mount doesn't access /etc/lvmtab* at all.
> 
> Now you've got me.  Why/how does mount mount the wrong partition when lvmtab
> is out of date if it doesn't access lvmtab? Are /dev/<vg>/<lv> updated by
> vgscan as well? It looked to me as if they weren't. Do they need to be copied
> from /initrd too?

Actually I've been too brief before :-(

The device nodes in your real root are the ones created *before* vgscan
was called from linuxrc and are likely out of date WRT to the minor numbers
they contain.


Something like

/dev/VGName/LVname 58 1

could be in your real root *but*

/dev/VGName/LVname 58 2

could have been updated by the vgscan run in the initial ram disk fs.

IOW: you can copy the /etc/lvmtab* files from the initial ram disk *and*
     run vgmknodes(8) from your real root based startup script *before* the
     VG is accessed (eg. to mount a fs).

> 
> What should I read to better understand how all this works?
> 
> Dick
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
