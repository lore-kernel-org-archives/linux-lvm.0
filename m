Message-ID: <38C3BF88.829B1FC2@msede.com>
Date: Mon, 06 Mar 2000 15:24:08 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] compiling lvm into 2.3.49 Q.
References: <38C3C814.DC21309@netconnect.com.au>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: bug1 <bug1@netconnect.com.au>
Cc: linux-lvm@msede.com

bug1 wrote:
> 
> Im new to lvm, im trying to use lvm 0.8 final and 2.3.49
> My understanding is that the lvm patches are included in the default
> kernel now.
> So im trying to compile my kernel with lvm support or check if it gets
> compiled in by default.
> 
> In make menuconfig i see no reference to LVM, the docs mention it should
> be under block devices, i cant see it there.
> ...

A few bits have been lost during the kernel merge.
Please have a look at http://linux.msede.com/lvm/doc/BUGS

In short: You need to apply a kernel patch. There is currently
no 2.3.49 patch but the 2.3.48 should work.

patch-2.3.48-lvm      - patch against kernel 2.3.48

> I even tried aplying that patch-lvm_0.8final, didnt want to apply
> though.

This is not for the kernel side. It's against the LVM tools.


Hope this helps
Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
