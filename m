Return-Path: <bluca@comedia.it>
Date: Tue, 5 Jun 2001 20:08:04 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
Message-ID: <20010605200804.B30682@colombina.comedia.it>
References: <3B1C16AA.AD983576@tls.msk.ru> <200106051755.f55HtKSG005083@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200106051755.f55HtKSG005083@webber.adilger.int>; from adilger@turbolinux.com on Tue, Jun 05, 2001 at 11:55:20AM -0600
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

On Tue, Jun 05, 2001 at 11:55:20AM -0600, Andreas Dilger wrote:
> I tried this in my lvm-wrapper and it works fine, but on my system /bin/sh
> is /bin/bash.  This also works with /bin/zsh, but doesn't work with /bin/ash.
> 
> One issue is how to get this fix out.  Since the lvm-wrapper is not part
> of the LVM tools itself, it is up to vendors to read this email and fix
> it...
I wrote a wrapper in c and posted it to this list some months ago,

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
