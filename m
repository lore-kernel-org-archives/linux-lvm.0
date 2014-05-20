Message-ID: <537AFE2A.50704@redhat.com>
Date: Tue, 20 May 2014 09:03:06 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAA-yaus6NpUkJYr3k9FSJ9KOiPQt2E+KdhK1D-dht7zgewAezQ@mail.gmail.com>
In-Reply-To: <CAA-yaus6NpUkJYr3k9FSJ9KOiPQt2E+KdhK1D-dht7zgewAezQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Setting readahead for Logical Volumes via udev
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
To: dwittman@gmail.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 05/19/2014 05:58 PM, David Wittman wrote:
> Hey all,
> 
> I'm having an issue tuning the readahead value for my Logical Volumes
> via udev. In short, I'm trying to create a rule that sets the readahead
> attribute for each of my Logical Volumes at boot time or upon the
> creation of a new volume. udev seems like the perfect place to do this,
> but for some reason or another LVM seems to be overriding these settings.
> 
> Here's the udev rule I'm using, followed by an example:
> 
> ```
> # cat /etc/udev/rules.d/83-readahead.rules
> # Set the readahead on non-spinning disks to 8kb (16 512b sectors)
> ACTION=="add", KERNEL=="dm-*", ATTR{queue/rotational}=="0",
> ATTR{bdi/read_ahead_kb}="8"
> 

Try ACTION=="change", KERNEL=="dm-*", ENV{DM_ACTIVATION}=="1", ATTR ....

Anyway, there's direct way to set the readahead value using LVM tools with:
  lvcreate/lvchange -r/--readahead (see man lvcreate and lvchange for more info).

-- 
Peter
