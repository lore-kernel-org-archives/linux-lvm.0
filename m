Message-ID: <386BA5F5.7337B5C5@msede.com>
Date: Thu, 30 Dec 1999 19:35:33 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM 0.8i non-SMP compile fails 2.3.3[345]
References: <Pine.LNX.3.96.991230110031.12779A-200000@zeke.goatskin.org>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Shane Shrybman <shane@zeke.yi.org>
Cc: linux-lvm mailing list <linux-lvm@msede.com>

Hello Shane.

I have mixed news for you ... no new SMP box but instead a fix to the
compile problem.

> Compiling the latest dev kernels with LVM 0.8i fails when compiled for UP.
> The same SMP kernels compile and run ok, ( using 2.3.35 smp now).
> Unfortunately I don't have an smp box. But, I agree that the _obvious_ fix
> would be for some generous soul to send a nice smp setup! :))

In include/linux/lvm.h please change the
#include <asm/spinlock.h>
against
#include <linux/spinlock.h>


This should fix the problem
Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
