From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] is devfs required?
Message-Id: <20020222201251.GG30259@colombina.comedia.it>
References: <20020221143602.F328@majestic.ukshells.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020221143602.F328@majestic.ukshells.co.uk>
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
Date: Fri Feb 22 14:13:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM <linux-lvm@sistina.com>

On Thu, Feb 21, 2002 at 02:36:02PM +0000, Vincent AE Scott wrote:
> i'm using LVM on a 2.4.17-19mdk kernel patched up to 1.0.3
> it *appears* that when i boot up without devfs support, i frequently
> cant create/extened/mount filesystems.  but when i boot up with devfs
> support it seems to work.
> 
> is devfs required to use LVM?
i am also using 2.4.17-19mdk + LVM
the issue is not with the kernel portion but with the tools portion
if you start using lvm with devfs you are stuck with it and vice-versa.
i proposed a workaround about 13 months ago, but never actually got
to code it. :(

> without it, ive seen lvcreate SEGV when attempting to create a new
> volume.  
which version of the tools are u using?
if it is current can you provide a debug output?
if you want to build an rpm for recent tools fetch spec and
patch from http://www.comedia.it/bluca/lvm and adapt it
to 1.0.3 (will upgrade the site soon)
the mkinitrd stuff does not work with 2.4.17-19mdk and xfs

> or are there any known problems with using LVM on an SMP host?  i cant
> think of anything else that might be causing these strange problems.
no known issues.

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
