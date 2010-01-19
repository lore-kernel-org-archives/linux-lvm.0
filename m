Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0J324OY016256
	for <linux-lvm@redhat.com>; Mon, 18 Jan 2010 22:02:04 -0500
Received: from n21.bullet.mail.mud.yahoo.com (n21.bullet.mail.mud.yahoo.com
	[68.142.206.160])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o0J31qdJ028478
	for <linux-lvm@redhat.com>; Mon, 18 Jan 2010 22:01:53 -0500
Message-ID: <10303.91360.qm@web114113.mail.gq1.yahoo.com>
Date: Mon, 18 Jan 2010 19:01:51 -0800 (PST)
From: J Nb <j_nwb@yahoo.com>
In-Reply-To: <42784f261001181815y340170dbs4775230080358bc3@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Mounting an LVM disk image.
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Try using the -U option and specify the uuid of the correct vg.
U can get vg uuid using vgdisplay.

-nb

--- On Mon, 1/18/10, Jason Dusek <jason.dusek@gmail.com> wrote:

> From: Jason Dusek <jason.dusek@gmail.com>
> Subject: [linux-lvm] Mounting an LVM disk image.
> To: linux-lvm@redhat.com
> Date: Monday, January 18, 2010, 6:15 PM
> � I'm trying to mount a disk
> image that contains an LVM volume.
> � I've managed to follow this tutorial to the point
> where I've
> � got the volume on `/dev/loop7':
> 
> � � http://www.thegibson.org/blog/archives/467
> 
> � Now I want to mount the image. My machine, a CentOS
> machine,
> � is already using LVM; running `lvm pvscan' shows me
> that the
> � the disk image has been stuck in `VolGroup00' with
> the rest of
> � them:
> 
> ���:; lvm pvscan
> � � PV /dev/loop7���VG
> VolGroup00���lvm2 [7.88 GB / 0� �
> free]
> � � PV /dev/sda5� � VG
> VolGroup00���lvm2 [133.06 GB / 0� �
> free]
> � � PV /dev/sdb2� � VG
> VolGroup00���lvm2 [135.16 GB / 0� �
> free]
> � � Total: 3 [276.09 GB] / in use: 3 [276.09 GB]
> / in no VG: 0 [0���]
> 
> � At this point in the tutorial, I run in to trouble.
> As they
> � suggest, I run `lvm vgchange -ay' and then inspect
> � `/dev/mapper':
> 
> ���:; lvm vgchange -ay
> � � 2 logical volume(s) in volume group
> "VolGroup00" now active
> � � 2 logical volume(s) in volume group
> "VolGroup00" now active
> ���:; ls /dev/mapper/
> � � control� VolGroup00-LogVol00�
> VolGroup00-LogVol01
> 
> � Mounting fails:
> 
> ���:;� mount -t ext2
> /dev/mapper/VolGroup00-LogVol01 /media/img/
> � � mount: /dev/mapper/VolGroup00-LogVol01
> already mounted or /media/img/ busy
> ���:;� mount -t ext2
> /dev/mapper/VolGroup00-LogVol00 /media/img/
> � � mount: /dev/mapper/VolGroup00-LogVol00
> already mounted or /media/img/ busy
> � � mount: according to mtab,
> /dev/mapper/VolGroup00-LogVol00 is mounted on /
> 
> � At this point, I'm stuck. I've tried removing
> `/dev/loop7'
> � from the volume group, to no avail:
> 
> ���:; vgcreate shim /dev/loop7
> � � Physical volume '/dev/loop7' is already in
> volume group 'VolGroup00'
> � � Unable to add physical volume '/dev/loop7' to
> volume group 'shim'.
> ���:; vgreduce VolGroup00 /dev/loop7
> � � Physical Volume "/dev/loop7" not found in
> Volume Group "VolGroup00"
> 
> � What's the right way to mount and LVM disk image?
> I'm doing it
> � to perform maintenance on a Xen guest.
> 
> --
> Jason Dusek
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


      
