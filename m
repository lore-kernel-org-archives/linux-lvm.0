Return-Path: <root@srv.sistina.com>
Date: Fri, 9 Feb 2001 00:03:22 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Upgrade procedure
Message-ID: <20010209000322.C19887@srv.sistina.com>
References: <F578nbpzJvm2CaO9smk000059c1@hotmail.com>
Mime-Version: 1.0
In-Reply-To: <F578nbpzJvm2CaO9smk000059c1@hotmail.com>; from gene_yee@hotmail.com on Thu, Feb 08, 2001 at 02:32:23PM -0800
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

On Thu, Feb 08, 2001 at 02:32:23PM -0800, hail narcissus wrote:
> 
> I am running .9.1-Beta2 right now and though I am not currently in need to 
> upgrade I would like to know the procedure for future reference.
> 
> My questions are:  Do I need to re-patch and compile the kernel for 
> upgrading?

Yes, you need to apply the release dependent LVM kernel patch.

> If so then do I need to start with a clean src or can I re-patch 
> my src?

It depends. In 2.4 you can most likely just apply a LVM delta patch which
will be generated during the LVM installation. This is documented in INSTALL
and PATCHES/README contained in the LVM distro.

> 
> In other words, my kernel already has a couple of other hacks patched into 
> it.  If possible I would like to just run the LVM .9.1-Beta3 patch over my 
> kernel which was patched for Beta2 on it instead of having to dig up all the 
> other patches I have applied in the past.

As mentioned: with 2.4. applying the LVM 0.9.1-BetaN patch will (most
              likely) work.
              With 2.2 it depends on the patches you added and how they
              interfere with the LVM patch.

> 
> Thanks.
> _________________________________________________________________
> Get your FREE download of MSN Explorer at http://explorer.msn.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
