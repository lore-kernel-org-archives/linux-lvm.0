From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Moving a PV to a new, larger, disk.
Message-ID: <20040114154005.GB2837@redhat.com>
References: <1424171942.20040113154554@tnonline.net> <20040113162256.GA3756@redhat.com> <751312142.20040114160809@tnonline.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <751312142.20040114160809@tnonline.net>
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
Date: Wed Jan 14 18:22:04 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 14, 2004 at 04:08:09PM +0100, Spam wrote:
> 
> 
> > On Tue, Jan 13, 2004 at 03:45:54PM +0100, Spam wrote:
> >> 
> >>   Hello,
> >> 
> >>   Is it possible to use dd/dd_rescue to simply copy a PV to a new disk
> >>   that is slightly (16MiB)larger?
> >> 
> >>   The old pv is on /dev/hdb1 and the new disk is /dev/hdc and is
> >>   unpartitioned so far. How would I proceed to make this work?
> 
> > Following procedure to make it happen:
> 
> > o partition the new disk with 1 partition of _exactly_
> >   the same size (in units of sectors) as /dev/hdb1
> 
> > o dd(_rescue) content over
> > o remove the old disk
> > o vgscan
> > o vgchange -ay
> 
>   Great! Thank you. Now I know who to blame if things does not work ;)

Right, unless you didn't follow the steps exactly _and_
removed all mistakes ;-)

> 
>   //Anders
> 
> >>   
> >>   This might seem odd to do as I could perhaps use pvmove, but pvmove
> >>   requires the whole vg to be present in the system, right?
> >> 
> >>   //Anders
> >> 
> 
> 
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
