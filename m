Message-ID: <36CADA1A.249433E0@softwired-inc.com>
Date: Wed, 17 Feb 1999 16:02:50 +0100
From: Thomas Haas <haas@softwired-inc.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: your mail
References: <199902171313.OAA13340@e35.msede.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi

I am using the md raid stuff
(http://www.kernel.org/pub/linux/daemons/raid/) right now. For the md
stuff both problems (booting md root device and shutdown) were solved in
one way or another. The last time I checked initrd had been used for
booting. I have not tracked how the shutdown problem has been resolved.
Some cleanup may be moved into the unmount call.


As I used AIX before I am waiting for LVM since a long time. I am glad it
is finally here. Now, only JFS must be implemented. Anyone on more details
on this (URLs)?

tnx for the great work
- tom

Michael Marxmeier wrote:

> Heinz wrote:
> > /boot must be in a regular disk partition containing basic commands,
> > device specials and LVM driver/commands.
> > About 20-30MB should be sufficient to set this up.
>
> IMO this could even be less if initrd is used.
> We may need about 1-2 MB per kernel image + 1-2 MB for the initial
> utilities (shell, vgchange, mount).
>
> Michael
>
> --
> Michael Marxmeier           Marxmeier Software GmbH
> E-Mail: mike@msede.com      Besenbruckstrasse 9
> Voice : +49 202 2431440     42285 Wuppertal, Germany
> Fax   : +49 202 2431420     http://www.msede.com/

--
* Thomas Haas                    <mailto:haas@softwired-inc.com>
* SoftWired AG                   <http://www.softwired-inc.com/>
* Technoparkstr. 1  ***  CH-8005 Zurich  ***  +41-1-4452370
