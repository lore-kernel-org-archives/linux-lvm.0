From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: problem with lvm on root-fs
Message-ID: <20021020103456.GC26167@percy.comedia.it>
References: <200210170859.03682.sw@global-linxs.de> <20021018095829.GA687@percy.comedia.it> <200210181241.28210.sw@global-linxs.de> <200210181505.11782.sw@global-linxs.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200210181505.11782.sw@global-linxs.de>
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
Date: Sun Oct 20 05:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 18, 2002 at 03:05:11PM +0200, Stefan Weigel wrote:
>Hi Luca!
>I should be happy now but there's still a problem left. First: now I can boot 
>from my lvm-root-fs (yeeehhaaa). My problem: one line in /etc/lilo.conf 
>(ramdisk=16384 instead of ramdisk=8192).
>But if I now want to run lilo I get this message:
>
>Fatal: Sorry, dont know how to handle device 0x3a05
>
this could be caused by an old lilo version.

LVM support was added to mainstream lilo in version 22.

upgrade to latest version from
ftp://metalab.unc.edu/pub/Linux/system/boot/lilo

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
