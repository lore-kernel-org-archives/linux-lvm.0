Return-Path: <jgarzik@mandrakesoft.com>
Message-ID: <3ADFEC4E.BBB210DF@mandrakesoft.com>
Date: Fri, 20 Apr 2001 03:59:10 -0400
From: Jeff Garzik <jgarzik@mandrakesoft.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: [repost] Announce: Linux-OpenLVM mailing list
References: <20010420093751.D12971@colombina.comedia.it>
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
To: bluca@comedia.it
Cc: linux-lvm@sistina.com, linux-openlvm@nl.linux.org, AJ Lewis <lewis@sistina.com>, Jes Sorensen <jes@linuxcare.com>, linux-kernel@vger.kernel.org, Andreas Dilger <adilger@turbolinux.com>, Arjan van de Ven <arjanv@redhat.com>, Jens Axboe <axboe@suse.de>, Martin Kasper Petersen <mkp@linuxcare.com>, riel@conectiva.com.br, Alan Cox <alan@lxorguk.ukuu.org.uk>

Luca Berra wrote:
> we have some serous problems here.
[...]
> a better lvm (still buggy according to many kernel hackers, but better still),
> which does not get into the kernel for communication reasons. (Alan can you help?
> there is a lot of stuff that goes in -ac before going to mainstream)

I do not think this is a communication problem at all, but a clear lack
of understanding (perhaps willful) on the part of the "LVM maintainers"
about how to get things into the kernel.

linux/Documentation/SubmittingPatches exist to bonk people on the head
if they are screwing up, and it sounds like such is occurring now.

Quite simply,

1) Split up your patches.  How many times does it have to be said? 
Think ONE CHANGE, ONE PATCH.  Big patches full of tons of disparate
changes are impossible to review.

2) (parroting Linus)  Open source is about lack of control, not hoarding
code and lording over it.  That's why Linus will take a patch from Jens
or another knowledgeable person who says "this LVM code is broken,
-here- is a fix." -- regardless of who the "official" maintainer of the
code is listed as...

[Luca, this is not directed at you, I just used this message as an
opportunity to spout :)]

-- 
Jeff Garzik       | "The universe is like a safe to which there is a
Building 1024     |  combination -- but the combination is locked up
MandrakeSoft      |  in the safe."    -- Peter DeVries
