Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012192251.eBJMpG601644@webber.adilger.net>
Subject: Re: [linux-lvm] Debian packaging
In-Reply-To: <XFMail.20001219212422.fionn@unix-ag.org> "from Fionn Behrens at
 Dec 19, 2000 09:24:22 pm"
Date: Tue, 19 Dec 2000 15:51:15 -0700 (MST)
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

Fionn writes:
> > Think PATH - this is really easy, and shells already support it.  No more
> > work to be done, and it's not ugly.  The IOP version will probably never
> > change within a boot (unless LVM is a module and it gets upgraded without
> > upgrading the kernel - unlikely).
> 
> Shouldnt the debian alternatives mechanism (see "man 8 update-alternatives")
> be most appropriate for this task?

No, because you can have multiple kernels installed, and the LVM IOP may
change depending on the LVM version, even within a single kernel release
(i.e. 2.2 or 2.4).  It would be nice (but more complex) if the LVM user
tools could handle multiple IOP versions, but they don't.  Also, the
update-alternatives functionality is only available on Debian, so we
would still need another mechanism on RPM-based systems, and it may
as well be uniform across all systems.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
