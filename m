Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012202315.eBKNFR402237@webber.adilger.net>
Subject: Re: [linux-lvm] Debian packaging
In-Reply-To: <20001220163022.A5042@sistina.com> "from lewis@sistina.com at Dec
 20, 2000 04:30:22 pm"
Date: Wed, 20 Dec 2000 16:15:27 -0700 (MST)
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

AJ writes:
> > Update-alternatives doesn't work when the file-system in question is
> > mounted  read-only.  Also it's not really designed to be run at every boot.
> > 
> > PATH is a bad idea IMHO.  It is set in too many places and has too many 
> > possibilities to be stuffed up.
> 
> Doesn't the liblvm.so versioning in the cvs code take care of this problem?

Only if the LVM user tools are dynamically linked (old ones won't be),
and assuming that the "tools" part of the commands don't change, only
the "lib" part.  I'm not sure that the latter will be true.  Looking at
the user commands, for example the LVM_CHECK_IOP macro hard-codes the
LVM_LIB_IOP_VERSION into the "tool" part of the binary, rather than
doing the checking inside the library (which is really what should do
all the interfacing with the kernel).

Until this is fixed (it may be harder than it seems, and may make for lots
of restrictions on what can be changed in the user commands), the only
thing that the liblvm.so versioning allows is for multiple dynamically
linked user tools to be installed (iff they are in different directories).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
