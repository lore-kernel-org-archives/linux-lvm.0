Subject: Re: [linux-lvm] Tools compile problem, 1.0.1-rc4 on RH6.2 w/kernel 2.4.12
References: <m3d73rino6.fsf@tigger.plaindog.no>
	<20011015105230.C609@tykepenguin.com>
From: Morten Wang <warnckew@online.no>
Date: 15 Oct 2001 13:07:23 +0200
In-Reply-To: <20011015105230.C609@tykepenguin.com>
Message-ID: <m3lmid9n6c.fsf@tigger.plaindog.no>
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

* Patrick Caulfield
> See what /usr/include looks like, it may be a symlink to somewhere else or it
> may contain symlinks to other files that cannot be resolved.

I _did_ check the two usual symlinks in /usr/include, 'linux' & 'asm',
which point to directories in the kernel-source tree.  they were ok.
what I forgot to check was whether /usr/include/malloc.h actually was
readable, and then I found out.  it wasn't possible to read the file
and it had incorrect values in a directory listing.  did check around
a bit for various clues, but couldn't find any, so I assume it's just
a filesystem error after a few unwanted shutdowns.  a reinstall of the
glibc-devel RPM fixed the problem, and the tools compiled successfully.

'make install' then ran successfully, and I could run vgcan and
vgchange without any problems.  am looking forward to checking out
LVM, thanks!


Morten!

-- 
"...a liquid which was almost, but not quite, entirely unlike tea."
  My opinions are not necessarily those of my provider,
  not necessarily mine, and probably not necessary.
