Date: Sun, 27 Aug 2000 23:41:38 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] LVM & NFS
In-Reply-To: <Pine.SOL.4.21.0008262033450.13945-100000@flora01.SLAC.Stanford.EDU>
Message-ID: <Pine.LNX.4.21.0008272339540.6063-100000@fogarty.jakma.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cristina Bulfon <bulfon@SLAC.Stanford.EDU>
Cc: linux-lvm@msede.com, Shahram Rahatlou <rahatlou@SLAC.Stanford.EDU>

On Sat, 26 Aug 2000, Cristina Bulfon wrote:

> Any idea ? Is there any special configuration/setting to export LVM
> volumes via NFS?
> 

AFAIK absolutely none. NFS doesn't care whether the volume is sitting
on LVM, SCSI or whatever type of device.

so your problem is purely nfs config related. re-check hosts.allow,
your exports file, etc..

regards,
-- 
Paul Jakma	paul@clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
"How should I know if it works?  That's what beta testers are for.  I only
coded it."
(Attributed to Linus Torvalds, somewhere in a posting)
