Date: Thu, 30 Dec 1999 14:01:05 -0500 (EST)
From: Shane Shrybman <shane@zeke.yi.org>
Subject: Re: [linux-lvm] LVM 0.8i non-SMP compile fails 2.3.3[345]
In-Reply-To: <386BA5F5.7337B5C5@msede.com>
Message-ID: <Pine.LNX.3.96.991230135016.12779E-100000@zeke.goatskin.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Marxmeier <mike@msede.com>
Cc: linux-lvm mailing list <linux-lvm@msede.com>


On Thu, 30 Dec 1999, Michael Marxmeier wrote:

> In include/linux/lvm.h please change the
> #include <asm/spinlock.h>
> against
> #include <linux/spinlock.h>
> 
> 
> This should fix the problem
> Michael

Thanks Michael, I thought it had to be something simple. So simple that  
everyone else was able to fix it easily without resorting to nagging the
kind folks on this list.

I wish everyone an exceptionally HAPPY NEW YEAR!!

Shane 
