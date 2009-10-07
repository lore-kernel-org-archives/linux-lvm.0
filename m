Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n97JBLQM015421
	for <linux-lvm@redhat.com>; Wed, 7 Oct 2009 15:11:22 -0400
Received: from mail-gx0-f221.google.com (mail-gx0-f221.google.com
	[209.85.217.221])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n97JBBRL023265
	for <linux-lvm@redhat.com>; Wed, 7 Oct 2009 15:11:12 -0400
Received: by gxk21 with SMTP id 21so1978840gxk.10
	for <linux-lvm@redhat.com>; Wed, 07 Oct 2009 12:11:11 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 7 Oct 2009 15:11:11 -0400
Message-ID: <a422b4da0910071211we119340u1c85ac47a92b1529@mail.gmail.com>
From: Peter Petrakis <peter.petrakis@gmail.com>
Subject: [linux-lvm] restoring LV after VG has been "reduced"
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
To: linux-lvm@redhat.com

Hi All,

I'm running LVM through it's paces on Centos 5.3 for the purposes of writing
management code. One of the challenges I'm trying to address is a striped
volume, where the PV that backs it goes away, and later returns but not
before we run 'vgreduce --removemissing --force VolData' to able to work with
the volume group in the meantime.

So I have all the UUIDs of everything that matters stashed away and a dump
of dmsetup table before I insert the fault. After I make the VG consistent again
I add the same disk back into the system, recognize it's meta-data signature
as something I've worked with before and 'vgextend' it back into the
volume group.

Now I presume that LVM would have enough information in the on disk meta
data to re-assemble the logical volumes but I was wrong. Even after vgscan,
the one striped volume failed to show up. So I resorted to using dmsetup

 dmsetup create VolData-striped_lv --table "0 8388608 striped 2 128
8:51 384 8:3 4063616"
 dmsetup load VolData-striped_lv --table "0 8388608 striped 2 128 8:51
384 8:3 4063616"


The second dmsetup command may have been unnecessary but I was discouraged from
the results where the LVM tools failed to notice the device but I
clearly see it in /dev/mapper.

[root@node1 ~]# lvs
  LV       VG      Attr   LSize Origin Snap%  Move Log Copy%  Convert
  data_vol VolData -wi-ao 1.94G
  testlv   VolData -wi-a- 1.00G
  rootfs   VolSys  -wi-ao 9.75G
  swapfs   VolSys  -wi-ao 1.94G


I'm using the LVs as backing stores for DRBD, so if I didn't have to
resync the entire volume
that would be great e.g. recreate the LV from scratch with the same name.

So I guess my questions are.

1) Can I use LVM tools to bring this volume back into service and how?
2) Why can't the LVM tools see what I've done using the dmsetup incantations
mentioned above?
3) In addition, is there a "better way" to bring back a striped LV if say I had
to install a new blank disk and the volume group had been "reduced" in
the meanwhile?

Thanks!

Peter

P.S. requisite version information

lvm2-2.02.40-6.el5
kernel-PAE-2.6.18-128.el5
device-mapper-1.02.28-2.el5
device-mapper-multipath-0.4.7-23.el5
device-mapper-event-1.02.28-2.el5
