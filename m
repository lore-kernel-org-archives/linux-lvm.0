From: benr@us.ibm.com
Message-ID: <8525690E.00728471.00@d54mta02.raleigh.ibm.com>
Date: Fri, 30 Jun 2000 15:50:47 -0500
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <jan@gondor.com>
Cc: linux-lvm@msede.com



Jan,

Welcome to the discussion!


>On Thu, Jun 29, 2000 at 06:39:51PM -0500, benr@us.ibm.com wrote:
>> If you are using ext2, then you could use e2fsadm, but if you are using
>> another filesystem, then what?  Even if you are using ext2, a user could
>> still use lvreduce directly.  Thus, this is a data security hole.
>
>We'll always have that kind of 'data security hole'. We have lvreduce, we
>have mke2fs, we even have cat /dev/zero >/dev/hda.

lvreduce doesn't need to be a data security hole.  In the LVMS, the
filesystems have direct input to the LVMS through the Filesystem Interface
Modules (FIM).  This input is gathered by the LVMS, not by the user
interface.  Thus, any user interface which issues a command to the LVMS to
resize a volume will automatically cause the affected filesystem to be
consulted.  Thus, in the LVMS, lvreduce would not be a data security hole
as the LVMS would consult with the affected filesystem.

In other words, under the LVMS, the LVMS assumes the responsibility for
consulting the affected filesystem before resizing a volume, not the user
interface.  Under the current system, the user interface is responsible for
such integration.

>
>I think admin tools should be easily usable, and that includes safety. It
>should be difficult to destroy data accidently. So, obviously, it's a bad
>thing if you have to shrink the fs size first, then shrink the volume
size,
>and if you misstype one of the sizes you lose data.

Agreed.

>
>I see two possible solutions: One is an integrated tool like e2fsadm,
>generalized to know about all possible filesystems. (If you call it to
>shrink a fs that it doesn't know about, it fails with a proper error
>message).
>
>The second is a check in lvreduce to ensure the fs on the partition fits
into
>the new volume size. The user still has to call ext2resize (or another
tool)
>first, and then lvreduce, but user faults are caught.
>
>(Of course, lvreduce will have a --i-know-this-doesnt-fit-do-it-anyway
option
>to allow the admin to shoot himself in the foot if he really wants to...)

There is a third option.  The third option is to remove the responsibility
for integration from the user interface and place it in the LVM.  This is
what the LVMS does, as the previous discussion on lvreduce showed.

Regards,

Ben
