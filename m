Return-Path: <dg@suse.com>
Date: Sun, 10 Dec 2000 22:48:08 -0800
From: David Gould <dg@suse.com>
Subject: Re: [linux-lvm] How do you mount a snapshot?
Message-ID: <20001210224808.B3772@archimedes.oak.suse.com>
References: <20001207223300.D25533@archimedes.oak.suse.com> <323270000.976284597@coffee> <20001208103007.D27307@archimedes.oak.suse.com> <03b601c06155$c25d1b10$070414ac@pin.lu>
Mime-Version: 1.0
In-Reply-To: <03b601c06155$c25d1b10$070414ac@pin.lu>; from chris@Nice.CH on Fri, Dec 08, 2000 at 09:30:50PM +0100
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Dec 08, 2000 at 09:30:50PM +0100, Christian Limpach wrote:
> > Ok, so we are agreeing, it does not work on ext2 either unless you sync
> > and do not write between the sync and the snapshot. Doable, but not
> exactly
> > "safe".
> 
> hmm, I think it works for ext2 because you can always mount an ext2
> filesystem even if it's in an inconsistent state.  This is what happens
> everytime when your machine panics and you need to fsck your disks during
> the reboot, the root filesystem is mounted read-only...  It's my

Ok, but then you have an inconsistant filesystem. Which is not exactly
what I think of as "works" or "safe". My point was that snapshots are
great, but don't make the problem of consistancy magically disappear.

-dg

-- 
David Gould                                                 dg@suse.com
SuSE, Inc.,  580 2cd St. #210,  Oakland, CA 94607          510.628.3380
"As I've gained more experience with Perl it strikes me that it
 resembles Lisp in many ways, albeit Lisp as channeled by an awk
 script on acid."  -- Tim Moore <moore@herschel.bricoworks.com>,
                      on comp.lang.lisp
