Message-Id: <200003200920.KAA03049@e35.marxmeier.com>
Subject: Re: [linux-lvm] tools make error?
Date: Mon, 20 Mar 2000 10:20:22 MEZ
In-Reply-To: <Pine.OSF.4.02.10003200248050.463935-100000@ocean.tamu.edu>; from "Michael Bartosh" at Mar 20, 100 2:49 am
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bartosh@ocean.tamu.edu
Cc: linux-lvm@msede.com

> I have 0.8final compiled (w/ patch) into kernel, but am getting the
> following when I try to make the new tools. What's up?

Known problem.

You need to apply patch
patch-lvm_0.8final-2    - patch against LVM 0.8final user mode tools

For more inormation please refer to
ftp://linux.msede.com/lvm/v0.8final/BUGS


Hope this helps
Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
