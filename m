Return-Path: <chris@Nice.CH>
Message-ID: <03b601c06155$c25d1b10$070414ac@pin.lu>
From: "Christian Limpach" <chris@Nice.CH>
References: <20001207223300.D25533@archimedes.oak.suse.com> <323270000.976284597@coffee> <20001208103007.D27307@archimedes.oak.suse.com>
Subject: Re: [linux-lvm] How do you mount a snapshot?
Date: Fri, 8 Dec 2000 21:30:50 +0100
MIME-Version: 1.0
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
To: linux-lvm@sistina.com

> Ok, so we are agreeing, it does not work on ext2 either unless you sync
> and do not write between the sync and the snapshot. Doable, but not
exactly
> "safe".

hmm, I think it works for ext2 because you can always mount an ext2
filesystem even if it's in an inconsistent state.  This is what happens
everytime when your machine panics and you need to fsck your disks during
the reboot, the root filesystem is mounted read-only...  It's my
understanding, that reiserfs will always "fsck" (replay it's log) on mount
and that's why it won't mount read-only when the filesystem is not in a
consistent state.  What I don't know is if it would be possible to make
reiserfs not care about the inconsistencies (i.e. not replay the log) when
it mounts read-only?

An atomic sync-snapshot is of course the (implemented) solution, but it
would be nice if it would also work without that...

     christian
