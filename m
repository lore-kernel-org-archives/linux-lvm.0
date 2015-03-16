Message-ID: <5506C8FA.6020601@redhat.com>
Date: Mon, 16 Mar 2015 13:13:46 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CANvCAA9qEJQUFbFh6X6BVPO2uo2+ELQZp0Fi_wQr34JyvkaHOA@mail.gmail.com>
In-Reply-To: <CANvCAA9qEJQUFbFh6X6BVPO2uo2+ELQZp0Fi_wQr34JyvkaHOA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] device-mapper: snapshots: Invalidating snapshot:
 Unable to allocate exception.
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
Cc: Lars <lars.i.johansson@delecsys.se>

Dne 15.3.2015 v 14:03 Tomas Dalebjork napsal(a):
> Hi,
>
> We have configured /etc/lvm/lvm.conf to extend our snapshot automatically.
> This works fine for slow growing volumes, but if the growth of the volume is
> faster, than LVM invalidate the snapshot rather than extend the snapshot volume.
> Because I think that the lvm-monitor does not grow the volume in time.
>
> This is the error we see in kernel log (dmesg)
> device-mapper: snapshots: Invalidating snapshot: Unable to allocate exception.
>
> Our snapshot volume is 1GB
> Our extension is configured like this in /etc/lvm/lvm.conf
>
>      snapshot_autoextend_threshold = 50
>      snapshot_autoextend_percent = 20
>
> And we have restarted lvm2-monitor services after this changes using
> # service lvm2-monitor restart
>
> Other slow growing volumes works fine.
>
> Can someone hint us of what the issue can be, or how to mitigate this to happen?
> Or tell me how often the "lvm2-monitor" is checking the utilization threashold
> of the volumes?


It's a known issue - the advice is to switch to thin provisioning were there 
is no such problem.

'dmeventd' is not fast enought for old snapshots.

If you want to use old snaps - you need to have reserve for  10 x 
speed_of_your_drive.

So i.e. if you want to be sure you will not get invalid snapshot and
you could push  0.5G/s through your SSD - you simply need 5GB reserve.

Back to your example - for 1GB origin you need to provide 100% size for 
snapshot otherwise you are in danger of getting invalid snapshot when you 
rapidly write to your origin.

There is no other advice then to switch to thinly provisioned devices for such 
case.


Regards

Zdenek
