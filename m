From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] extending a logical volume
Message-Id: <20020122113326.A23531@sistina.com>
References: <E16Sist-000136-00@arwen.dev33.cvf>
    <12230000.1011638456@duke.wrkhors.com>
    <20020121193331.I4014@lynx.turbolabs.com>
MIME-Version: 1.0
In-Reply-To: <20020121193331.I4014@lynx.turbolabs.com>; from
    adilger@turbolabs.com on Mon, Jan 21, 2002 at 07:33:31PM -0700
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
Date: Tue Jan 22 04:37:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 21, 2002 at 07:33:31PM -0700, Andreas Dilger wrote:
> On Jan 21, 2002  12:40 -0600, lembark@wrkhors.com wrote:
> > The simplest way to handle it is unmounting, fsck-ing
> > and re-mounting the thing immediately after your weekly
> > backup, when users have to be off the system anyway
> > [if you want to tell me that the system is too important
> > to offline for a backup I'd strongly suggest finding a 
> > 9-story window near the console, it'll be easier to 
> > handle it yourself than have the users do it for you 
> > after a crash looses all of the data].
> 
> I agree about the backups.  Most people don't think about
> backups until it is too late.  I disagree about only doing
> resizing at some late hour in the night though.  Many times
> there are unexpected demands on storage, and the sysadmin
> doesn't have control over the cause, but gets blamed for
> the effect (i.e. running out of space).  Hence, online fs
> resizing is a critical operation for an enterprise system.
> 
> > Even HP's LVM -- probably the most forgiving of all -- 
> > has to be dismounted for extendfs; lvextend can be run
> > any time you like.
> 
> ???  That was only with the old HP LVM filesystem (UFS I think).  
> If you formatted with the new filesystem (can't remember the name),

Andreas,

they got a Veritas license for vxfs and that could be online grown but
you couldn't shrink it without purchasing an additional license.

> you could do online resizing.  AIX has had online resizing forever,
> and so has XFS.  None of these allow even offline shrinking though,
> which ext2/ext3 does.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
> 
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
