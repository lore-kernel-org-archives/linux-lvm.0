From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvdisplay/lvdisplay discrepancy
Message-ID: <20021209114604.B18845@sistina.com>
References: <1039235299.2304.21.camel@delight>
Mime-Version: 1.0
In-Reply-To: <1039235299.2304.21.camel@delight>; from spin@avalon.net on Fri, Dec 06, 2002 at 10:28:18PM -0600
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
Date: Mon Dec  9 04:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Alan,

I am not sure if there's a difference between the Redhat package and our source
causing this.
Are you able to reproduce this with stock LVM1.0.6 tools from www.sistina.com ?
(have send pvdisplay and lvdisplay version 1.0.6 in private email to you
to test this).

Get back to me if there is none and I'll have a look at your metadata.

Regards,
Heinz    -- The LVM Guy --


On Fri, Dec 06, 2002 at 10:28:18PM -0600, Aran Cox wrote:
> I've discovered that pvdisplay and lvdisplay seem to disagree on the
> exact location of some extents in a volume group on my system.
> 
> I am using stock 2.4.19 kernel with the lvm tools from the RPM package 
> of the same name for RH7.3.
> 
> I'll show the output of the *display programs below but to summarize:
> pvdisplay shows a small number of extents in /dev/main/var as being on
<SNIP>
> "/dev/sdb"
> 
> 
> 
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
