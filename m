Return-Path: <tandem@dnmi.no>
Subject: Re: [linux-lvm] LVM Questions
References: <20010503004851.897.qmail@web10803.mail.yahoo.com>
	<3AF0B857.74F16371@home.com>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 03 May 2001 08:56:00 +0200
In-Reply-To: Evan Day's message of "Wed, 02 May 2001 18:45:59 -0700"
Message-ID: <wv4rv26hvj.fsf@freeze.oslo.dnmi.no>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Evan" == Evan Day <banal@home.com> writes:

<snip>

    >> What ext2 resize utility is the ideal choice for LVM to
    >> use. parted seems to be quite functional, but having to down
    >> the machine to single is a but annoying. Has anyone
    >> successfully used the ext2online utility on RedHat? It seems as
    >> though the version of e2fsprogs that includes this code is part
    >> of RH 7.1 anyways. At least from what I can tell. The online
    >> resizing would definitely be required for a highly available
    >> system as well.

    Evan> I don't have much experience with ext2 resizing, but the

I haven't either.

    Evan> reiserfs can easily be extended.  I'm not sure if it is
    Evan> supported or not, but I've actually extended filesystems
    Evan> while mounted with no ill effects.

I believe it is officially supported, ie. if it breaks then its a bug,
and have done it now several times, at least on lightly loaded
filesystems. Its not quite as convienient as AIX's LVM, in that one
resizes the filesystem and the logical volume is automatically
resized, but if I'm bothered I'll write a wrapper script around
lvextend/lvreduce for that.

A question for the developers if they notice. Why lvextend and
lvreduce, as they do the same things. Is it just for clarity ? A
lvresize with + or - or a fixed size to could the same ?

<snip>

    >> I also read an older thread on an X11 GUI as well as some
    >> replies to it. The GUI that comes with Veritas is completely
    >> useless and the command line tools are completely
    >> over-engineered. While it would be nice for a small company
    >> trying to save money not to call in a specialist to create
    >> VG's, it certainly wouldn't be a requirement. Get everything
    >> stable, reliable and consistent than someone will probably have
    >> the time to create the GUI. I'd dedicate time to that type of
    >> project, but why bother when the code isn't quite there
    >> yet. There's no reason.

    Evan> LVM is so simple that, IMHO, a GUI shouldn't be an
    Evan> overriding concern.  Then again, I've been working with LVM
    Evan> on HP-UX for many years, and I find the CLI utilities to be
    Evan> much more efficient than waiting for SAM (the HP-UX sysadmin
    Evan> GUI) to poll everything, build displays, etc.  The current
    Evan> CLI tools are lean and aligned with the LVM model in a way
    Evan> that is both logical and easy to understand.

On the web page there is a BETA lva, written in perl-tk which works
nicely although somewhat limited currently. I like the pie chart look,
not for me personally, CLI type myself, but for some of the others at
work who must have a GUI for everything, yukk :-)

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
