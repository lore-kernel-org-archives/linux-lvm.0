Return-Path: <timshel@pobox.com>
Date: Sat, 9 Jun 2001 10:48:22 +1000
From: Timshel Knoll <timshel@pobox.com>
Message-ID: <20010609104822.B29022@knoll.ln>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010609004002.B3656@knoll.ln>
Subject: [linux-lvm] Re: pvmove failure ...
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

[please CC all replies to me, I don't read mail from this list]

> The ENXIO error is returned if the vg you are trying to move does not
> exist (at least that's what it looks like).  This is returned from
> within the kernel when vg_ptr = NULL inside lvm_do_pe_lock_unlock().
>
> It would _appear_ that /dev/vg0/group is pointing to a bogus device.
> In lvm_chr_open() you are allowed to open non-existent devices (so
> that you can create new devices if desired).
>
>When was the last time you ran vgscan and/or rebooted?  Did you do anything
>strange in the meantime?

I had just rebooted before I ran pvmove. The vg0 vg is definately a
valid vg ... I think I ran vgscan during the process of trying to get it
all to work, and nothing strange came up ...

I'll be away for the next couple of days, so I won't be recieving email
during that time ...

Thanks,

Timshel

-- 
   Timshel Knoll <timshel@pobox.com>  for Debian email: <timshel@debian.org>
                Geomatics/Computer Science double degree, RMIT
      Debian GNU/Linux developer, see http://people.debian.org/~timshel/
                For GnuPG public key: finger timshel@debian.org
