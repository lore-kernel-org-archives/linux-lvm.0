Return-Path: <root@srv.sistina.com>
Date: Mon, 28 May 2001 11:20:30 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Root on LVM and vgscan
Message-ID: <20010528112030.H26710@sistina.com>
References: <200105250828.JAA11414@queeg.britain.agilent.com>
Mime-Version: 1.0
In-Reply-To: <200105250828.JAA11414@queeg.britain.agilent.com>; from dick@britain.agilent.com on Fri, May 25, 2001 at 09:28:34AM +0100
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

On Fri, May 25, 2001 at 09:28:34AM +0100, Dick Middleton wrote:
> I have root running on lvm on sw raid partitions on linux 2.2.18.  It all
> works fine.  However I have had difficulty during booting after adding new
> LVs.  The symptom is that the initial mounts of LVs fails or the wrong
> partition is mounted.
> 
> What happens is that vgscan is run during the initrd phase and so the lvmtab
> is updated on the ram disk.  Once the root file system on the hard disk has
> been mounted the lvmtab on that comes into use.  That has not been updated by
> vgscan and so does not reflect the changes. 
> 
> Obviously it's possible to run vgscan again (between remounting root rw and
> checking the other discs) to update the lvmtab but it does beg a few
> questions.

Yes, that's the option (forcing some overhead).
The other would be to get the actual /etc/lvmtab* from the initial ram disk :-)

> 
> 1) why does mount use the data in lvmtab and not in /proc to find out about
>    active VGs?

mount doesn't access /etc/lvmtab* at all.

The problem is that minor numbers are not striktly related to logical volumes;
they are associated at vgscan time.

> 
> 2) if lvmtab is so essetial why is it not updated by vgcreate/lvcreate and
>    other utilities when changes are made?

See above.

> 
> 3) would it not be possible/better to update lvmtab from /proc without doing
>    a rescan.

That could only be partially done, because /etc/lvmtab* contains the complete
metadata whereas /proc doesn't.

> 
> I don't know the issues involved and reasoning behind the design of this
> aspect of LVM but it does seem to me that there is something less than ideal
> in the current scheme.

The virtuall assignement of minor numbers to LVs causes the problem in the
root on LVM (and NFS) case. That'l likly be changed anyway.

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
