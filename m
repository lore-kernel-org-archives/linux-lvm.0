Date: Thu, 27 Apr 2000 16:13:04 +0100 (IST)
From: Paul Jakma <paul.jakma@itg.ie>
Subject: Re: [linux-lvm] Protection of used scsi disks by LVM
In-Reply-To: <200004271314.PAA09502@u9etz.ez-darmstadt.telekom.de>
Message-ID: <Pine.LNX.4.21.0004271610391.1702-100000@rossi.itg.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: linux-lvm@msede.com

On Thu, 27 Apr 2000, Heinz Mauelshagen wrote:

> Because it can't.
> The only way would be to remove then underlying devices from the genhd
> in the kernel, which obviously is not a good idea(tm) ;-{)
> 

:)


> These are the UNIX/Linux semantics.
> 
> If one has the file/device special permission one can do every kind
> of stupid things which come to ones mind.

indeed. However we can try to build a measure of intelligence into the
tools. Eg Digital Unix disklabel tools will not allow you to mess with
disklabels that are under control of the LVM or AdvFs.

(course you can still do it manually.)

So who wants to hack fdisk to check for LVM? :)

> 
> Regards,
> Heinz
> 
> 

-paul jakma
