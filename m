Return-Path: <weissel@netcologne.de>
From: Wolfgang Weisselberg <weissel@netcologne.de>
Date: Thu, 26 Jul 2001 13:55:14 +0200
Subject: Re: [linux-lvm] Some ideas regarding snapshots (was: Reiserfs, 2.4.7, snapshots w/ 0.9)
Message-ID: <20010726135514.B26425@tiger.bigcats.invalid>
References: <20010725103640.J5363@unirez.com> <01072511465701.00921@exodus>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01072511465701.00921@exodus>; from iain@sandon.ca on Wed, Jul 25, 2001 at 11:46:57AM -0400
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

Iain Campbell (iain@sandon.ca) wrote 64 lines:
> Quote from Teigland and Mauelshagens's Volume Manager whitepaper:

> journalled file system. These operations (fsck or journal replay) require 
> writing to  the snapshot ligical volume, which is not allowed."

On a related subject: would it be possible to have a writable
snapshot (probably a 'reverse' snapshot)?

I remember a few situations where I would have done a lot for
a feature like that; e.g. building a system that's 'guaranteed'
the same after restarting/rebooting it.

The idea is along the lines of:
- you have the system in a known good, fscked state on the HD.
- you snapshot that (possibly huge) system
- you mount the snapshots r/w
- the original will probably stay unmounted or r/o (but not
  neccessarily, I am thinking of robust, networked stand-alone
  devices which could be upgraded in the background while
  running; a simple restart will have the upgrade applied.)
- The system can scribble onto the snapshots until they
  are full.
- To reset the complete system to the known good state, umount,
  unsnapshot, start over.  Or even -- horror -- reboot.

This should be *much* faster than a reintarnation or the use
of dd, not to mention easier, simpler, more elegant and using
less space.


And on another related idea: can we have the option of making
snapshots non-persistant again?  Or is that lots of work?
There sometimes are cases where snapshots lose all value over
a reboot, so they could/should automagically disappear.

-Wolfgang
