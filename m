Message-ID: <38A0C388.4DFF0811@msede.com>
Date: Wed, 09 Feb 2000 02:31:52 +0100
From: Michael Marxmeier <mike@msede.com>
Reply-To: jum@anubis.han.de
MIME-Version: 1.0
Subject: [linux-lvm] Re: Configuring boot partition with LVM (fwd)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message ...

-------- Original Message --------
Date: Tue, 8 Feb 2000 23:11:24 +0100
Resent-Date: Wed, 09 Feb 2000 2:27:50 MEZ
From: Jens-Uwe Mager <jum@anubis.han.de>
To: Jos Visser <josv@osp.nl>
Cc: Fabian.Herschel@suse.de, linux-lvm@msede.com
Subject: Re: [linux-lvm] Configuring boot partition with LVM
In-Reply-To: <389EF4DE.68165A11@osp.nl>; from josv@osp.nl on Mon, Feb
07, 2000 at 05:37:50PM +0100

On Mon, Feb 07, 2000 at 05:37:50PM +0100, Jos Visser wrote:
> >  Lilo
> > should also learn how to boot a kernel fom a striped volume...
>
> I don't think you fully appreciate the request you're making here.
> Commercial Unices such as HP-UX and Solaris can not boot from striped
> volumes for about the same reasons why it would be difficult to have
> LILO read from a striped volume: the implications are just too
> horrendous to comtemplate.

At least the IBM people with the AIX LVM are able to make that work.
The
only thing that they were not able for a long time is to make system
dumps work in such a configuration. But I believe that even that works
under AIX 4.3.x now.

-- 
Jens-Uwe Mager	<pgp-mailto:62CFDB25>
