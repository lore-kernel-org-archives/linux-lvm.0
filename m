Date: Wed, 7 Jun 2000 01:09:26 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
In-Reply-To: <20000607004618.A13524@gruyere.muc.suse.de>
Message-ID: <Pine.LNX.4.21.0006070108470.26807-100000@fogarty.jakma.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: Linux LVM list <linux-lvm@msede.com>

incidentally, snapshots /seem/ to work fine here on live fs's with
2.4.0-test1-ac7.

On Wed, 7 Jun 2000, Andi Kleen wrote:

> On Tue, Jun 06, 2000 at 11:30:48PM +0100, Paul Jakma wrote:
> > > This means you effectively can only take
> > > snapshots from unmounted file systems.
> > > 
> > 
> > eh? but a snapshot is not ever meant to be used directly as an
> > alternate filesystem, so there's no point running fsck on it.. ??
> 
> You cannot safely access a unclean file system without replaying the log
> (when it is journaled) or running fsck (when it is not journaled). The
> file system meta data may not be consistent: files may contain bogus
> blocks, directories may point to nowhere, inodes may be outdated etc.
> In short, without write access you cannot safely read it, except
> when it was cleanly unmounted
> 
> 
> -Andi
> 
> 

-- 
Paul Jakma	paul@clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
The trouble with the rat-race is that even if you win, you're still a rat.
		-- Lily Tomlin
