Message-Id: <199902171313.OAA13340@e35.msede.com>
Subject: Re: [linux-lvm] Re: your mail
Date: Wed, 17 Feb 99 14:13:52 MEZ
In-Reply-To: <199902171307.AA03826@mailgate1b.telekom.de>; from "Heinz Mauelshagen" at Feb 17, 99 2:05 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mauelsha@ez-darmstadt.telekom.de
Cc: marka@a-wicked.demon.co.uk, linux-lvm@msede.com, mge@u9ete.ez-darmstadt.telekom.de

Heinz wrote:
> /boot must be in a regular disk partition containing basic commands,
> device specials and LVM driver/commands.
> About 20-30MB should be sufficient to set this up.

IMO this could even be less if initrd is used.
We may need about 1-2 MB per kernel image + 1-2 MB for the initial
utilities (shell, vgchange, mount).


Michael

--
Michael Marxmeier           Marxmeier Software GmbH
E-Mail: mike@msede.com      Besenbruckstrasse 9
Voice : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
