From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] return from lvm2 to lvm
Message-ID: <20031125073143.GA17158@percy.comedia.it>
References: <3FC24C0F.7030701@mail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3FC24C0F.7030701@mail.com>
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
Date: Tue Nov 25 01:33:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 24, 2003 at 07:21:03PM +0100, guy cadoche wrote:
>I was using lvm on a 2.4 kernel (gentoo) and it works perfectly.
>I install kernel-2.6 and lvm2 : works perfectly.
>I want to return to kernel-2.4 and as the patch for device-mapper is not 
>include in the kernel core, cannot mount the lvm disk.
>it search for device-mapper (modprobe) and not for lvm-mod
>I unmerge lvm2 and device-mapper...still the same.
>Is there a way to return to use lvm-mod under kernel-2.4.22 ???

I'd ask on a gentoo mailing list, it looks like a distro specific
problem.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
