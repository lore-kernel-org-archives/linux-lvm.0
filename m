From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] RE: stock kernel 2.4.20 + LVM 1.0.7 + ext3fs => snapshot problem?
Message-ID: <20030516125517.A24422@sistina.com>
References: <BC28A9E979C56C44BCBC2DED313A4470017E823E@bond.ncl.ac.uk>
Mime-Version: 1.0
In-Reply-To: <BC28A9E979C56C44BCBC2DED313A4470017E823E@bond.ncl.ac.uk>; from C.R.Ritson@newcastle.ac.uk on Thu, May 15, 2003 at 01:27:13PM +0100
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
Date: Fri May 16 06:03:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 15, 2003 at 01:27:13PM +0100, C R Ritson wrote:
> The solution appears to be to apply the patches in the other order. To
> create a kernel capable of making a snapshot of an active ext3 or
> reiserfs volume, the drill appears to be to apply the VFS-lock patch for
> the appropriate kernel version to the un-patched kernel tree, and only
> THEN to apply the generated LVM patch.
> 
> This makes me wonder if it would be possible to add this to the
> configure script, so that I could say
> 
> 	configure --with-VFS-lock

Certainly doable but people still need to be told to set that option.
We tried to have the VFS lock patch added to vanilla a couple of times but
failed so far. Retrying...

Regards,
Heinz    -- The LVM Guy --


> 
> I envisage makeing --with-ext3 and --with-reiserfs aliases for the
> above. Just an idea.
> 
> > -----Original Message-----
> > From: C R Ritson 
> > Sent: 09 May 2003 16:51
> > To: 'linux-lvm@sistina.com'
> > Subject: stock kernel 2.4.20 + LVM 1.0.7 + ext3fs => snapshot problem?
> > 
> > ... cannot make a snapshot of a mounted 
> > ext3 filesystem. When I attempt to mount the snapshot 
> > (readonly) I get:-
> > 
> > 	mount: wrong fs type, bad option, bad superblock on 
> > /dev/vga/addon.backup,
> >       or too many mounted file systems
> > 
> > ... applying this patch 
> > separately after the generated LVM patch breaks the kernel, 
> > leaving me with unresolved reverences to fsync_dev_lockfs and 
> > unlockfs.
> 
> Chris Ritson (Computing Officer)
> 
> Rm 618, Claremont Bridge,       EMAIL: C.R.Ritson@newcastle.ac.uk
> School of Computing Science,    PHONE: +44 191 222 8175
> University of Newcastle,        FAX  : +44 191 222 8232
> Newcastle on Tyne, UK NE1 7RU.  http://www.cs.ncl.ac.uk/~c.r.ritson/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
