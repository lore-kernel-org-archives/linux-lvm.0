From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 4 Oct 2001 11:49:03 -0600
Subject: Re: [linux-lvm] kernel 2.2.19 support
Message-ID: <20011004114903.G31061@turbolinux.com>
References: <3BBC4146.51CD437D@promofinarsa.es> <wv669v3b96.fsf@freeze.oslo.dnmi.no> <3BBC4E6E.BCA3EE70@promofinarsa.es> <wvzo771uju.fsf@freeze.oslo.dnmi.no> <3BBC535B.59D6A5CB@promofinarsa.es> <wv3d4zh1r8.fsf@freeze.oslo.dnmi.no> <20011004111023.C31061@turbolinux.com> <wvy9mrfhmy.fsf@freeze.oslo.dnmi.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wvy9mrfhmy.fsf@freeze.oslo.dnmi.no>
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

On Oct 04, 2001  19:18 +0200, Adrian Phillips wrote:
> Yes, but what concerned me was if there was some equivalent for 2.2
> (foo.dev22 = bar). I was going to check the LVM CVS to see what
> changes had been done but was unable to login :-

It was just added recently (probably a devfs thing).  Before that, it
just ran the "lvm_fs_setup()" (or whatever) function, and didn't do
anything with the output.  Hmm, that means my suggestion may be broken.

Need something like:

#if LINUX_KERNEL_VERSION > KERNEL_VERSION (2, 3, 38)
	foo.de =
#endif
		lvm_fs_setup();

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
