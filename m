Return-Path: <jdomingo@crosswinds.net>
Date: Thu, 24 May 2001 20:00:01 +0000
From: =?us-ascii?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] Raid5 sync problem
Message-ID: <20010524200000.A1280@dardhal.mired.net>
References: <001801c0e444$22d57f20$56dc10c3@tal.org> <200105241704.f4OH4Rom014186@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200105241704.f4OH4Rom014186@webber.adilger.int>; from adilger@turbolinux.com on Thu, May 24, 2001 at 11:04:27AM -0600
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Thursday, 24 May 2001, at 11:04:27 -0600,
Andreas Dilger wrote:

> Kaj-Michael Lang writes:
> [...]
> This is the "RAID5 speed limit" which only kicks in if you have I/O to
> the volume while you are resyncing.  You can change a parameter somewhere
> in the RAID code which increases the minimum speed at which resync is
> done on active volumes (at the expense of performance for other apps).
> 
Under 2.4.x there are two "tunnables" on /proc, namely:
/proc/sys/dev/raid/speed_limit_min
/proc/sys/dev/raid/speed_limit_max

Both are expressed in KB/s. The latter sets the maximun array
reconstruction speed for RAID-1,4,5 (taking available IO), and the former
sets the minimun "guaranteed" reconstruction speed.

At least on my 2.4.4, "minumun speed" is set to 100 KB/s, and "maximun
speed" equals 100000 KB/s, but it seems that array reconstruction always
operate at the minimun guaranteed speed, 100 KB/s.

So echo "5000" > /proc/sys/dev/raid/speed_limit_min should help
determining whether this speed limit is causing the problems described.

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
