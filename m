Date: Sat, 21 Oct 2000 11:21:47 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: Re: [linux-lvm] Is LVM dead ?
Message-ID: <20001021112147.A1131@gondor.com>
References: <39F0B45C.6735D447@tls.msk.ru> <20001020220300.B22203@homer.sistina.com> <20001021054924.A636@gruyere.muc.suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20001021054924.A636@gruyere.muc.suse.de>; from ak@suse.de on Sat, Oct 21, 2000 at 05:49:24AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: Heinz Mauelshagen <mauelshagen@sistina.com>, Michael Tokarev <mjt@tls.msk.ru>, linux-lvm@msede.com

On Sat, Oct 21, 2000 at 05:49:24AM +0200, Andi Kleen wrote:
> Perhaps it would be useful if you could do an interim 0.8 mainteance
> release, with e.g. all the simple bugfixes Andreas Dilger has collected
> (segfaults etc.) There are unfortunately a few annoying bugs in the stock 
> 0.8 userland, which people rediscover and rereport all the time.

Actually I think Andreas could do the interim releases (if he wants to).
There is nothing wrong with having one maintainer for the development tree
and one for the stable tree. Andreas already has a .rpm with all the known
bugfixes, all we need now, is a tarball of that stuff.

And the 0.8 userlevel tools will be important: The 0.9 kernel changes are 
probably fairly huge, so Linus may not include them in 2.4. That means we
need stable 0.8 tools for 2.4.

Jan
