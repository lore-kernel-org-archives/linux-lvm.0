From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.0.6 available at www.sistina.com
Message-ID: <20021122104035.B12967@sistina.com>
References: <20021121214832.UAUW771.imf02bis.bellsouth.net@TAZ2>
Mime-Version: 1.0
In-Reply-To: <20021121214832.UAUW771.imf02bis.bellsouth.net@TAZ2>; from freemyer@NorcrossGroup.com on Thu, Nov 21, 2002 at 04:46:37PM -0500
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
Date: Fri Nov 22 03:47:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 21, 2002 at 04:46:37PM -0500, Greg Freemyer wrote:
> 
> I was just looking at 2.4.20-rc2 and it has LVM 1.0.5+ per the lvm.h header file.

Marcelo has a 1.0.6 patch which fixes a lvrename related oops and introduces
C99 structure initializers as requested. No big deal.

Can be included before 2.4.20 IMO even we've got -rc now.

Regards,
Heinz    -- The LVM Guy --

> 
> Do you think LVM 1.0.6 will get into 2.4.20?
> 
> Greg Freemyer
> 
>  >>  *** ANNOUNCEMENT *** LVM 1.0.6 available at www.sistina.com
> 
>  >>  Hi all,
> 
>  >>  A tarball is available at
> 
>  >>  <http://www.sistina.com/>
> 
>  >>  for download.
> 
>  >>  Follow the "products" link on top of the Sistina web page
>  >>  and then the "Logical Volume Manager" link.
> 
> 
>  >>  LVM 1.0.6 contains lvrename and vgimport bug fixes beside others.
> 
>  >>  We changed the default physical extent size to 32Mb to support up
>  >>  to 2Tb logical volume size.
> 
>  >>  See the CHANGELOG and WHATSNEW files contained in the tarball
>  >>  for further information.
> 
> 
>  >>  Feed back LVM related information to <linux-lvm@sistina.com>.
> 
>  >>  Thanks a lot for your support of LVM.
> 
> 
>  >>  _______________________________________________
>  >>  linux-lvm mailing list
>  >>  linux-lvm@sistina.com
>  >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
>  >>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> 
> 
> 
> Greg Freemyer
> Internet Engineer
> Deployment and Integration Specialist
> Compaq ASE - Tru64 v4, v5
> Compaq Master ASE - SAN Architect
> The Norcross Group
> www.NorcrossGroup.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
