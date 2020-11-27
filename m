Message-Id: <199906301634.SAA06762@e35.msede.com>
Subject: Re: [linux-lvm] vgscan -- invalid i/o protocol version
Date: Wed, 30 Jun 99 18:34:30 MESZ
In-Reply-To: <Pine.LNX.4.10.9906301639130.2611-100000@fuse.aethos.co.uk>; from "James Pattinson" at Jun 30, 99 4:42 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Pattinson <jamesp@aethos.co.uk>
Cc: linux-lvm@msede.com

> so i ran vgscan and got the message in the subject line. It's possible I'm
> being really thick and I don't really know what I'm doing. Do I need the
> devfs patches too?

AFAIR this error message has appeared previously when the /dev/lvm
device file was missing.

$ ls -l /dev/lvm
crw-r-----   1 root     root     109,   0 Mar 31 05:13 /dev/lvm

If it's not created, try a mknod /dev/lvm c 109 0

> I'm new to lvm-on-linux but I love it on HP-UX.

You're welcome.


Hope this helps
Michael

--
Michael Marxmeier           Marxmeier Software GmbH
E-Mail: mike@msede.com      Besenbruckstrasse 9
Voice : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
