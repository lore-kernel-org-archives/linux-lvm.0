Message-ID: <4F7BFCE8.3030503@redhat.com>
Date: Wed, 04 Apr 2012 09:48:56 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <4F7AFEF7.2060503@agenda.si> <4F7B0569.8040001@redhat.com>
	<4F7B0A59.8080403@agenda.si>
In-Reply-To: <4F7B0A59.8080403@agenda.si>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Removing snapshot often fails
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
To: Danilo Godec <danilo.godec@agenda.si>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 04/03/2012 04:34 PM, Danilo Godec wrote:
> On 04/03/2012 04:12 PM, Peter Rajnoha wrote:
>> On 04/03/2012 03:45 PM, Danilo Godec wrote:
>>> However I discovered that often removing a snapshot fails - unfortunately it's quite unpredictable, as sometimes it works on next try but sometimes it fails 20 times in a row - making it very unpleasant for scripting...
>> What's the lvm2 version you're using?
> 
> The version is 2.02.67 from 'official' OpenSuSE 11.4 updates.
> 
>> With a very high probability, this is caused by the "watch" udev rule.
>> Do you have "udisks" installed? This one sets in its
>> '/lib/udev/rules.d/80-udisks.rules' the 'KERNEL=="dm-*", OPTIONS+="watch"'
>> which causes the udev event to be generated and processed while trying to
>> close the device.
> 
> Yes, udisks package is installed and above mentioned rule file is in place. Not sure if it's really needed, though.
> 

Udisks keeps the information about storage devices and provides an interface
for disk management. It's targeted for desktop integration mostly
(the "palimpsest - gnome-disk-utility" makes use of it mainly, I think)

>> See also https://bugzilla.redhat.com/show_bug.cgi?id=577798 for more
>> information about the problem.
> 
> It seems that 'udevadm control --stop-exec-queue' before removing the snapshot could be a viable workaround.
> 

Better workaround is to delete/comment out the 'KERNEL=="dm-*", OPTIONS+="watch"'
line in the 80-udisks.rules. The only thing you'd lose is the immediate update
when something changes metadata (filesystem label - the consequent update
of /dev/disk symlinks, changes in lvm metadata and update of the udisks
state etc.). Though after a normal "CHANGE" udev event comes, this info
is updated. This happens after restarting the system or generating the
event directly by "echo change > /sys/block/dm-X/uevent" (dm-X being the
actual device-mapper device).

The watch udev rule is even removed in latest versions of udisks. The problem
here is that the proper logic should be that all the utilities changing any
metadata on that device (e.g. the filesystem label, creating a filesystem...)
should generate the event themselves which is still not done today. Instead,
we're "watching" all closes of the device after being open for "write" (which
is what the WATCH rule is about - it's the inotify for "close after open for write"
and this is not 100% correct since not all such writes change metadata (writing
normal data) and causes useless resource consumption while processing the
events, also creating races ending up with problems like you're hitting now.

>> Recently, we've added a retry loop when trying to remove a device-mapper
>> device. This will try to remove the device several times before it fails
>> completely (libdevmapper v1.02.68, lvm2 v2.02.89 released 26th Jan. 2012).
>> Though you still get an error saying "remove ioctl failed" on each failed retry...

This is more or less an "official" workaround we've added for now, but the
real solution is the one described above with sending the event by all
the utilities changing metadata. Maybe one day this will be changed.
I hope...

Peter
