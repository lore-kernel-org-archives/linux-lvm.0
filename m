Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5L80k007241
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 04:00:46 -0400
Received: from fmx7.freemail.hu (fmx7.freemail.hu [195.228.242.227])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i5L80je1026032
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 04:00:45 -0400
Date: Mon, 21 Jun 2004 10:00:05 +0200 (CEST)
From: Moha Snipa1 <snipa1@freemail.hu>
Message-ID: <freemail.20040521100005.60543@fm7.freemail.hu>
MIME-Version: 1.0
Subject: [linux-lvm] lvm2 install problem
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

hello,

i have a problem when I try to install the LVM2!
well, I use a 2.6.7 kernel with device mapper support...
I have installed device-mapper.1.00.07 and now i try to install LVM2.2.
00.16 but I get this error message!


gcc -c -I. -I../include -DLVM1_INTERNAL -DSNAPSHOT_INTERNAL 
-DMIRRORED_INTERNAL -DDEVMAPPER_SUPPORT -DO_DIRECT_SUPPORT 
-DHAVE_LIBDL -DHAVE_GETOPTLONG -fPIC -Wall -Wundef -Wshadow 
-Wcast-align -Wwrite-strings -Wmissing-prototypes 
-Wmissing-declarations -Wnested-externs -Winline -O2 cache/lvmcache.
c -o cache/lvmcache.o
activate/activate.c: In function `target_present':
activate/activate.c:302: `DM_DEVICE_LIST_VERSIONS' undeclared (first 
use in this function)
activate/activate.c:302: (Each undeclared identifier is reported only once
activate/activate.c:302: for each function it appears in.)
activate/activate.c:313: warning: implicit declaration of function 
`dm_task_get_versions'
activate/activate.c:313: warning: assignment makes pointer from 
integer without a cast
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:318: dereferencing pointer to incomplete type
activate/activate.c:323: dereferencing pointer to incomplete type
make[1]: *** [activate/activate.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/usr/local/src/LVM2.2.00.16/lib'
make: *** [lib] Error 2


what's the problem? can anyone help me?

Snipa
