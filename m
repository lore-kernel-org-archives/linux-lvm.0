Message-ID: <55643397.7010609@redhat.com>
Date: Tue, 26 May 2015 10:49:27 +0200
From: Ondrej Kozina <okozina@redhat.com>
MIME-Version: 1.0
References: <20150521141955.70ebe714@leda.localdomain>	<5562CC3F.9010901@redhat.com>	<20150525183650.36634482@leda.localdomain>
	<20150526100620.487e7703@leda.localdomain>
In-Reply-To: <20150526100620.487e7703@leda.localdomain>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] autoactivation fails
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: list@eworm.de, LVM general discussion and development <linux-lvm@redhat.com>

On 05/26/2015 10:06 AM, Christian Hesse wrote:
> Christian Hesse <list@eworm.de> on Mon, 2015/05/25 18:36:
>
> Actually running v2.02.220 with commit f8bf6410 on top. Volumes are
> activated, but udev reports:
>
> timeout, giving up waiting for workers to finish
>
> This adds a boot delay of 30 seconds. Not perfectly sure if this is an lvm2
> issue though, chances are that this is caused by systemd v220 update. Any
> ideas?
>

Could you try to boot with udev in debug mode? I'm not sure if it's same 
as with Fedora distribution. It should be enough to put 'debug' keyword 
among kernel parameters, though I'm not sure about Arch Linux distribution.

Paste udev debug messages here. Look for lines containing pvscan but the 
reason for such timeout may be completely lvm2 unrelated.

Also I'm slightly confused here. Do we speak about system w/o systemd 
involved at all? Or do Arch Linux boot to initramfs w/o systemd and 
switch to systemd after root being actually mounted?

And on last question, do you ship upstream udev rules or do you install 
Arch Linux specific rules?
