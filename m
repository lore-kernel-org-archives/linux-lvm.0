Date: Wed, 8 Nov 2000 17:16:06 +0100
From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: [linux-lvm] Re: LVM 2.2 snapshot bug
Message-ID: <20001108171606.A3650@inspiron.suse.de>
References: <20001107205137.A7093@inspiron.suse.de> <200011072036.eA7Ka6s03317@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200011072036.eA7Ka6s03317@webber.adilger.net>; from adilger@turbolinux.com on Tue, Nov 07, 2000 at 01:36:06PM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: "Stephen C. Tweedie" <sct@redhat.com>, Rik van Riel <riel@conectiva.com.br>, linux-lvm@msede.com, marcelo@conectiva.com.br

On Tue, Nov 07, 2000 at 01:36:06PM -0700, Andreas Dilger wrote:
> The problem is that I/O errors during journal recovery would mean a
> corrupt filesystem.  The ext3 recovery code (now) does the correct thing
> and aborts the journal recovery [..]

ext3 oopses the kernel after getting I/O errors during the writes. I don't
consider that the correct thing.

Andrea
