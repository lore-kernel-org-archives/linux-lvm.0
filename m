Return-Path: <mjt@tls.msk.ru>
Message-ID: <3B1C16AA.AD983576@tls.msk.ru>
Date: Tue, 05 Jun 2001 03:15:54 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
References: <3B1AC411.D6E307CD@tls.msk.ru> <200106041734.f54HYLbh020302@webber.adilger.int> <20010604171512.A348@sistina.com>
Content-Transfer-Encoding: 7bit
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

AJ Lewis wrote:
[]
> Hmm...I put 'sed' in the debian package wrapper scripts since Debian put's
> basename in /usr/bin and if you don't use an initrd script and you have your
> /usr partition on LVM, you can't use the wrapper...
> 
> Is there an easy way we can work around this?  Maybe hack up the
> create_initrd script a bit more?  I can just adjust it in the debian
> packages too i guess.

So basename also should be placed to initrd? ;)  I think that
problem should be resolved at a first place (in mkinitrd), not
by putting numerous workarounds all other the place.
BTW, bash have nice construct ${var##*/} to be used instead of
basename, and it works *much* faster (also ${var%/*} for dirname
etc).

Regards,
 Michael.
