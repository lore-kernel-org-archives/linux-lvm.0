From: Tim <tim@connectlive.com>
Subject: Re: re[2]: [linux-lvm] System Suggestions
Message-Id: <20020306180032.B12548@connectlive.com>
References: <20020306210600.JKKL21197.imf11bis.bellsouth.net@taz>
    <1015450169.3240.80.camel@Steven>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1015450169.3240.80.camel@Steven>; from critch@dtsam.com on
    Wed, Mar 06, 2002 at 03:29:28PM -0600
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
Date: Wed Mar  6 17:00:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Whatever other people may say about RedHat, I have found that (with rare
and well-documented exceptions) their kernels (as kernel-2.x.x-source
and kernel-2.x.x-headers RPMs) accept patches fairly well (if not, I'm
comfortable doing it manually) and have been reliable in some extremely
high-load environments, when properly customized.  RH is most definitely
not perfect, but 7.2 is IMHO a perfectly serviceable starting point for
large systems.  I have used Debian, LinuxPPC, Solaris, AIX, FreeBSD,
etc. in the past and they all have their ups and downs, but my *nix
systems are either OpenBSD or RedHat these days, and the reason is
simply that I can get better support for them than anything else.

LVM on RH7.2 has worked well for me, but as I previously mentioned, the
support for LSI Logic boards is quite solid, and using hardware
enclosures eliminates an enormous number of potential problems.


> Although my first thought is to write RH and remind them how much we
> hate it when they build things in a non standard way and therefore cause
> other standard systems to break. I have several peices of hardware that
> are only supported with a RH kernel. I may be braver than some in the
> fact that I have removed the RH kernel and used in to build other
> distros with it. RH should provide a source version of the kernel in
> which you can attempt to put XFS into, then compile, and should still be
> able to load the promise driver into that new kernel. It will take some
> effort, but should be usable. Of course you could return it as
> essentially broken and buy the 3ware card that has better support.

-- 
     "To be suspended from the legal profession is the moral equivalent of 
      being ostracized by child molesters."
                                                           --Ian Rowan
