Message-ID: <39580FFF.42AD815D@inet.net.nz>
Date: Tue, 27 Jun 2000 14:22:55 +1200
From: Dale Kemp <dale@inet.net.nz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
References: <299BF5F5EF5ED31196760008C7D9AE5D03AFCA1F@STLABCEXG022> <3957E4B8.99CC906C@inet.net.nz> <20000627040212.A11246@gruyere.muc.suse.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <ak@suse.de>
Cc: Linux LVM <linux-lvm@msede.com>

> The generic VFS code just never looks into the union,it is certainly
> abstractly used. Putting it into the union is just an performance optimization
> to make it use one allocation less in critical paths. File systems that
> do not want to change the source files are free to use the generic_ip
> pointer instead and let it point to a private structure.
>
> -Andi (who prefers Linux VFS over ``8.3 macro hell'' Sun/BSD derived VFS)

Yes, I see its abstractly used I guess OO programmers don't like the
whole concept of the union data structure, but for kernel programming,
device drivers etc it can make things go a bit quicker, and save space.

I hear from Andreas that design work is currently going on for VFS for
kernels 2.5/2.6. That's one of those things about Linux if it doesn't
exist, or needs improving, it's probably already being worked on -
relentless improvement.

-- Dale.
