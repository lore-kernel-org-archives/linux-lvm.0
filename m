Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i237u3815790
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 02:56:03 -0500
Received: from mail.goldenhope.com.cn ([220.249.10.10])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i237u1b22956
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 02:56:02 -0500
From: =?gb2312?B?zuLMzg==?= <wutao@mail.goldenhope.com.cn>
Message-ID: <20040303075221.GA15698@lepton.goldenhope.com.cn>
References: <20040302153451.GA13034@lepton.goldenhope.com.cn>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040302153451.GA13034@lepton.goldenhope.com.cn>
Subject: [linux-lvm] Re: Why can't I extend a LV after many times extends?
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar  3 09:50:05 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: submit@bugs.debian.org

Package: lvm2
Version: 2.00.08-4

Ok , now I found the problem.

There is a limit in code of lvm2 tools.
Author has seen it as a problem... but no one has fixed it yet.


In lib/format_text/format-text.c ...

around line 309

  /* FIXME Essential fix! Make dynamic (realloc? pool?) */
  char buf[65536];
  int found = 0;

The buf size of 65536 is too small for me...

I change it to 655360 then everyting is ok.

The following is my quick patch, it can make things a little better.


diff -urN lvm2-2.00.08/lib/format_text/format-text.c
lvm2-2.00.08-new/lib/format_text/format-text.c
--- lvm2-2.00.08/lib/format_text/format-text.c  2004-03-03
15:29:47.190121864 +0800
+++ lvm2-2.00.08-new/lib/format_text/format-text.c      2004-03-03
15:15:18.720149368 +0800
@@ -306,7 +306,7 @@
        uint32_t new_wrap = 0, old_wrap = 0;

        /* FIXME Essential fix! Make dynamic (realloc? pool?) */
-       char buf[65536];
+       char buf[655360];
        int found = 0;

        /* Ignore any mda on a PV outside the VG. vgsplit relies on this */

On Tue, Mar 02, 2004 at 11:34:51PM +0800, lepton wrote:
> LVM version:     2.00.08 (2003-11-14)
> Library version: 1.00.07-ioctl (2003-11-21)
> Driver version:  4.0.0
> 
> I am using linux kernel 2.6.3
> 
> For making my data can balance on all of my three scsi disk, I use such
> methods to create my LV:
>   lvcreate -l 32 -n test vg /dev/sda1
>   lvextend -l +32 /dev/vg/test /dev/sdb1
>   lvextend -l +32 /dev/vg/test /dev/sdc1
>   lvextend -l +32 /dev/vg/test /dev/sda1
>   ......
> 
>   (I use a shell script to do these)
> 
> But When I extend a Logic Volumn to 26.5G, it saids:
> ....
>   Logical volume boards successfully resized
>   Extending logical volume boards to 26.75 GB
>   VG amd64 metadata writing failed
>   Extending logical volume boards to 26.75 GB
> 
>   (lvextend using sdb1 and sdc1 will fail, but lvextend using sda1 will
>   sucess)
> 
> It is strange I have three scsi disk which are the same.
> 
> vgdisplay   
>   --- Volume group ---
>   VG Name               amd64
>   System ID             
>   Format                lvm2
>   Metadata Areas        3
>   Metadata Sequence No  1585
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                255
>   Cur LV                8
>   Open LV               0
>   Max PV                255
>   Cur PV                3
>   Act PV                3
>   VG Size               102.54 GB
>   PE Size               4.00 MB
>   Total PE              26250
>   Alloc PE / Size       20032 / 78.25 GB
>   Free  PE / Size       6218 / 24.29 GB
>   VG UUID               RSR1JG-3vRE-4esH-m8dI-rY4B-WG0p-XweADh
> 
> pvdisplay /dev/sda1
>   --- Physical volume ---
>   PV Name               /dev/sda1
>   VG Name               amd64
>   PV Size               34.18 GB / not usable 0   
>   Allocatable           yes 
>   PE Size (KByte)       4096
>   Total PE              8750
>   Free PE               2286
>   Allocated PE          6464
>   PV UUID               YAKwOe-oJlA-CbzF-5IwO-ReqH-JZiw-LdhtT7
>    
> pvdisplay /dev/sdb1 
>   --- Physical volume ---
>   PV Name               /dev/sdb1
>   VG Name               amd64
>   PV Size               34.18 GB / not usable 0   
>   Allocatable           yes 
>   PE Size (KByte)       4096
>   Total PE              8750
>   Free PE               1966
>   Allocated PE          6784
>   PV UUID               FkVeuL-7JAW-UurK-GFcZ-e642-inMT-5MYYMq
> 
>  pvdisplay /dev/sdc1
>   --- Physical volume ---
>   PV Name               /dev/sdc1
>   VG Name               amd64
>   PV Size               34.18 GB / not usable 0   
>   Allocatable           yes 
>   PE Size (KByte)       4096
>   Total PE              8750
>   Free PE               1966
>   Allocated PE          6784
>   PV UUID               sRSor7-r4KP-1PNr-nESn-sZPS-aKMx-7s3CU
> 
