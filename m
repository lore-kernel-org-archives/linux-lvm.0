From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM patches on LKML - are they needed?
Message-Id: <20020115163859.P11005@sistina.com>
References: <E16QVUz-0004HP-00@hermes.sistina.com>
MIME-Version: 1.0
In-Reply-To: <E16QVUz-0004HP-00@hermes.sistina.com>; from
    ahead@bigpond.net.au on Wed, Jan 16, 2002 at 01:27:29AM +1000
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
Date: Tue Jan 15 09:42:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 16, 2002 at 01:27:29AM +1000, Adrian Head wrote:
> Recently - there was a tread on the LKML 
> "[lvm-devel] [PATCH][2.5.2-pre11] lvm critical fixes | where is the lvm 
> maintainer?"
> http://marc.theaimsgroup.com/?l=linux-kernel&m=101080017328995&w=2
> 
> Does anyone know whether the patches in this thread apply to the 2.4.x branch 
> or the 2.5.x branch? LVM1 or LVM2?

It is Linux 1.5.x and LVM1

> 
> If they are needed for the 2.4.x branch - will they be in CVS soon?

We don't have the capacity to emphasize on LVM1 in 2.5 right now because
we support LVM1 in 2.4 and will release LVM2 including a new driver probably
this week and would like people embracing that new enhanced architecture which
will support the given on disk metadata.

There was third party help to upgrade the LVM1 driver to work in 2.5
and we really would appreciate more in that area.

> 
> -- 
> Adrian Head
> 
> (Public Key available on request.)
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
