From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm raid levels
Message-ID: <20031017182211.A848@sistina.com>
References: <200310170939.00640.3dnerd@bellsouth.net>
Mime-Version: 1.0
In-Reply-To: <200310170939.00640.3dnerd@bellsouth.net>; from 3dnerd@bellsouth.net on Fri, Oct 17, 2003 at 09:39:00AM -0400
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
Date: Fri Oct 17 11:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 17, 2003 at 09:39:00AM -0400, Dave wrote:
> Heinz,
> 
> I have searched through the man pages, as well as quite a few documents and 
> message boards looking for a way to see the raid level after a volume has 
> been created.
> 
> ex.  Joe NewAdmin takes over duties after Joe OldAdmin goes to lunch and never 
> returns.  Joe NewAdmin needs to know if a volume is a stripe or if it's 
> simply concatenated (the equivilent of veritas' vxprint and vxinfo).

Dave,

make Joe NewAdmin use lvdisplay on the logical volumes, which shows if
they are striped or linear.


> 
> Is there a way to do this currently?
> 
> Thank you for your time and assistance in this matter,
> 
> Dave Catrett
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
