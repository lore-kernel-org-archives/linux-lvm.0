Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j0BH0rBM030286
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 12:00:53 -0500
Sender: alewis@redhat.com
Subject: Re: [linux-lvm] Extending a stripped Logical Volume
References: <mailman.15037.1105141586.8459.linux-lvm@redhat.com>
From: AJ Lewis <alewis@redhat.com>
Date: 11 Jan 2005 11:00:53 -0600
In-Reply-To: <mailman.15037.1105141586.8459.linux-lvm@redhat.com>
Message-ID: <x053bx7j3y2.fsf@null.msp.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Olmo Gonz�lez Alcojor <olmo@olmo.org> writes:

> 95388 PE of 4mb each is ~370 Gbyte, right? I may be missing something... I've tried to lvextend and get the same error, even when trying to extend just 1Gbyte.

You had 4 disks originally, and you striped across all of them,
presumably with -i4.  Now you added 2 disks, and you're trying to
stripe 4 ways across them (because lvm2 defaults to the stripe size of
the previous segment).  This will fail because you don't have 4 disks
to stripe across.  To do this, you will need to specify '-i2' to your
lvextend command.  If the free space is split evenly across the 2 new
disks, you should be able to fill the entire vg with 'lvextend -l95388
-i2 /dev/nasvg/naslv'

> -----Mensaje original-----
> De: AJ Lewis [mailto:alewis@redhat.com] 
> Enviado el: martes, 04 de enero de 2005 20:40
> Para: LVM general discussion and development
> Asunto: Re: [linux-lvm] Extending a stripped Logical Volume
> 
> Olmo Gonz�lez <olmo@olmo.org> writes:
> 
> > I am new to this list, seeking for some help.
> > 
> >  I have setup LVM2 under debian sarge (2.6.8-k7 kernel).
> > 
> > I originally created a volumen group (nasvg) on 4 x ST3200822A ATA
> > DISK drives. I created a stripped logical volume spanning these 4
> > disks and using up al PE's available. I then attached two aditional
> > ST3200822A ATA DISK drives and I would now want to resive my logical
> > volumen to use al the PE's provided by the two new disks. The problem
> > is I can't extend the logical volume, getting the following error:
> > 
> > gollum:~# lvextend -L+1G /dev/nasvg/naslv
> >   Using stripesize of last segment 64KB
> >   Extending logical volume naslv to 746.23 GB
> >   Insufficient allocatable extents suitable for parallel use for
> > logical volume naslv: 191036 required
> > 
> > I have been googl'ing and it seems that this has to do with
> > restrictions on resizing sttriped LV's. However, the information I
> > have found says the restrictions no longer apply to LVM2.
> 
> You should be able to 'lvextend -L+1G /dev/nasvg/naslv -i1' if you
> have and additional 1G of free space in the VG.  However, based on the
> vgdisplay output below, it looks like you only have 3.72G free (or
> 95388 extents), so you'd want do do: 'lvextend -l+95388
> /dev/nasvg/naslv -i2' if you want to stripe it across the 2 new disks,
> or 'lvextend -l+95388 /dev/nasvg/naslv -i1' if you want it to be a
> linear segment.
> 
> > gollum:~# vgdisplay
> >   --- Volume group ---
> >   VG Name               nasvg
> >   System ID
> >   Format                lvm2
> >   Metadata Areas        6
> >   Metadata Sequence No  25
> >   VG Access             read/write
> >   VG Status             resizable
> >   MAX LV                0
> >   Cur LV                1
> >   Open LV               1
> >   Max PV                0
> >   Cur PV                6
> >   Act PV                6
> >   VG Size               1.09 TB
> >   PE Size               4.00 MB
> >   Total PE              286168
> >   Alloc PE / Size       190780 / 745.23 GB
> >   Free  PE / Size       95388 / 372.61 GB
> >   VG UUID               LWqtTF-F8vA-yjXt-AYwK-yFQr-skDa-s9UVRC
> > 
> >   --- Logical volume ---
> >   LV Name                /dev/nasvg/naslv
> >   VG Name                nasvg
> >   LV UUID                GMm5PD-6Rdk-h8lG-35Fw-rZp3-L42s-N6k9QC
> >   LV Write Access        read/write
> >   LV Status              available
> >   # open                 1
> >   LV Size                745.23 GB
> >   Current LE             190780
> >   Segments               1
> >   Allocation             inherit
> >   Read ahead sectors     0
> >   Block device           254:0
> > 
> 
> Regards,
> -- 
> AJ Lewis                                   Voice:  612-638-0500
> Red Hat Inc.                               E-Mail: alewis@redhat.com
> 720 Washington Ave. SE, Suite 200
> Minneapolis, MN 55414
>    
> Current GPG fingerprint = D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8715
> Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
> many keyservers out there...
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> 

-- 
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414
   
Current GPG fingerprint = D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...
