Date: Wed, 7 Jun 2000 01:03:13 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
In-Reply-To: <20000607004618.A13524@gruyere.muc.suse.de>
Message-ID: <Pine.LNX.4.21.0006070049140.26807-100000@fogarty.jakma.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: Linux LVM list <linux-lvm@msede.com>

On Wed, 7 Jun 2000, Andi Kleen wrote:

> You cannot safely access a unclean file system without replaying the log
> (when it is journaled) or running fsck (when it is not journaled). The
> file system meta data may not be consistent: 

but why would the snapshot capture the fs in an inconsistent state?

> files may contain bogus
> blocks, directories may point to nowhere, inodes may be outdated etc.

only if the fs is inconsistent.. but why should the fs be
inconsistent when making the snapshot?

aiui the snapshot works within the lvm block layer. the fs works on
the block layer. for the fs to be inconsistent there must be a
disparity between the fs and the block layer at snapshot time, right?

but surely the snapshot would do some kind of atomic sync at the
point of snapshot creation? (what am missing?)

> In short, without write access you cannot safely read it, except
> when it was cleanly unmounted
> 

would mount -o remount,sync ; lvcreate -s ... ; mount -o
remount,async work?

> 
> -Andi
> 
> 

-- 
Paul Jakma	paul@clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
Democracy is the recurrent suspicion that more than half of the people
are right more than half of the time.
		-- E. B. White
