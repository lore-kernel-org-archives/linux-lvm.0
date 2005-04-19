Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3JCN9P05969
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2005 08:23:09 -0400
Received: from mail2.it.atosorigin.com ([151.12.57.13])
	by mx2.redhat.com (8.12.11/8.12.11) with ESMTP id j3JCm6En032711
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2005 08:48:06 -0400
From: Rao Davide <davide.rao@atosorigin.com>
Message-ID: <4264F027.7040306@atosorigin.com>
Date: Tue, 19 Apr 2005 13:48:55 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] FWD: Re: Linux Alpha port: LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: linux-lvm@redhat.com

>>Is LVM working on the alpha port 2.6 kernel series ?
>  
> works fine for me.

Are you using a redhat based distro (like suse, mandrake, alpha core or
indeed redhat )?
Are you using stock kernel, libraries and tools or did you haveto build
them yourself ?
Debian comes with LVM1 tools that do not work with 2.6 kernels so I need
to compile them myself or install some ready build binary package for
alpha processor and compatible with the libraries that come with debian3.
What alpha architecture are you running on ?


>>If so where do I get libdevmapper so that I can build the userspace LVM 
>>utils ?
>>
>>I tryied downloading 
>>ftp://sources.redhat.com/pub/dm/multipath-toolsmultipath-tools-0.4.3.tar.bz2
> 
> what do you think the 'dm' in that url stands for, hm?
> 
> 
>>But I fail to compile it so I'm also unable tu build the userspace lvm 
>>utils.
> 
> 
> 'userspace lvm utils' can be found here:
> 
> ftp://sources.redhat.com/pub/lvm2
> 
> multipath tools might be something different ... :)

It may also have something more but it has libdevmapper in it ...
In any case I also tried downloading and compiling
device-mapper.1.00.07.tgz from the link in the LVM2.
It builds and installe fine but I still get compilation errore when I
build LVM2.
Configute is fine, here are a few lines concerning libdevmapper

checking libdevmapper.h usability... yes
checking libdevmapper.h presence... yes
checking for libdevmapper.h... yes

but when I try to compile:

gcc -c -I. -I../include -DLVM1_INTERNAL -DPOOL_INTERNAL
-DCLUSTER_LOCKING_INTERNAL -DSNAPSHOT_INTERNAL -DMIRRORED_INTERNAL
-DDEVMAPPER_SUPPORT -DO_DIRECT_SUPPORT -DHAVE_LIBDL -DHAVE_GETOPTLONG
-fPIC -Wall -Wundef -Wshadow -Wcast-align -Wwrite-strings
-Wmissing-prototypes -Wmissing-declarations -Wnested-externs -Winline
-O2 cache/lvmcache.c -o cache/lvmcache.o
activate/activate.c: In function `target_present':
activate/activate.c:303: error: `DM_DEVICE_LIST_VERSIONS' undeclared
(first use in this function)
activate/activate.c:303: error: (Each undeclared identifier is reported
only once
activate/activate.c:303: error: for each function it appears in.)
activate/activate.c:314: warning: implicit declaration of function
`dm_task_get_versions'
activate/activate.c:314: warning: nested extern declaration of
`dm_task_get_versions'
activate/activate.c:314: warning: assignment makes pointer from integer
without a cast
activate/activate.c:319: error: dereferencing pointer to incomplete type
...
same message repeated many times
...
make[1]: *** [activate/activate.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/usr/src/LVM2.2.01.09/lib'
make: *** [lib] Error 2

I'm using kernel 2.6.11.7 downloaded from kernel.org.
Here's the relevent section for raid/lvm in config:
# Multi-device support (RAID and LVM)
#
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_LINEAR=y
CONFIG_MD_RAID0=y
CONFIG_MD_RAID1=y
# CONFIG_MD_RAID10 is not set
CONFIG_MD_RAID5=y
# CONFIG_MD_RAID6 is not set
CONFIG_MD_MULTIPATH=y
CONFIG_MD_FAULTY=y
CONFIG_BLK_DEV_DM=y
# CONFIG_DM_CRYPT is not set
# CONFIG_DM_SNAPSHOT is not set
# CONFIG_DM_MIRROR is not set
# CONFIG_DM_ZERO is not set

Do I need to patch kernel ?

> 
> 
>>--
>>Regards
>>Davide Rao
>>  Client/server Unix
>>  Atos Origin
>>  Via C.Viola - Pont St. Martin (AO) Italy
>>  Cell :  +39 3357599151
>>  Tel  :  +39 125810433
>>  Email:  davide.rao@atosorigin.com
> 
> 
> 
> 73 Thorsten
> 

-- 
--
Saluti
Davide Rao
   Client/server Unix
   Atos Origin
   Via C.Viola - Pont St. Martin (AO) Italy
   Cell :  +39 3357599151
   Tel  :  +39 125810433
   Email:  davide.rao@atosorigin.com
