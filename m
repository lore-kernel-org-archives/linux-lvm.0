From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] cache buffer size
Message-ID: <20021108154843.A12935@sistina.com>
References: <OF442EBFE4.3A4EDB03-ON85256C69.005AF60C@pok.ibm.com> <20021107175801.A8382@sistina.com> <20021108081141.GA32671@percy.comedia.it>
Mime-Version: 1.0
In-Reply-To: <20021108081141.GA32671@percy.comedia.it>; from bluca@comedia.it on Fri, Nov 08, 2002 at 09:11:42AM +0100
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
Date: Fri Nov  8 08:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 08, 2002 at 09:11:42AM +0100, Luca Berra wrote:
> On Thu, Nov 07, 2002 at 05:58:01PM +0100, Heinz J . Mauelshagen wrote:
> >On Wed, Nov 06, 2002 at 11:17:05AM -0600, Steve Best wrote:
> >Indeed snapshot exception table ios go by blocks of 1k.
> >
> >Puting the snapshot store on the same device as the original is not
> >recommended in general for performance reasons.
> >
> >In case 1k blocks are possible with JFS:
> >
> >if snapshots are used regularly and there's no seperate PV to put the
> >snapshot onto, you might want to create a 1k blocked jfs and try if
> >that performs better than the RAID 5 stripe cache flush penalty with the 4k
> >blocked filesystem.
> 
> hello,
> is there any chance of having snapshots with 4k blocks for the exception
> table (configurable), i want to use snapshot for backing up my root vg
> but i also have swap there and it is locked to do page-sized io (4k on
> ix86).

I guess no, because the snapshot io block size is retrieved from
blksize_size[][] for the underlying physical volume.  Because of that we
have 1024 byte for the typical disk drive unless on zSeries.


> 
> L.
> 
> -- 
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
