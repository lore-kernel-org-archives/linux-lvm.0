Message-Id: <199910051955.VAA28109@e35.msede.com>
Subject: Re: [linux-lvm] Some trouble.
Date: Tue, 5 Oct 99 21:55:36 MESZ
In-Reply-To: <199910051207.OAA16147@seger.axis.se>; from "Lars Segerlund" at Oct 05, 99 2:07 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lars.segerlund@axis.com
Cc: linux-lvm@msede.com

Lars Segerlund wrote:
>  I'm getting some kernel panics running vgcreate, pvscan, vgscan on a 
>  raid5 partition on a Compaq-DS10 , it sais free list corrupted ??
[snip] 
>  I could do a pvcreate -v /dev/md0 ( after dd </dev/zero >/dev/md0 bs=512
>  count= 1024 ), but a vgscan failed ( kernel panic, free list corrupted. )
>  and so did a vgcreate.

This looks like a known problem with the old md code once reported
by Steve Brueggeman:

> I've also had a problem when vgscan ran, because of a bug in the md driver.
> I run RedHat 5.2, and the default installation created /dev/md0 through
> /dev/md15, but the default md driver is compiled to handle only 4 md
> devices (#define MAX_MD_DEV  4), and because of a bug in the md_open()
> (uses [minor] without checking minor is less than MAX_MD_DEV), my kernel
> would crash when vgscan tried to check /dev/md6 or so.  I just rm'd
> /dev/md[4-9] /dev/md1[0-5] to not cause the problem.

Please refer to: http://linux.msede.com/lvm/mlist/archive/0059.html

As suggested, please try to remove /dev/md[4-9] and /dev/md1[0-5]
and try if vgscan still results in a panic.


Hope this helps
Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
