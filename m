Return-Path: <lembark@wrkhors.com>
Message-ID: <3B1FFFBC.BD751028@wrkhors.com>
Date: Thu, 07 Jun 2001 17:27:08 -0500
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
References: <NBBBKLKHMJHIJLHOGAOJOECDIPAA.steve.wray@the.net.nz>
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

> Are there any other (good) reasons to have /tmp (or anything else other
> than /boot) on a 'real' partition rather than on LV?
> 
> How about swap on LV? Or does swap need to be used before the LV's
> are accessible?

Main issue is what will happen to the system if LVM gets broken.
The root volume (may not be the boot but usually is) and primary
swap are good bets for non-LVM only because you tend to need them
to repair LVM itself.

Depending on the disk, bus, cpu speed there may be an advantage
to having /tmp on non-LVM storage (only because you hit it so
hard; on HP-UX there is an advantage to having /tmp on mirrored
storage for speed :-).

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
