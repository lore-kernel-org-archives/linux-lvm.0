Message-ID: <38B6446E.EF00892A@msede.com>
Date: Fri, 25 Feb 2000 09:59:26 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: [linux-lvm] Bug in modules (fwd)
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message ...

-------- Original Message --------
Date: Thu, 24 Feb 2000 20:17:02 -0500
From: Wakko Warner <wakko@animx.eu.org>
Subject: Bug in modules

I have a machine that boots from scsi and I have IDE compiled as
modules.

The use count for the IDE modules are always 0 even when writing to
the
ide drives.  I consider this a major bug if someone uses rmmod -a
every so
often.

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
