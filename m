From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
Message-ID: <20031231093358.GG31937@percy.comedia.it>
References: <OFC233D70E.1FE3DC79-ON00256E0D.001186FF-00256E0D.00118725@svunta.os.is>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFC233D70E.1FE3DC79-ON00256E0D.001186FF-00256E0D.00118725@svunta.os.is>
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
Date: Wed Dec 31 03:35:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Dec 31, 2003 at 03:11:27AM +0000, Kjartan Reynir Hauksson wrote:
>Hello all.
>
>I've been scratching my head on this for a few days now.  I decided to to
>migrate to kernel 2.6 but first I need to migrate from lvm1 to dm+lvm2
>(from what I understand).  So I've allready patched a vanilla 2.4.22 kernel
are you running a particular distro? if so telling which one it is could
be useful in gifing you the right hints.

your distro probably has an mkinitrd command, so you would need to patch
it to support lvm2 if it does not already.
you might also need to patch your sysinit boot script

you will also need patching lilo to understand device-mapper, else it
will not run anymore on your dm patched kernel (see
http://www.saout.de/misc/)

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
