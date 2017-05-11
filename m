Date: Thu, 11 May 2017 11:03:38 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20170511100337.GA28090@localhost.localdomain>
References: <23c510c6-8a15-7f7c-bcf5-1f72b5dca994@mglug.de>
	<6bf9d190-c009-344f-e4cc-a5a242090274@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6bf9d190-c009-344f-e4cc-a5a242090274@redhat.com>
Subject: Re: [linux-lvm] configure fail with option --enable-notivy-dbus
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Oliver Rath <rath@mglug.de>

On Thu, May 11, 2017 at 09:43:56AM +0200, Marian Csontos wrote:
> On 05/11/2017 09:01 AM, Oliver Rath wrote:
> > Hi list,
> > 
> > configuring lvm2 failed with --enable-notify-dbus option, but
> > unfortunatly without no konkrete error-message:
> > 
> > $ ./configure --enable-lvmetad --enable-lvmpolld --enable-udev_sync
> > --enable-udev_rules --enable-applib --enable-cmdlib
> > --enable-dbus-service --enable-dmfilemapd --enable-python3_bindings
> > --enable-notify-dbus
> > 
> > [..]
> > checking whether to install fsadm... yes
> > checking whether to install blkdeactivate... yes
> > checking whether to use dmeventd...
> > checking for getline in -lc... no
> > checking for canonicalize_file_name in -lc... no
> > checking for dlopen in -ldl... no
> > checking for log10 in -lm... no
> > configure: error: bailing out
> 
> ################################################################################
> AC_CHECK_LIB(m, log10,
>         [M_LIBS="-lm"], hard_bailout)
> 
> 
> 
> 
> This is because of missing log10 function from m library (wherever that
> comes from) and has nothing to do with dbus. So enabling or disabling it
> should have absolutely no effect.

Similarly canonicalize_file_name, dlopen, and getline - the first is a
GNUism, and we really should have a fallback if it is not found (there
is a usable gnulib version), but dlopen and getline?

Those are both standard calls now - dlopen is part of POSIX.1-2001 and
getline was added in POSIX.1-2008.

Are you compiling with an old or non-GNU libc?

Regards,
Bryn.
