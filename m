Message-Id: <199911221943.UAA24841@e35.marxmeier.com>
Subject: Re: [linux-lvm] Q: active/inactive/imported/exported group ?
Date: Mon, 22 Nov 99 20:43:18 MEZ
In-Reply-To: <38398B9C.85D2E779@mchp.siemens.de>; from "Gerhard Fuernkranz" at Nov 22, 99 7:29 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gerhard.fuernkranz@mchp.siemens.de
Cc: mauelsha@u9etz.ez-darmstadt.telekom.de, mge@u9etz.ez-darmstadt.telekom.de, linux-lvm@msede.com

gerhard.fuernkranz@mchp.siemens.de wrote:

> So I think there's also the reqirement for a "sticky"
> minor device number for volumes (or at least for a specific
> subset of volumes). VxVM also has recognized this and
> provides a method to assign minor device numbers to volumes.

Your aproach with "sticky minors" might be a good idea until
we finally get additional options due to bigger major/minors.

> Do you have an idea, how I could integrate such a
> feature into LVM? My 1st idea was the following:
> 
> - I have a table e.g. /etc/lvm_minors, which contains
>   {volume_name, minor_number} pairs for all sticky
>   volumes
> 
> - Change vgscan to do the following:
>      ...

This should be rather easy as it's almost all done in userspace.
Most functionality is in the liblvm which probably can be extended
without interfering with the kernel proper.

> > I want to achive this by keeping a UUID of the VG owning sytem in the VGDA.
> 
> The question is: What is the "owning" system?
> Is it the system which has imported the group?
> Or the system which has activated the group at last?

IMO this is close. If you imported the VG or activated it recently,
another system trying to access the VG better get's in contact with you.
The UUID could serve for two purposes: Avoid the possible issues which
could be caused by different SCSI configurations and it could also serve
as a lock (more of a hint).

The VG could be marked as shared (accessible from different systems)
and LVM might call some external utility to let it resolve the
situation. If a HA framework exists, LVM could make use of it or the
admin could implement a simple rule in a shell script.


Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
