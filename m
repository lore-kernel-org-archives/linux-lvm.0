From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM2 and Kernel 2.5.xx
Message-ID: <20021007104553.B17176@sistina.com>
References: <200210070638.PPL01042@vmms4.verisignmail.com>
Mime-Version: 1.0
In-Reply-To: <200210070638.PPL01042@vmms4.verisignmail.com>; from david@lownoisefloor.com on Sun, Oct 06, 2002 at 11:38:26PM -0700
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
Date: Mon Oct  7 03:51:24 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

As mentioned a couple of days ago on this list, we are working on submitting
the device-mapper code to Linus ASAP. This is supposed to be the replacement for
the LVM1 driver in 2.5 together with the LVM2 tools (which are LVM1 compatible).

We'll continuer to support LVM1 on 2.4.

On Sun, Oct 06, 2002 at 11:38:26PM -0700, david@lownoisefloor.com wrote:
> To anyone who might listen...
> 
> I get this error:
> 
> lvm.c:1: #error Broken until maintainers will sanitize kdev_t 
> handling.
> ---end error---
> Based on a note from Linus about new kdev_t... it looks like 
> this is still under construction...
> 
> Can someone tell me which 2.5.xx kernel is currently working 
> with LVM... so I dont have to download everyone and try each 
> one... 
> 
> Thanks
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
