From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Support for RedHat AS2.1?
Message-ID: <20021029220336.GF18253@percy.comedia.it>
References: <200210280943.40808.defranco@cup.hp.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200210280943.40808.defranco@cup.hp.com>
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
Date: Tue Oct 29 16:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 28, 2002 at 10:43:40AM -0700, John DeFranco wrote:
>I see on the Sistina web page that LVM is supported on RedHat Advanced Server 
>2.1. So I have a couple of questions:
>
>2. Which redhat kernel errata (2.4.9-e.3 and/or 2.4.9-e.8)?
latest (if that kernel can be called recent) is 2.4.9-e.9

>3. I did try to apply the 1.0.6 version on the 2.4.9-e.3 kernel I got a couple 
>of patch installation errors (Makefile and lvm-snap.c was missing). Are these 
>expected? I cannot find any other directions that are specific to AS2.1. Are 
>there any others?
anyway standard lvm patch process supposes you have a stock kernel, and
AFAIR that was the only setup supported by sistina (feel free to correct
me if i am wrong).

i expected a difference in makefile lvm-mod-objs should be correct on rh
kernels (read the reject and the original and see for yourself)
and lvm-snap.h (not .c) has also been removed.
the rest of the patch is more or less a diff between your current lvm
files and those in LVM/1.0.6/kernel
so you can ignore those.

regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
