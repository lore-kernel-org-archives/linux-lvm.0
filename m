From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] is devfs required?
Message-Id: <20020222201516.GH30259@colombina.comedia.it>
References: <20020221143602.F328@majestic.ukshells.co.uk>
    <Pine.LNX.4.44.0202211148310.27177-100000@dragon.inside.ntisys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0202211148310.27177-100000@dragon.inside.ntisys.com>
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
Date: Fri Feb 22 14:15:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM <linux-lvm@sistina.com>

On Fri, Feb 22, 2002 at 09:22:03AM -0500, Benjamin Scott wrote:
>    I notice from your kernel version (2.4.17-19mdk) that you are using
> Mandrake.  Try compiling from pristine sources.  Who knows what Mandrake has
> done to their kernel or tools?
whoever whishes to look at their SRPMS :)))
anyway i added lvm to mandrake kernels and it works ok.

>   Also, Mandrake uses Red Hat's goofy "GCC 2.96" compiler by default.  Try
> using "kgcc" to compile your kernel and LVM tools instead.  Red Hat's
> compiler is notorious for causing weird problems.
mandrake gcc 2.96 is known to work with lvm while redhat one is not.

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
