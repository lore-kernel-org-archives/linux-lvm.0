From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vg_read_with_pv_and_lv error
Message-ID: <20020823103252.A8639@sistina.com>
References: <20020822174612.GA8692@grimlock> <XFMail.20020822195818.cfreeze@alumni.clemson.edu>
Mime-Version: 1.0
In-Reply-To: <XFMail.20020822195818.cfreeze@alumni.clemson.edu>; from cfreeze@alumni.clemson.edu on Thu, Aug 22, 2002 at 07:58:18PM -0500
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
Date: Fri Aug 23 03:48:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 22, 2002 at 07:58:18PM -0500, Chris Freeze wrote:
> 
> On 22-Aug-2002 Adam McDaniel wrote:
> 
> > This is the exact same problem I had last week. So far I've been
> > trying to hack in a solution by modifying the PV-UUID (which was
> > lost).. with minimal success.
> > 
> > Let me know if you find a way to fix this, vice-versa :)

Have you tried uuid_fixer from ftp://ftp.sistina.com/pub/LVM/contrib/ in
case it was a missing PV-UUID in the PV-UUID list yet ?

> 
> I was actually able to restore my lvm drive.  The first thing I did was pull
> the backup from the weekend and tar up the /dev/diskvg and /etc/lvm* files. 
> After moving them over to my server and unpacking them, I was able to run
> vgscan -f -v.  That brought everything back into sync again so that I could
> vgchange -ay diskvg and mount.  Thank goodness that I had a system level backup
> over the weekend.

People make backups! ;-)

> 
> 
> -- 
> Regards,
> 
> Chris
> 
> QOTD:
>         Money isn't everything, but at least it keeps the kids in touch.
> 
> -----
> Chris Freeze           Email: cfreeze@alumni.clemson.edu
>                          Web: http://www.cfreeze.com 
> 

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
