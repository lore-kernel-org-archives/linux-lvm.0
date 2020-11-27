Message-Id: <199905171139.NAA28782@e35.msede.com>
Subject: Re: [linux-lvm] Volume Group Creation
Date: Mon, 17 May 99 13:39:30 MESZ
In-Reply-To: <s73c32dd.084@mossergrp.com>; from "SHAD GUNDERSON" at May 14, 99 2:27 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SHAD GUNDERSON <sgunderson@mossergrp.com>
Cc: linux-lvm@msede.com

> 
> I have successfully patched and compiled the lvm code and kernel....
> and I am able to create the physical volumes using
> "pvcreate /dev/sdb[12]". However, the next step in the documention
> is where I run into problems... upon execution of the
> "vgcreate test_vg /dev/sdb[12]" I receive an error that no physical
> volumes exist.  Am I missing something. I have changed the system ids
> on the partitions. I am running kernel 2.2.8 with lvm 0.6 and the
> devfs patch for May 3rd. 

Hello Shad.

Strange, this should work.
Could you try to run vgcreate with the -d option and send me the
output? This should provide additional information what is happening.

The only problem that i could imagine off my head is that the
/etc/lvmtab is not up-to-date (this happened once to me a few
revisions ago). Please run vgscan and try the vgcreate again.


Hope that helps
Michael

--
Michael Marxmeier           Marxmeier Software GmbH
E-Mail: mike@msede.com      Besenbruckstrasse 9
Voice : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
