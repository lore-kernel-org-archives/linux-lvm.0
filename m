Message-ID: <38C3C814.DC21309@netconnect.com.au>
Date: Mon, 06 Mar 2000 15:00:36 +0000
From: bug1 <bug1@netconnect.com.au>
MIME-Version: 1.0
Subject: [linux-lvm] compiling lvm into 2.3.49 Q.
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Im new to lvm, im trying to use lvm 0.8 final and 2.3.49
My understanding is that the lvm patches are included in the default
kernel now.
So im trying to compile my kernel with lvm support or check if it gets
compiled in by default.

In make menuconfig i see no reference to LVM, the docs mention it should
be under block devices, i cant see it there.

I look around the source and there is lvm code around.... dont know how
to select it in the kernel config.


I continue onto user level... i download 0.8 final, change the path in
make.tmpl change to support 2 processors, make fails at e2fsadm and
lvmchange

I even tried aplying that patch-lvm_0.8final, didnt want to apply
though.

Im using debian if that makes any difference.

I hope someone can put me on the right track, my guess is at this stage
that its a bit early to be using 2.3.49 seems its only a few days
old.... maybe some patches will apear in the not too distant future. Of
course i could be doing something fundamentally wrong from the start.


Thanks

Glenn McGrath
