Return-Path: <banal@home.com>
Message-ID: <3AF0B857.74F16371@home.com>
Date: Wed, 02 May 2001 18:45:59 -0700
From: Evan Day <banal@home.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Questions
References: <20010503004851.897.qmail@web10803.mail.yahoo.com>
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

Darren Young wrote:
> First, does LVM do RAID or do I need to employ the md
> driver to accomplish this? It seems to me (as a
> sysadmin) that LVM is great for adding space when
> needed, but having RAID capabilities in conjunction
> with this would be required to produce a highly
> available system.

LVM doesn't do RAID right now - you can use either a hardware
RAID or the kernel's built-in RAID support (raid 0, 1, and 5).

> What ext2 resize utility is the ideal choice for LVM
> to use. parted seems to be quite functional, but
> having to down the machine to single is a but
> annoying. Has anyone successfully used the ext2online
> utility on RedHat? It seems as though the version of
> e2fsprogs that includes this code is part of RH 7.1
> anyways. At least from what I can tell. The online
> resizing would definitely be required for a highly
> available system as well.

I don't have much experience with ext2 resizing, but the
reiserfs can easily be extended.  I'm not sure if it is
supported or not, but I've actually extended filesystems
while mounted with no ill effects.

Reiserfs support is built in to kernel 2.4.X.

> I started with RedHat 7.1 with the 2.4.2 kernel and
> patched it. What kernel is ideal to use with LVM? This
> one seems to work, but I read a reference in the list
> archive that certain components are in 2.4. Is this
> the case?

The 2.4.X kernel contains base LVM support, but you'll need
to supplement that with patches at the same level as the
LVM user-level tools.  Current release is 0.9.1b7.

> I also read an older thread on an X11 GUI as well as
> some replies to it. The GUI that comes with Veritas is
> completely useless and the command line tools are
> completely over-engineered. While it would be nice for
> a small company trying to save money not to call in a
> specialist to create VG's, it certainly wouldn't be a
> requirement. Get everything stable, reliable and
> consistent than someone will probably have the time to
> create the GUI. I'd dedicate time to that type of
> project, but why bother when the code isn't quite
> there yet. There's no reason.

LVM is so simple that, IMHO, a GUI shouldn't be an overriding
concern.  Then again, I've been working with LVM on HP-UX
for many years, and I find the CLI utilities to be much
more efficient than waiting for SAM (the HP-UX sysadmin
GUI) to poll everything, build displays, etc.  The current
CLI tools are lean and aligned with the LVM model in a
way that is both logical and easy to understand.
