From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] [RFE] lvm-1.0.3 - progress bar similar to e2fsck for pvmove
Message-ID: <20020627120350.C21400@sistina.com>
References: <20020626155454.A3538@xanex.hippierage.org>
Mime-Version: 1.0
In-Reply-To: <20020626155454.A3538@xanex.hippierage.org>; from jmm@sublogic.com on Wed, Jun 26, 2002 at 03:54:54PM -0400
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
Date: Thu Jun 27 05:11:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

James,

are you sure you didn't use the "-v" option of pvmove?

Without that option pvmove typically display 6-7 lines.
With that option it displays some more information plus a line for
every extent moved.

On Wed, Jun 26, 2002 at 03:54:54PM -0400, James Manning wrote:
> just did a "pvmove /dev/hda5" and got tons and tons of info dumped to
> the screen as extents were moved.  IMHO, that'd be nice for a verbose
> mode, but by default it'd be nice to have something basically like
> the e2fsck/wget/etc progress bar.  As it stands, I had no idea what %
> of the way through the job I was and couldn't estimate finishing time,
> both of which would be nice to have.

Well, as with e2fsck and the like such bars heavily depend on total system
load and just make you feel believe that there's progress, which ps can
help do as well :)

> 
> Adding to other long-running data-migration things may be a good idea as
> well, but pvmove is the one I've come across that could really use it :)

We'll do something about it in LVM2.

> 
> Thanks!
> 
> James
> -- 
> James Manning <http://www.sublogic.com/james/>
> GPG Key fingerprint = B913 2FBD 14A9 CE18 B2B7  9C8E A0BF B026 EEBB F6E4
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
