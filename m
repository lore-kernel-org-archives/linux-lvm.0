Date: Wed, 7 Jun 2000 00:46:18 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
Message-ID: <20000607004618.A13524@gruyere.muc.suse.de>
References: <20000606164220.A6566@gruyere.muc.suse.de> <Pine.LNX.4.21.0006062316170.26807-100000@fogarty.jakma.org>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0006062316170.26807-100000@fogarty.jakma.org>; from paul@clubi.ie on Tue, Jun 06, 2000 at 11:30:48PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Jakma <paul@clubi.ie>
Cc: Andi Kleen <ak@suse.de>, Linux LVM list <linux-lvm@msede.com>

On Tue, Jun 06, 2000 at 11:30:48PM +0100, Paul Jakma wrote:
> > This means you effectively can only take
> > snapshots from unmounted file systems.
> > 
> 
> eh? but a snapshot is not ever meant to be used directly as an
> alternate filesystem, so there's no point running fsck on it.. ??

You cannot safely access a unclean file system without replaying the log
(when it is journaled) or running fsck (when it is not journaled). The
file system meta data may not be consistent: files may contain bogus
blocks, directories may point to nowhere, inodes may be outdated etc.
In short, without write access you cannot safely read it, except
when it was cleanly unmounted


-Andi
