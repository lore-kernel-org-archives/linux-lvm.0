From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
Message-ID: <20040102191357.GI26275@percy.comedia.it>
References: <OF06F63D86.B4780DA6-ON00256E0F.0067BA5B-00256E0F.0067BA64@svunta.os.is>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF06F63D86.B4780DA6-ON00256E0F.0067BA5B-00256E0F.0067BA64@svunta.os.is>
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
Date: Fri Jan  2 13:15:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 02, 2004 at 06:52:59PM +0000, Kjartan Reynir Hauksson wrote:
>Did it and reran mkinitrd but I'm still getting kernel panic. It says
>pivotroot: pivot_root(sysroot,/sysroot/initrd) failed: 2
>
>Here's my mkinitrd output
>
>Looking for deps of module lvm-mod
>Looking for deps of module dm-mod
ok, you have dm builtin and not as a module, so autodetection does not
work.  You have to use the --lvm-version=2 option to mkinitrd.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
