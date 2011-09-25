Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8P1ZHT3008097
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2011 21:35:17 -0400
Received: from latitanza.investici.org (latitanza.investici.org
	[82.94.249.234])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8P1ZChB021203
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2011 21:35:12 -0400
Message-ID: <4E7E854F.6010601@autistici.org>
Date: Sun, 25 Sep 2011 03:35:11 +0200
From: benry <benry@autistici.org>
MIME-Version: 1.0
References: <4E5DFE51.7090304@autistici.org>	<4E7DF8B1.7010100@autistici.org>
	<20110924145255.31498ee4@bettercgi.com>
In-Reply-To: <20110924145255.31498ee4@bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] simple LVM disk failure recover
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: support@bettercgi.com

On 09/24/2011 09:52 PM, Ray Morris wrote:
> .. also RTFM with a link to the right manual would be
>> kindly appreciated (if you know that an answer for my question exist
>> in the manual) ;)
> 
> man lvm | grep -5 partial

Ok, thanks very much for the answer, but I already tried the "partial"
option:

On 08/31/2011 11:26 AM, benry wrote:
> > I tried this command: "vgchange -P -a y raid", but the device
> > /dev/raid/data does not exist anyway.

Maybe I do not understand very well the part where it says "/dev/ioerror
will  be substituted, and you could use dmsetup (8) to set this up to
return I/O errors when accessed, or create  it  as  a large  block
device of nulls."
Is this optional or I have to do something with dmsetup to let the
command "vgchange -P -a y raid" work correctly?

Maybe I am missing what is the right purpose of this /dev/ioerror device.

> You probably do not need:
> man pvcreate | grep -2 uuid

Ok, so, this is needed to let the new pv (sda RAID) to be initialized
with the same uuid of the old one... right?
If I use it on the new drive, LVM will believe to have the old pv and
will make the volume available, apart from the fact that it will not
find data in it.
This makes sense to me ;)

>> LVM was configured to use sda and sdb in linear mode... not
>> stripping... so theoretically data in sdb should be readable, right?
> 
> The data on sdb is there, but it's probably not a correct filesystem, 
> so reading it may be difficult.

Ok, this makes sense too... what I'll try to do (since the lv was
containing an XFS filesystem) is to use the xfs_repair command, that as
far as I understood should look for pieces of an XFS filesystem and try
to repair it.

In conclusion, what I could try to do is:
1) create a new pv in the new RAID with the same uuid of the old one
(pvcreate)
2) activate the lv (vgchange)
3) try xfs_repair on the lv crossing my fingers

Right?


Thanks very much for the help... I read a lot of documentation, but
since I do not have a lot of experience with LVM and I am really afraid
of damaging also the remaining data, I kindly appreciate to have some of
your comments.

Enrico
