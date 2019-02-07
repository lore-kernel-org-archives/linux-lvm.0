References: <20190206183841.69e38617@gmail.com>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <b2ccc7a2-b4fa-4acb-63d8-1126e7a01959@redhat.com>
Date: Thu, 7 Feb 2019 11:18:40 +0100
MIME-Version: 1.0
In-Reply-To: <20190206183841.69e38617@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [systemd-devel] Possible race condition with LVM
 activation during boot
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
To: suscricions@gmail.com
Cc: systemd-devel@lists.freedesktop.org, linux-lvm@redhat.com

On 2/6/19 6:38 PM, suscricions@gmail.com wrote:
> Hi,
> 
> First of all apologies if this is not the correct channel to request
> for help with this issue. I've tried asking in Arch Linux forums
> without luck for the moment.
> 
> Long story short, from time to time I'm dropped to a rescue shell
> during boot because of a logical volume that cannot be found, so the
> respective .mount service fails making the local-fs.target stop normal
> boot process.
> 
> local-fs.target: Job local-fs.target/start failed with result
> 'dependency'.
> 
> Under normal circumstances I'd assume that a logical volume should be
> activated first in order to be mounted, but a few times mounting happens
> first so causing the error. I think this can be a race condition or
> something similar because strikes randomly. Booting again avoids the
> problem for the moment, which happened twice during past days.
> 
> All the relevant parts from logs and information about my system
> partition scheme is posted here:
> https://bbs.archlinux.org/viewtopic.php?pid=1830442
> 
> Hope some of you can help me to find the root cause and again apologies
> if this is not the place or the issue is too obvious.
> 

If there's a mount unit, it's bound to certain device for which systemd
waits to appear on the system. So yes, the device must be activated
first before the mounting happens. If device doesn't appear within a
timeout, you usually get dropped to a rescue shell.

Please, if you hit the problem again, try to collect LVM debug info by
running the "lvmdump -u -l -s" command that creates a tarball with
various LVM-related debug info we can analyze. It contains content of
the journal for the current boot, the udev environment, LVM
configuration, device stack listing and various other useful information
for more thorough debugging.

I'm adding CC linux-lvm, let's move this discussion there. Thanks.

-- 
Peter
