Return-Path: <bluca@comedia.it>
Date: Tue, 5 Jun 2001 01:28:45 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
Message-ID: <20010605012845.B26506@colombina.comedia.it>
References: <3B1AC411.D6E307CD@tls.msk.ru> <200106041734.f54HYLbh020302@webber.adilger.int> <20010604171512.A348@sistina.com> <3B1C16AA.AD983576@tls.msk.ru>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B1C16AA.AD983576@tls.msk.ru>; from mjt@tls.msk.ru on Tue, Jun 05, 2001 at 03:15:54AM +0400
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
To: linux-lvm@sistina.com

On Tue, Jun 05, 2001 at 03:15:54AM +0400, Michael Tokarev wrote:
> So basename also should be placed to initrd? ;)  I think that
> problem should be resolved at a first place (in mkinitrd), not
> by putting numerous workarounds all other the place.
> BTW, bash have nice construct ${var##*/} to be used instead of
> basename, and it works *much* faster (also ${var%/*} for dirname
> etc).
naw it ain't bash, luckily thass a posix construct
please use parameter expansion instead of basename/dirname
in any script.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
