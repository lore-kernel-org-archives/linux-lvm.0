Date: Tue, 6 Jun 2000 23:30:48 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
In-Reply-To: <20000606164220.A6566@gruyere.muc.suse.de>
Message-ID: <Pine.LNX.4.21.0006062316170.26807-100000@fogarty.jakma.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: Linux LVM list <linux-lvm@msede.com>

On Tue, 6 Jun 2000, Andi Kleen wrote:

> The SuSE 6.4 kernel contains a back port. You can download a source
> rpm from ftp.suse.com 
> 

uhmm... but an officially sanctioned patch blessed by Heinz would be
nicer.. :)

> Note that the snapshots may not be as useful as you may think
> though - they are readonly 

they have to be by their very nature...  :)

> and it is therefore impossible to
> replay a journal or run a fsck on them.

why would you want to? snapshots main application is for providing a
'snapshot' of a point in time so you can make a consistent backup of
the data, esp for large/frequently modified databases.

which is precisely what i want snapshots for.

> This means you effectively can only take
> snapshots from unmounted file systems.
> 

eh? but a snapshot is not ever meant to be used directly as an
alternate filesystem, so there's no point running fsck on it.. ??

> -Andi
> 
> 

-- 
Paul Jakma	paul@clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
The Wright Bothers weren't the first to fly.  They were just the first
not to crash.
