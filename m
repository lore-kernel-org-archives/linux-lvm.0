Message-ID: <4F86C9FA.9040906@redhat.com>
Date: Thu, 12 Apr 2012 13:26:34 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <1943758108.360003.1334232848115.JavaMail.root@nelson.canoo.com>
In-Reply-To: <1943758108.360003.1334232848115.JavaMail.root@nelson.canoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Hide volume group during startup
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
Cc: Erik Schwalbe <erik.schwalbe@canoo.com>

On 04/12/2012 01:14 PM, Erik Schwalbe wrote:
> The symlink in /dev/data/ is:
> 
> lrwxrwxrwx  1 root root   24 2012-04-05 12:51 kvm_disk0 -> ../mapper/data-kvm_disk0

OK, you're using an older LVM2/device-mapper that does not use udev to
manage the device nodes and symlinks in /dev.

> Should I be using this:
> 
> filter = [ "r|/dev/mapper/data-kvm_disk0|", "r|/dev/kvm_disk0|", "a|.*|"]

Yes. Or use the alternate style I showed and only accept the PVs
belonging to the data VG.

As Lars said you may also need to rebuild your initramfs although if the
data VG doesn't contain your root file system, swap or other resources
normally set up in the initramfs this shouldn't be needed.

Regards,
Bryn.
