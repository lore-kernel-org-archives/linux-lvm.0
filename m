Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012310013.eBV0DYZ20433@webber.adilger.net>
Subject: Re: [linux-lvm] Patched kernel sources
In-Reply-To: <01C0728E.93A59A00.smdenton@bellsouth.net> "from S. Michael Denton
 at Dec 30, 2000 06:30:24 pm"
Date: Sat, 30 Dec 2000 17:13:33 -0700 (MST)
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
Cc: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

Scott Denton writes:
> Does anyone have a tarball of properly-patched kernel sources for
> 2.2.1[7,8] with LVM 0.8.1, ext3fs, and ext3fs online resizing
> support?

You probably DON'T want to use the ext3 online resizing patches.  While
they work OK in theory, in fact there are some bad interactions between
the user-space tools writing to the disk and the journal causing an
OOPS because of safety checking in the ext3 code.  This really only
happens if the filesystem is being written to when you are doing the
resizing, but if it happens, your filesystem is stuck...

I need to totally re-do how the ext3 online resizing code is done,
probably in the next month or so.

I don't use the 0.8.1 patches anymore, only 0.9.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
