Message-ID: <3D80295A.2070307@comedia.it>
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Installing LVM on RH v7.3
References: <20020911134913.29265.h018.c000.wm@mail.joubert.com.criticalpath.net>
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
Date: Thu Sep 12 00:43:22 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

kevin@joubert.com wrote:
> I am having trouble installing LVM on RH v7.3 (2.4.18-10).

1st question is:
why are you trying to compile by hand an older version of LVM while 
rh-7.3 ships with lvm-1.0.3 (with a fixed pvmove and small binaries that 
fit on an initrd btw)?

> As I am pretty sure this has been discussed already, please excuse the question, but I can't
> figure out how to search the "linux-lvm" archives. 
> 
> Anyway, I can run "configure" okay:
> ---------------------------------------
> [root@localhost lvm]# pwd
> /usr/local/bin/lvm
> [root@localhost lvm]# /usr/src/redhat/SOURCES/LVM/1.0.1/configure
....
> In file included from /usr/src/redhat/SOURCES/LVM/1.0.1/tools/lib/liblvm.h:53,
>                  from /usr/src/redhat/SOURCES/LVM/1.0.1/tools/lib/basename.c:34:
> /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in userspace

edit the file
/usr/src/redhat/SOURCES/LVM/1.0.1/tools/lib/liblvm.h
go at line 53
remove the line
#include <linux/autoconf.h>

L.
