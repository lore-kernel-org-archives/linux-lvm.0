Return-Path: <ulf@twc.de>
Message-ID: <3A40711F.A084D472@twc.de>
Date: Wed, 20 Dec 2000 09:43:11 +0100
From: Ulf Bartelt <ulf@twc.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Debian packaging
References: <200012192251.eBJMpG601644@webber.adilger.net>
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

Hi!

> No, because you can have multiple kernels installed, and the LVM IOP may
> change depending on the LVM version, even within a single kernel release
> (i.e. 2.2 or 2.4).  It would be nice (but more complex) if the LVM user
> tools could handle multiple IOP versions, but they don't.  Also, the
> update-alternatives functionality is only available on Debian, so we
> would still need another mechanism on RPM-based systems, and it may
> as well be uniform across all systems.

If I had to solve this I'd try to

* give the lvm lib a name like liblvm-IOPNUMBER.so

* put all the lvm tools in a library liblvmtools-IOPNUMBER.so

* and the "real" tool binaries would only be a short program asking for
the IOPNUMBER, dynloading the the libtools-IOPNUMBER.so and passing all
args to the real tool inside that lib...

Strange idea?

Bye!
	Ulf.
