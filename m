Message-ID: <52D8FD9B.5060701@redhat.com>
Date: Fri, 17 Jan 2014 10:53:31 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <87zjmxzmga.fsf@red.mvo.lan> <52D6B4AF.9010007@mglug.de>
	<CADxRZqwmcmqjM6qV184HtD5-X4WRxExhchAo7twWHEt7_Vuf4w@mail.gmail.com>
	<084301cf125a$d4b4a980$7e1dfc80$@acm.org>
	<52D7714F.3080105@redhat.com>
	<093401cf12fe$59e75640$0db602c0$@acm.org>
	<52D8E1A7.1080506@redhat.com> <20140117092921.GA5869@x2.net.home>
In-Reply-To: <20140117092921.GA5869@x2.net.home>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Identifying useable block devices
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Karel Zak <kzak@redhat.com>
Cc: henson@acm.org, linux-lvm@redhat.com

On 01/17/2014 10:29 AM, Karel Zak wrote:
> On Fri, Jan 17, 2014 at 08:54:15AM +0100, Peter Rajnoha wrote:
>> Well, that is probably an RFE for util-linux to give priority to
>> /dev/<vgname>/<lvname> instead of /dev/mapper/<vgname>-<lvname>
>> if it's available...
>>
>> Karel, would that be possbible for you to add? (though I expect
>> you probably don't want to add any additional and specific logic
>> for dm devices :) )
> 
> I have spent years to move from /dev/dm-N to /dev/mapper/<name> ... :-)
> 
> Note that /dev/mapper/<name> paths are in many cases composed from
> /sys/block/dm-<N>/dm/name and this sysfs file has been added (by
> Milan) just to support conversion from random DM paths (or devno) to
> the canonicalized /dev/mapper/<name>.
> 
> How I can convert maj:min or /dev/dm-N to /dev/vg/vol path? Is the
> volume group name (always) in /sys/block/dm-<N>/dm/name and (always)
> separated by "-" ?
> 

It would require more steps for LVM:
 - you would need to look at the /sys/block/dm-<N>/dm/uuid
 - if the UUID has "LVM-" prefix, it's LVM device
 - the you would need to translate the /sys/block/dm-<N>/dm/name
   into its VG and LV part (it's always separated by "-", if the
   VG or LV name itself contains "-", escaped form of this char is used
   which is "--").
 - then check whether /dev/<vgname>/<lvname> exists and use it if yes

Similarly for any other DM subsystem that has its own naming
logic and priorities with respect to /dev content (not sure at the
moment if mpath or cryptsetup has any, probably not).

> It also seems that this is LVM specific, for non-LVM devices (for 
> example LUKS) we want to use /dev/mapper/<name>.

Sure, this is LVM specific only (as well as it would be for any other
DM subsystem). The only thing here is to make people use the more
approriate /dev/<vgname>/<lvname> instead of /dev/mapper because
otherwise if they see /dev/mapper on output, they just use this.

However, frankly, I can imagine that someone somewhere already uses
(incorrectly) the comparison of the path found on output of util-linux
utilities with "mapper" to say that this is the dm device and make
decisions based on that - that can become broken then...

This is more a cosmetic change. The exact same logic can be used
in all those scripts that try to identify which LV is for internal
use only (and so they should avoid processing the device). But in that
case, this logic must be used in all those places around, having that
in util-linux would make it a bit more centric.

As an interface, I can imagine keeping the /dev/mapper as the primary
name and then have a brand new field like "preferred name" or so...
Just a suggestion.

-- 
Peter
