From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgchange -a y /dev/System fails
Message-Id: <20020131121417.A9764@sistina.com>
References: <20020125233533.GK26045@merlins.org>
    <20020128104258.A24830@sistina.com> <20020129215738.GA8651@merlins.org>
    <20020130131205.A3769@sistina.com> <20020131030417.GN8651@merlins.org>
MIME-Version: 1.0
In-Reply-To: <20020131030417.GN8651@merlins.org>; from
    marc_lvm@merlins.org on Wed, Jan 30, 2002 at 07:04:17PM -0800
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
Date: Thu Jan 31 05:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 30, 2002 at 07:04:17PM -0800, Marc MERLIN wrote:
> On Wed, Jan 30, 2002 at 01:12:05PM +0100, Heinz J . Mauelshagen wrote:
> > > Unfortunately, that doesn't work because I  had a cron job that was creating
> > > daily snapshots (in an attempt to emulate ONTAP's snapshot's feature), so my
> > > 10 backups contain snapshot LVs
> > 
> > Well, in this case you might still have a consistent backup with snapshots
> > which you can use like mentioned above.
> 
> I tried a few and none seemed to work, but I restored one from before I made
> snapshots and recovered from this.
> I now have my system back (/usr, /var)
> 
> As  for  /home,  as soon  as  I  tried  to  access it  (e2fsck,  tune2fs  -O
> ^has_journal, or whatever), the process hung in "wait_o" according to ps.
> 
> I tried to  restore the VG to  its state before I added  snapshots, but that
> only made it go away :-(
>  
> mechastreisand:/etc/lvmconf# vgchange -a n /dev/BigAssLVMRaid 

<SNIP>

> -> My BigAssLVMRaid VG is gone :-(
> 
> Did I just lose my data?

If you really tried all your metadata backups unsuccessfully, I am afraid so :-(
Some users reported snapshot problems with the recent 2.4.x kernels.
They are not 100% reliable due to VM issues being sorted out by the
kernel community hopefully which will hopefully be integrated in 2.4.18.

> 
> Marc
> -- 
> Microsoft is to operating systems & security ....
>                                       .... what McDonalds is to gourmet cooking
>   
> Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key
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
