From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] invalid number of free physical extents
Message-ID: <20020828151904.B27323@sistina.com>
References: <20020827204539.YTUD10186.imf28bis.bellsouth.net@TAZ2>
Mime-Version: 1.0
In-Reply-To: <20020827204539.YTUD10186.imf28bis.bellsouth.net@TAZ2>; from freemyer@NorcrossGroup.com on Tue, Aug 27, 2002 at 04:44:24PM -0400
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
Date: Wed Aug 28 08:41:21 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Aug 27, 2002 at 04:44:24PM -0400, Greg Freemyer wrote:
> My mistake,
> 
> I thought I had plenty of free space on the VG, put apparently, I was wrong.
> 
> I have reduced the size of a couple of my test LVs and it is working now.

Alright.
LVM2 will have a better error message ;)

> 
> Greg
>  >>  All,
> 
>  >>  I have a VG which I have used extensively for snapshot testing.
> 
>  >>  Now everytime I try to get a snapshot, it fails with error code 13
> 
>  >>  Per the man entry:
> 
>  >>  13 invalid number of free physical extents
> 
>  >>  I don't want to rebuild this VG because some of the other LVs on it have
>  >>  valid data.
> 
>  >>  Is there a lvm repair tool that might fix this for me.
> 
>  >>  Thanks,
>  >>  Greg
>  >>  ======
>  >>  Greg Freemyer
>  >>  Internet Engineer
>  >>  Deployment and Integration Specialist
>  >>  Compaq ASE - Tru64 v4, v5
>  >>  Compaq Master ASE - SAN Architect
>  >>  The Norcross Group
>  >>  www.NorcrossGroup.com
> 
>  >>  _______________________________________________
>  >>  linux-lvm mailing list
>  >>  linux-lvm@sistina.com
>  >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
>  >>  read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
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
