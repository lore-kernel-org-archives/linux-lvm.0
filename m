Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Sat, 13 Jan 2001 12:12:33 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] LVM 0.9.1beta1 vgscan segfault when run with -d
Message-ID: <20010113121233.J21587@srv.t-online.de>
References: <20010112223600.A846@mvista.com>
Mime-Version: 1.0
In-Reply-To: <20010112223600.A846@mvista.com>; from cduffy@mvista.com on Fri, Jan 12, 2001 at 10:36:00PM -0800
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

Did you try 0.9.1 beta1 and face the same behaviour?

On Fri, Jan 12, 2001 at 10:36:00PM -0800, Charles Duffy wrote:
> Howdy. I'm experiencing some difficulties while transitioning from LVM
> 0.8i to 0.9.
> 
> vgscan reports:
> 
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV": can't
> get data of volume group "vg01" from physical volume(s)
> 
> When I try to recieve more info (by running vgscan with "-D"), I
> recieve a segfault.
> 
> This appears to be happening inside pv_read_uuidlist, at the memset on
> line 91 (I added some extra debug() calls to determine this). The
> attached log (from the original, unpatched version) should help by
> giving some context.
> 
> Frankly, I don't know why this is happening -- more than sufficient
> space appears to be allocated beforehand -- but, as long as one rules
> out a bug in debug(), I don't see any other way 'round it.
> 
> Thanks for your help.



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
