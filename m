Date: Sat, 29 Jan 2000 03:19:44 +0100
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] ReiserFS & LVM?
Message-ID: <20000129031944.A6770@gruyere.muc.suse.de>
References: <Pine.LNX.4.10.10001271743500.3114-100000@moses.muenster.com>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.10.10001271743500.3114-100000@moses.muenster.com>; from fraune@muenster.com on Thu, Jan 27, 2000 at 05:45:29PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Fraune <fraune@muenster.com>
Cc: linux-lvm@msede.com

On Thu, Jan 27, 2000 at 05:45:29PM +0100, Joerg Fraune wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> 
>  Hi,
> 
>  the reiserfs documentation says that reiserfs is incompatible with
> software raid due to conflicts in buffer page usage; is this also
> true for reiserfs & LVM?

No, it isn't. Reiserfs works fine with LVM.

-Andi
