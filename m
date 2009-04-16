Message-ID: <49E75686.9050507@redhat.com>
Date: Thu, 16 Apr 2009 12:02:14 -0400
From: Takahiro Yasui <tyasui@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Simulating LVM Mirror Failure and recovery
References: <29070.706.qm@web94806.mail.in2.yahoo.com>
	<20090416154834.GA22781@us.ibm.com>
In-Reply-To: <20090416154834.GA22781@us.ibm.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

malahal@us.ibm.com wrote:
> I usually run "echo 1 > /sys/block/sda/device/delete" to make /dev/sda
> disappear and fail for LVM tests. You can fail the disk in a lot of ways
> depending on your hardware, but this trick works with almost every
> device!

# echo offline > /sys/block/sda/device/state

might work as well. In this case, you can recover the failure by

# echo running > /sys/block/sda/device/state

Thanks,
Taka
