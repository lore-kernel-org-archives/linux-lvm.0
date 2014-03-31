Message-ID: <533976F8.7020306@redhat.com>
Date: Mon, 31 Mar 2014 16:08:56 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <53396B56.3050602@mglug.de>
In-Reply-To: <53396B56.3050602@mglug.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] compile error: 'DMEVENTD_PATH' undeclared
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
To: rath@mglug.de
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 03/31/2014 03:19 PM, Oliver Rath wrote:
> Hi list,
> 
> if i compile lvm2 (from today) with this configure:
> 
> 
> ./configure --with-thin=internal --with-cache=internal
> --with-replicators=internal --enable-udev_sync --enable-udev_rules
> 
> 
> then the following occures:
> .
> .
> .
> make -C lib
> make[1]: Entering directory `/root/lvm2/lib'
> gcc -c -I. -I../include -DHAVE_CONFIG_H -DDM_IOCTLS -Wall -Wundef
> -Wshadow -Wcast-align -Wwrite-strings -Wmissing-prototypes
> -Wmissing-declarations -Wnested-externs -Winline -Wmissing-noreturn
> -Wformat-security -Wredundant-decls -Wpointer-arith -Wuninitialized
> -Wmissing-include-dirs -Wfloat-equal -Wstrict-prototypes
> -Wold-style-definition -Wmissing-format-attribute -Wjump-misses-init
> -Wclobbered -Wempty-body -Wignored-qualifiers -Wmissing-parameter-type
> -Wold-style-declaration -Woverride-init -Wtype-limits -Wsync-nand
> -Wlogical-op  -fPIC  -O2    config/config.c -o config/config.o
> In file included from config/config.c:70:0:
> config/config_settings.h:257:1: error: 'DMEVENTD_PATH' undeclared here
> (not in a function)
> make[1]: *** [config/config.o] Error 1
> make[1]: Leaving directory `/root/lvm2/lib'
> make: *** [lib] Error 2
> .
> .
> 
> 
> if i take
> ./configure --with-thin=internal --with-cache=internal
> --with-replicators=internal --enable-udev_sync --enable-udev_rules
> --enable-cmdlib --enable-dmeventd
> 
> 
> all compiles fine. But I dont know, what dmevetd-flag is good for. Do i
> run into problems on a Ubuntu 12.04, if i enable additionally
> --enable-cmdlib --enable-dmeventd
>   before installing?
> 
> Tfh!

The dmeventd is a device monitoring daemon that monitors mirror, raid,
snapshot and thin pool devices and acts on mirror legs being gone,
snapshots/pool devices filling up etc... Normally, you should always
use dmeventd if you're also using these kinds of volumes as it provides
automatic predefined actions.

The problem is in --disable-dmeventd that causes the DMEVENTD_PATH to
be undefined here. It should be fixed now:

https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=68bb639a08330c7f06558e51ecab48d6a4ca2854

Thanks for the report!

-- 
Peter
