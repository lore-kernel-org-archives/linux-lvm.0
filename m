From: Tom Dawes-Gamble <tmdg@avbrief.com>
Message-Id: <200005111538.PAA11431@lindbergh.avbrief.com>
Subject: [linux-lvm] 2.2.15 Kernel LVM 0.8 vgscan -- invalid i/o protocol version
Date: Thu, 11 May 2000 15:38:56 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi,

	I'm trying to build the 2.2.15 Kernel with LVM 0.8.
I have patched the kernel with patch-2.2.13-LVM-0.8i.gz  that worked fine no
errors reported.  I made the change as outlined in Micheal's message
i.e.
>> Actually, on line 362 of lvm.c in your kernel source, block/drivers,
>> change the word "static" to "extern". The problem doesn't show up if
>> you're compiling LVM as a module.
>
> The line in question is:
> __initfunc(static int lvm_init(void))
> 
> This should be changed to:
> __initfunc(extern int lvm_init(void))

The kernel then builds fine.  With LVM compiled in rather than as a module.

I then patched LVM with patch-lvm_0.8final-2 
Uncommented MAKEFLAGS = -j2 since this is a twin CPU system

LVM built and installed without error though it did complian about 
about not using lseek64,  :-)

The partion I wanted to use with LVM has already been used with LVM 0.7 so I 
changed the partition type to 8e (was fe).

ran vgscan and got vgscan -- invalid i/o protocol version  
[root@kingair /root]# vgscan  -vd
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 5
vgscan -- invalid i/o protocol version

I check the device /dev/lvm was in place.
                           
[root@kingair /root]# ls -l /dev/lvm
crw-r-----    1 root     root     109,   0 May  6 23:00 /dev/lvm
[root@kingair /root]#             


So.  now I'm out of things to try I tought about using a 2.3.X kernel but 
I really don't want to use a beta kernel.

The distribution I'm using is RedHat 6.2 (Zoot).

So what should I try next.

Tom.

-- 
Tom Dawes-Gamble				Email: tmdg@avbrief.com
