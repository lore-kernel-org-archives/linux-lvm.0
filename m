From: "Jason A. Lixfeld" <jlixfeld@andromedas.com>
Subject: RE: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
Date: Wed, 3 Oct 2001 23:28:06 -0400
Message-ID: <009001c14c84$9559f820$836788cf@industry>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.33.0110040141320.21655-100000@fogarty.jakma.org>
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
To: linux-lvm@sistina.com

I'm having the same problem:

# /sbin/lvcreate -L 111G -n test_lv test_vg
Segmentation fault (core dumped)
#

Running:
LVM driver LVM version 1.0.1-rc4(03/10/2001)
Kernel 2.4.10
ext3-2.4-0.9.10-2410

What's the fix here?!

> -----Original Message-----
> From: linux-lvm-admin@sistina.com 
> [mailto:linux-lvm-admin@sistina.com] On Behalf Of Paul Jakma
> Sent: October 3, 2001 8:46 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] lvcreate segfault in 
> vg_setup_pointers_for_snapshots
> 
> 
> 
> On Wed, 3 Oct 2001, Andreas Dilger wrote:
> 
> > would be helpful.  Also, there is a known issue about the "inline" 
> > functions, which may not have been fixed yet (it is a compiler bug).
> 
> oh yes..
> 
> i read through the archives before posting, and found 
> reference to this.  however, it happens when compiled with egcs too.
> 
> also, the other bug was in was in lv_create(), my one is in
> a different place (see subject line).
> 
> > Cheers, Andreas
> 
> regards,
> -- 
> Paul Jakma	paul@clubi.ie	paul@jakma.org	Key ID: 64A2FF6A
> Fortune:
> Liberty is always dangerous, but it is the safest thing we have.
> 		-- Harry Emerson Fosdick
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com 
> http://lists.sistina.com/mailman/listinfo/linu> x-lvm
> read the 
> LVM HOW-TO at 
> http://www.sistina.com/lvm/Pages/howto.html
> 
