From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] problem running vgscan..Is it a megaraid issue or an LVM issue ??
Message-ID: <20020627141103.A21869@sistina.com>
References: <3D1AD32B.400@ti.com> <20020627115054.B21400@sistina.com> <3D1AF4FB.1080605@ti.com>
Mime-Version: 1.0
In-Reply-To: <3D1AF4FB.1080605@ti.com>; from cej@ti.com on Thu, Jun 27, 2002 at 01:20:27PM +0200
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
Date: Thu Jun 27 07:19:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jun 27, 2002 at 01:20:27PM +0200, christian e wrote:
> Heinz J . Mauelshagen wrote:
> > Christian,
> > 
> > are the Megaraid devices all accessable (driver module loaded/linked in)
> > when vgscan runs on reboot?
> > 
> > 
> 
> Yes I can boot the machine up without running vgscan and everything is 
> OK..So it's not a showstopper but it bugs me because it's not always 
> been like that..Could it be the way the PVs are made ?? That one is 
> /dev/sdb1 and the other /dev/sdc ??
> So one is actually on a partition 
> taking up the entire disk and the other is directly on the disk without 
> partition ??

Nope, shouldn't make a difference.

> Hope that made sense..hehe..It could maybe explain things 
> as our data is now taking up more thatn just the one PV..

Please remember to send the "vgscan -d" output to me directly <mge@sistina.com>.

> 
> best regards
> 
> Christian
> -- 
> Christian Ejstrup, IT Admin / RF Development Engineer
> Texas Instruments A/S, Denmark ,Sofiendalsvej 93,DK-9200 Aalborg SV,Denmark
> Phone:+45 96346868, Phone(direct):+45 96346860, GSM:+45 22234304
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
