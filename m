From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Pvresize: only in 1.1-rc2 or can it be used on 1.0.5 ?
Message-ID: <20021001121706.A31305@sistina.com>
References: <20020927102805.553A3279E1@giant.koningspage.nl>
Mime-Version: 1.0
In-Reply-To: <20020927102805.553A3279E1@giant.koningspage.nl>; from m.vd.brink@worldonline.nl on Fri, Sep 27, 2002 at 12:28:04PM +0200
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
Date: Tue Oct  1 05:17:07 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Melis,

1.1 is an interim development branch which we discontinued to work on
because of LVM2.

But yes, you can generate 1.1 in addition to your installed 1.0.5.
Don't install it if you want to keep your LVM 1.0.5 installed,
just run "tools/lvm pvresize YourPV". Your VG containing the PV must be inactive
to run pvresize.

On Fri, Sep 27, 2002 at 12:28:04PM +0200, Melis van den Brink wrote:
> Hi,
> 
> I'm using LVM 1.0.5 on a 2.4.18 kernel (with preemptive patch). I was looking 
> for the pvresize command but saw that it only existed in 1.1(-rc2).
> Is it possible (I haven't tried compiling pvresize against 1.0.5) to use 
> pvresize in a 1.0.5 environment or are there restrictions or preconditions 
> that only 1.1 can fulfill ?
> Another question: what's the status of 1.1 ? Will it ever be the successor of 
> 1.0.x or is it best to wait for 2.0 ?
> -- 
> Regards,
> 
> Melis van den Brink
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
