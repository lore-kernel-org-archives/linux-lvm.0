Return-Path: <ardy@rdb.linux-help.org>
Date: Mon, 26 Feb 2001 18:21:11 -0500 (EST)
From: <ardy@rdb.linux-help.org>
Subject: Re: [linux-lvm] Slackware init
In-Reply-To: <200102262215.f1QMF4W11409@webber.adilger.net>
Message-ID: <Pine.LNX.4.20.0102261819100.27432-100000@rdb.linux-help.org>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 26 Feb 2001, Andreas Dilger wrote:

> In my Turbolinux init (I haven't used Slackware for many years), there is
> an explicit mount of /proc in rc.sysinit.  Later, when it is mounting the
> rest of the filesystems, it uses "mount -a -t nonfs,proc", to avoid any
> error messages.

Oh, this is excellent, I never thought of adding proc to that mount
command, how thoughtless of me.
That ought to about fix me up then, thank you very much!
