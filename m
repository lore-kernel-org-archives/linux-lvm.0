From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] drive-spindown
Message-ID: <20020925151529.A30084@sistina.com>
References: <200209251011.05774.michael@frotscher.net> <20020925112539.A29192@sistina.com> <200209251151.25358.michael@frotscher.net>
Mime-Version: 1.0
In-Reply-To: <200209251151.25358.michael@frotscher.net>; from michael@frotscher.net on Wed, Sep 25, 2002 at 11:51:25AM +0200
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
Date: Wed Sep 25 08:22:50 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 25, 2002 at 11:51:25AM +0200, Michael Frotscher wrote:
> On Wednesday 25 September 2002 11:25, Heinz J . Mauelshagen wrote:
> 
> > that could be either some regular access to extents residing on hdb
> 
> So you are saying that the volume can be used (like accessing hdb) even 
> though hdc is spun down?

Correct.

If there's just accesses to extents mapped onto hdb (i.e. from the filesystem),
hdc will never spin up (unless somthing outside LVM triggers it ;-)

> But if, it is a good explanation as my volume still has plenty of space 
> so hdc would not be accessed until hdb is full.

See "pvdisplay -v /dev/hd[bc]" or "lvdisplay -v YourLV" for your
logical volume(s) to see what is mapped onto what.

> -- 
> Cheers,
> 
> Michael 
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
