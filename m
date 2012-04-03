Message-ID: <4F7B0569.8040001@redhat.com>
Date: Tue, 03 Apr 2012 16:12:57 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <4F7AFEF7.2060503@agenda.si>
In-Reply-To: <4F7AFEF7.2060503@agenda.si>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Danilo Godec <danilo.godec@agenda.si>

On 04/03/2012 03:45 PM, Danilo Godec wrote:
> However I discovered that often removing a snapshot fails - unfortunately it's quite unpredictable, as sometimes it works on next try but sometimes it fails 20 times in a row - making it very unpleasant for scripting...

What's the lvm2 version you're using?

With a very high probability, this is caused by the "watch" udev rule.
Do you have "udisks" installed? This one sets in its
'/lib/udev/rules.d/80-udisks.rules' the 'KERNEL=="dm-*", OPTIONS+="watch"'
which causes the udev event to be generated and processed while trying to
close the device.

See also https://bugzilla.redhat.com/show_bug.cgi?id=577798 for more
information about the problem.

Recently, we've added a retry loop when trying to remove a device-mapper
device. This will try to remove the device several times before it fails
completely (libdevmapper v1.02.68, lvm2 v2.02.89 released 26th Jan. 2012).
Though you still get an error saying "remove ioctl failed" on each failed retry...

Peter
