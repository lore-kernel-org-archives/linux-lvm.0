From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] invalidate: busy buffer message on boot w/ 2.4.13
Message-ID: <20011026234159.B23590@turbolinux.com>
References: <20011026161351.A24285@transvirtual.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011026161351.A24285@transvirtual.com>
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
Date: Sat Oct 27 00:41:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Oct 26, 2001  16:13 -0700, Mark wrote:
 [re: invalidate busy buffer]
> built and installed a 2.4.13 kernel and optioned on LVM support
> and i get this message about ten times when I boot

That's because LVM is overzealous about running invalidate_buffers() when
running vgscan (it shouldn't do that).  It was never able to invalidate
busy buffers, but now there is a warning when it tries to do so.  I would
submit a patch to remove the invalidate_buffers() call from PV_FLUSH, but
since the -ac kernel still has block devices in buffer cache, there is
the _possibility_ of a disconnect between user space and kernel space
w.r.t. snapshot data (which is written from kernel space).

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
