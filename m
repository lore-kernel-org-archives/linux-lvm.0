Message-Id: <200003231753.SAA26762@e35.marxmeier.com>
Subject: Re: [linux-lvm] Same ole' problem as w/RaidZone (?)
Date: Thu, 23 Mar 2000 18:53:48 MEZ
In-Reply-To: <20000323114100.A15997@nccr-cle-c.nccrs.com>; from "jasonf@Cronosys.COM" at Mar 23, 100 11:41 am
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jasonf@Cronosys.COM
Cc: linux-lvm@msede.com

Hello Jason.

> Could it be that 0.8i just doesn't work right on 2.2.14?  The notes
> on the web site say that 0.8final doesn't work with 2.2.1[45], but that
> 0.8i works with 2.2.1[34], which doesn't make much sense.

I have LVM v0.8i working with kernel version 2.2.13 and 2.2.14.
No problems but then i don't use md.

> I can downgrade to 2.2.13, but I don't have much more time to play with
> this...

I don't think the kernel version makes a big difference.
Probably more interesting: Which version of md do you have?
AFAIR there was some issue with md 0.90 (the new version) and LVM v0.8i.


Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
