Received: from [10.34.131.89] (dhcp131-89.brq.redhat.com [10.34.131.89])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2K8UsSN004102
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2015 04:30:55 -0400
Message-ID: <550BDABE.3060005@redhat.com>
Date: Fri, 20 Mar 2015 09:30:54 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAE8gLhnfE2Dd3cKXS-wJajJ6h5wnW11QprDLPrrJX0_eXJ_F3A@mail.gmail.com>	<54743766.7020502@redhat.com>	<CAE8gLh=yKODk+7OcyB8=X5Qp1haEYOZuzVb8g4wUdENogs7wng@mail.gmail.com>	<5474933E.8070007@redhat.com>	<CAE8gLh=pJLBeWSWCkDOomH-7XjBWHJjx9z4Ss2r+JBTokisUtA@mail.gmail.com>	<CAHDsjKvsC4J++4d1kdzP0wvhTYjxVEJxyTG5Gw9ETHGPc5uGrw@mail.gmail.com>	<CAE8gLh=ju97Ne0y=tyXej3Ugh21VBSZq2fM7HExjcpxC1wFGyA@mail.gmail.com>	<CAE8gLhmWKur6vWEzv=NF-psPyMxHrS3S4Tgr82HD168J4c59=w@mail.gmail.com>
	<550B1E2D.2030206@gathman.org>
In-Reply-To: <550B1E2D.2030206@gathman.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM VG is not activated during system boot
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

Dne 19.3.2015 v 20:06 Stuart Gathman napsal(a):
> On 03/19/2015 02:34 PM, MegaBrutal wrote:
>> Now I think I figured out what's going on. It seems to be
>> Debian/Ubuntu specific, but I post here, maybe Debian/Ubuntu devs are
>> here and see this.
>>
>> Bug report:
>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1396213
>>
>> What actually makes the VG activation so long is that I have a
>> snapshot. Activating the snapshot takes very long, and bringing up the
>> entire VG takes about 5 minutes. This wouldn't be such a big problem,
>> as I could just patiently wait for the activation (with rootdelay).
>> But it seems something (maybe some kind of watchdog) kills vgchange
>> before it could finish bringing up all VGs. I had the fortune to boot
>> a developmental Vivid, and I've seen some 'watershed' messages stating
>> that 'vgchange' was killed because it was taking "too long". If we'd
>> let 'vgchange' to finish properly, I had the 2nd VG activated
>> properly, which contains my root FS.
>>
>> It's a server. If it has a long boot time, so be it, it doesn't get
>> rebooted often anyway during normal circumstances. But it is required
>> to boot up without user interaction, e.g., when I issue a reboot
>> remotely. The main problem is that currently, user interaction is
>> necessary to pass initrd (as the root VG needs to be manually
>> activated), which means, I can only reboot the server when I'm
>> physically near.
> I've had the same problem on Fedora - so it is not ubuntu specific. On Fedora,
> systemd has a timeout for VG activation.  That can be increased.  However, you
> can flag the snapshot to *not* be activated automatically (Skip activation:
> -k) at volume group activation. That allows the system to boot (remote
> reboot), and then you can manually activate the big snapshot (or automatically
> in a later script) - waiting the requisite 5 or 10 minutes.


Hi

To clean some 'myths' here:


With old-snapshots (non-thin pool based)  you cannot skip activation of 
snapshot -  origin and all its snapshots always have to be active.

If the old-snapshot is larger (in range of GB) it takes quite some time to 
process whole COW volume and read and parse all metadata stored there.
The metadata format for an old snapshot has been targeted to be small and 
occupy minimum extra space - thus if someone keeps it permanently and stores 
there a lot of data it's very very very inefficient.

This problem with old snaps basically cannot be fixed unless there would be a 
completely different new snapshot target ;)

So the advised fix for long term snapshot is to switch to use thin-pool.

Here you will have all the goodies - very fast and efficient snapshots, you 
could easily take snapshot of snapshot and you could also select if you want 
to have snapshot activated or not (and by default it's skipped from activation).

Regards

Zdenek
