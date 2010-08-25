Message-ID: <4C750A52.8070500@redhat.com>
Date: Wed, 25 Aug 2010 14:19:30 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <loom.20100825T100856-592@post.gmane.org>
	<4C74FED0.5000603@redhat.com>
In-Reply-To: <4C74FED0.5000603@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Can't remove snapshot at first
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
Cc: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>, Milan Broz <mbroz@redhat.com>

On 08/25/2010 01:30 PM +0100, Milan Broz wrote:
> On 08/25/2010 10:12 AM, Alexander Skwar wrote:
>> --($ ~)-- sudo /sbin/lvremove /dev/Sys/Home-Backup_Snapshot 
>>   Can't remove open logical volume "Home-Backup_Snapshot"
>>
> Upstream lvm2 with combination of recent udev and udisks package
> should have this fixed (hopefully).

Well, not completely in this exact case. It's hard to cover this
situation with "nowatch"/dm udev flags here because someone could
change the contents of the volume and so the snapshot volume and
original volume can differ.

Anyone scanning for those changes in udev rules could miss the
change of a symlink name based on some changed attribute or some
other call that notifies about changes in general.

We can rule out the mirror's _mimage, snapshot's -cow/-real etc.
scanning, but the top-level snapshot - unfortunately not.

So for now, it would be better to just try to comment out that
watch rule in udisks udev rules so we can see that is the case.

If yes, we can make our argument that this really causes problems
even stronger and try to persuade people who use the watch rule
to be inclined to some other alternative solution that is less
problematic to support.

Peter
