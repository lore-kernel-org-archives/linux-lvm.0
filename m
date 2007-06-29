Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5TB1IBQ019178
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2007 07:01:18 -0400
From: Turbo Fredriksson <turbo@bayour.com>
Subject: Re: [linux-lvm] Forcibly remove broken disk from LV
References: <87ps3fdqex.fsf@pumba.bayour.com> <4684DCA3.8020504@redhat.com>
Date: Fri, 29 Jun 2007 13:01:14 +0200
In-Reply-To: <4684DCA3.8020504@redhat.com> (Bryn M. Reeves's message of "Fri, 
	29 Jun 2007 11:19:15 +0100")
Message-ID: <87k5tndnyd.fsf@pumba.bayour.com>
MIME-Version: 1.0
Sender: Turbo Fredriksson <turbo@pumba.redhat.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Quoting "Bryn M. Reeves" <breeves@redhat.com>:

> You can activate what's left of the volume group with:
> vgchange --partial -ay <VolGroup>

Tried that but it didn't seem to be working:

----- s n i p -----
root@pegasos:~# vgchange --partial -ay movies
  Partial mode. Incomplete volume groups will be activated read-only.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Device /dev/ioerror not found.
  device-mapper: reload ioctl failed: Invalid argument
  device-mapper: reload ioctl failed: Invalid argument
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Device /dev/ioerror not found.
  device-mapper: reload ioctl failed: Invalid argument
  1 logical volume(s) in volume group "movies" now active
root@pegasos:~# vgdisplay
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find all physical volumes for volume group movies.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find all physical volumes for volume group movies.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find all physical volumes for volume group movies.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find all physical volumes for volume group movies.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find all physical volumes for volume group movies.
  Couldn't find device with uuid 'nqj4V1-CxT3-At8I-Vc0h-E6iu-6jY3-a6z0A3'.
  Couldn't find all physical volumes for volume group movies.
  Volume group "movies" not found
----- s n i p -----

I was supposed to do this after physically removing/disconnecting the
broken disk, right?


Also, i noticed that I had the /dev/mapper/movies-pvmove0 block device.
How do i cancel the pvmove I initiated a couple of days ago (tried
to move hdb to availible space on VG - this availible space is/was
on the - now - broken disk)? The command 'pvmove --abort' won't
work - it also hangs...
