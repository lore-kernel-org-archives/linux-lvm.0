Return-Path: <jdomingo@crosswinds.net>
Date: Wed, 25 Jul 2001 23:57:47 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] Reiserfs, 2.4.7, snapshots w/ 0.9
Message-ID: <20010725235747.B2227@dardhal.mired.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010725214451.B27765@sistina.com>
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

On Wednesday, 25 July 2001, at 21:44:51 +0200,
Heinz J . Mauelshagen wrote:

> 
> Mark,
> 
> Chris Mason implemented an interface between the VFS and LVM, which is defined
> by 2 new functions VFS functions. They have to be supported in the filesystem
> itself in order to flush the journal and lock the filesystem for I/O, get
> back to LVM so that it can activate the prepared snapshot. LVM unlocks the
> filesystem after this.
> You pay a (small) I/O penalty for the journal flush.
> 
> Because those functions are not in vanilla, you still need to patch the
> kernel with the linux-2.4.X-VFS-lock-patch contained in the LVM distribution :-(
> 
Does it mean that, to support XFS snapshots you need to apply the patch ?.
http://linuxtoday.com/news_story.php3?ltsn=2001-07-11-011-20-NW-SW

This announcement says XFS 1.0.1 has "LVM snapshotting capability added",
but it says nothing about additional kernel patches required.

Could you clarify please ?.

--
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
