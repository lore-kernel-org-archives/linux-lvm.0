Return-Path: <mark@infoeng.flinders.edu.au>
Date: Wed, 24 Jan 2001 19:35:20 +1030
From: Mark Phillips <mark@infoeng.flinders.edu.au>
Subject: Re: [linux-lvm] Fwd: 2.4.0 kernel doesn't see LVM
Message-ID: <20010124193520.S715@ist.flinders.edu.au>
References: <20010124184810.R715@ist.flinders.edu.au> <20010124040016.A30469@jhereg.dmeyer.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010124040016.A30469@jhereg.dmeyer.net>; from dmeyer@dmeyer.net on Wed, Jan 24, 2001 at 04:00:16AM -0500
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
To: dmeyer@dmeyer.net
Cc: linux-lvm@sistina.com

dmeyer@dmeyer.net [dmeyer@dmeyer.net] wrote:
> In article <20010124184810.R715@ist.flinders.edu.au> you write:
> > I tried compiling the final version of 2.4.0 with LVM compiled in, but
> > when I tried booting, it complained that it didn't know about my LVM
> > devices!  It seems strange that 2.4.0-test9 works fine but 2.4.0
> > doesn't.  Could it be that I need to upgrade to 0.9 of the LVM
> > software?
> 
> You got it - you need the 0.9 user tools from ftp.sistina.com.  BTW,
> you might want to think about going to 0.9.1beta2 - it's got some
> important fixes and it at least as stable as 0.9.

If I upgrade from 0.8 to 0.9.1beta2, will it be backward compatible?
That is, will I still be able to use LVM fine under my current
2.4.0-test9 kernel?

Thanks,

Mark.

-- 
_/~~~~~~~~\___/~~~~~~\____________________________________________________
____/~~\_____/~~\__/~~\__________________________Mark_Phillips____________
____/~~\_____/~~\________________________________mark@ist.flinders.edu.au_
____/~~\HE___/~~\__/~~\APTAIN_____________________________________________
____/~~\______/~~~~~~\____________________________________________________
__________________________________________________________________________
        "They told me I was gullible ... and I believed them!" 
