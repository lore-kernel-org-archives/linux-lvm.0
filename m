Return-Path: <jdomingo@crosswinds.net>
Date: Tue, 24 Jul 2001 22:46:56 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] LVM vs. md: Benefits in RAID0?
Message-ID: <20010724224656.A2226@dardhal.mired.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010724151319.H25303@linux.com>
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

On Tuesday, 24 July 2001, at 15:13:19 -0400,
Jason Tackaberry wrote:

> I am about to be deploying a new server whose purpose is to replace an
> existing, aging system.  The new server has 2 18GB drives.  Once I
> migrate the user data to the new server, I can reclaim a practically
> [...]
>
The quick and dirty hack to get resizable RAIDed storage devices is:

a) Layer LVM on top of (hard/soft) RAID
b) Layer sotfware RAID on top of software LVM

My tests with _crappy_ hardware show better performance with setup a). It
has the added advantage of being able to use hardware RAID, and avoid
some layering overhead on the operating system side (there are quite
inexpensive SCSI hardware RAID for IDE and SCSI buses out there).

With setup a), you should create one or more RAID devices (depending on
type and information to be stored) and then, create a VG from each RAID
device. For example, a 3-disk software RAID-5 consisting of 3 10 GB
partitions gives you a /dev/md0 20 GB large.

Make a pvcreate /dev/md0, then a vgcreate Group00 /dev/md0 and define LV
from this VG (lvcreate -n Group00 -L 5G Volume00). This LV holds your data
and avoids loosing them upon a 1-disk failure (RAID-5), and lets you
hot-resize the LV (if the filesystem allows it).

Greetings.

--
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
