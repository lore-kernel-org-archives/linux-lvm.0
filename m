From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM tools RPM spec file for CVS builds
Message-ID: <20011129150534.C1283@sistina.com>
References: <3C04506F.6050603@larsshack.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C04506F.6050603@larsshack.org>; from lars@larsshack.org on Tue, Nov 27, 2001 at 09:48:15PM -0500
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
Date: Thu Nov 29 08:04:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thanks Lars for providing this.
We'll check if we will integrate it into the LVM distro.

On Tue, Nov 27, 2001 at 09:48:15PM -0500, Lars Kellogg-Stedman wrote:
> In case someone else finds it useful...
> 
> I've put an RPM spec file online at 
> <http://larsshack.freeservers.com/lvm/> that will build the LVM user 
> space tools using the current CVS tree.
> 
> The spec file attempts to be clever and doesn't actually do a full 
> checkout for each build -- only the first one.  After that, it runs a 
> cvs update.
> 
> For folks experiencing the "help, <insert-command-name-here> segfaults" 
> problem, you can pass rpm the "--with kgcc" flag on RedHat systems with 
> the kgcc package installed, which will result in a non-segfaulting build.
> 
> -- Lars
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
