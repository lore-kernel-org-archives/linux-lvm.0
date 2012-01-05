Message-ID: <4F057EF9.6030606@redhat.com>
Date: Thu, 05 Jan 2012 11:44:09 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <7D2B67C5-B2AC-4319-9818-B7E1DF896D04@jabberwocky.com>
In-Reply-To: <7D2B67C5-B2AC-4319-9818-B7E1DF896D04@jabberwocky.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] DM suspend locks up under load?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 4.1.2012 23:50, David Shaw napsal(a):
> Hi,
>
> I'm using some code that creates a snapshot using DM directly (we aren't using LVM), using essentially:
>
>    suspend linear device X
>    reload X as a "snapshot-origin" device
>    create "snapshot" device
>    resume original X device (which is now a snapshot-origin)
>
> This has worked fine for several years.  Recently, however, we updated to a more recent system, and ext4, and are seeing something odd.  Under load, the process above freezes at the first suspend step, and locks up the device in question, requiring a reboot to fix things.
>
> I wrote the attached program to demonstrate the problem.  All it does it call DM_DEVICE_SUSPEND and DM_DEVICE_RESUME over and over on a DM device.  Basically, run the test program on any mounted linear DM target in one shell, then delete a lot of data from a directory residing on that device in another shell.  On my systems this will freeze both the test program and the rm in D state, and require a reboot to fix things.
>
> I've tried multiple different kernels, but at the moment, I'm using kernel-PAE-2.6.35.6-45.fc14.i686 and device-mapper-libs-1.02.63-2.fc14.i686.
>
> One clue I can add is that it only seems to happen if the filesystem on the device is ext4.  It does not happen with ext3.
>
> Any ideas on where I should look next?
>

Maybe you should suspect ext4  - if there is no problem with dm & ext3 ?

I guess you need to get stacktrace where the system locks.
(echo t >/proc/sysrq-trigger  - or Sysrq+T)

You should probably also try different kernel.

Zdenek
