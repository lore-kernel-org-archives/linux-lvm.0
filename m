Message-ID: <4F86DB2B.1020009@redhat.com>
Date: Thu, 12 Apr 2012 14:39:55 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <1637520600.360900.1334237469507.JavaMail.root@nelson.canoo.com>
In-Reply-To: <1637520600.360900.1334237469507.JavaMail.root@nelson.canoo.com>
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
To: Erik Schwalbe <erik.schwalbe@canoo.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 04/12/2012 02:31 PM, Erik Schwalbe wrote:
> Hi,
> 
> sorry but it did not work:
> 
> I deactivate the VG kvm_disk0 with vgchange -an kvm_disk0, after that I set the filter

Test it at this point. There is no need to reboot. If
pvs/vgchange/vgdisplay etc. still display the nested VG and its PV your
filters are wrong or insufficient. Examine the -vvv output from the
tools to see the filter decisions that are being made.

Since you haven't mentioned any of the versions you are using you may
also want to remove the LVM2 cache after editing the filter (current
versions clear it automatically but older releases would still show
filtered devices if they exist in the cache.

> and do a update-initramfs -u -k all

You need to know whether this is the correct command for your
distribution and that it's affecting whatever kernel/initramfs
combination the machine boots by default (and also that it actually
works and creates a new initramfs).

But for now I would ignore boot problems and focus on the filter. Don't
try to solve all the problems at once as that just makes it more confusing.

When you have confirmed that your filter settings correctly exclude the
nested VG you can move on to making sure those settings are applied at boot.

Regards,
Bryn.
