Return-Path: <dice@mfa.kfki.hu>
Date: Thu, 21 Dec 2000 10:43:33 +0100 (CET)
From: Gergely Tamas <dice@mfa.kfki.hu>
Subject: Re: [linux-lvm] '/etc/init.d/lvm' script in debian package
In-Reply-To: <20001221090437.D511@tykepenguin.com>
Message-ID: <Pine.LNX.4.31.0012211041260.9973-100000@falka.mfa.kfki.hu>
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
To: Patrick Caulfield <patrick@tykepenguin.com>
Cc: linux-lvm@sistina.com, Russell Coker <bofh@coker.com.au>

Hi!

> On Thu, Dec 21, 2000 at 09:37:58AM +0100, Gergely Tamas wrote:
> >
> > A few ideas ...
> > 1) if LVM is compiled into the kernel and /boot/System.map is reachable,
> > than it could be detected using e.g. 'grep lvm System.map'
> >
> > 2) if /usr/src/kernel/.config is reachable, than it could be detected
> > using e.g. 'grep -i lvm .config'
> >
> > 3) maybe doing a check for directories countaining 'group' in /dev would
> > be a usable idea...
>
> How about looking in /proc/devices for the lvm block & char devices ?

This is a good idea too.

But I noticed, that looking in /etc for lvmtab is usable too.

But your idea seems to be the most usable. It would be good to change the
init.d/lvm script to something using this.

Gergely
