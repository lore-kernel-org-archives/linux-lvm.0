Return-Path: <claudio@conectiva.com>
Date: Wed, 20 Dec 2000 10:04:20 -0500 (EST)
From: Claudio Matsuoka <claudio@helllabs.org>
Subject: Re: [linux-lvm] Debian packaging
In-Reply-To: <200012192251.eBJMpG601644@webber.adilger.net>
Message-ID: <Pine.LNX.4.30.0012200955540.4847-100000@pokey.distro.conectiva>
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

On Tue, 19 Dec 2000, Andreas Dilger wrote:

> No, because you can have multiple kernels installed, and the LVM IOP may
> change depending on the LVM version, even within a single kernel release
> (i.e. 2.2 or 2.4).  It would be nice (but more complex) if the LVM user
> tools could handle multiple IOP versions, but they don't.  Also, the
> update-alternatives functionality is only available on Debian, so we
> would still need another mechanism on RPM-based systems, and it may
> as well be uniform across all systems.

Ok, experimental lvm-base, lvm-iop6 and lvm-iop10 RPM packages available
at http://distro.conectiva.com.br/experimental/lvm. They certainly need
improvements, but I'm able to transparently switch back and forth between
IOP 6 and IOP 10.

To get the packages using APT, add the following lines to sources.list:

rpm http://distro.conectiva.com.br/experimental lvm/conectiva main
rpm-src http://distro.conectiva.com.br/experimental lvm/conectiva main


claudio
