Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o31Jxbkm008946
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2010 15:59:37 -0400
Received: from n21.bullet.mail.ukl.yahoo.com (n21.bullet.mail.ukl.yahoo.com
	[87.248.110.138])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o31JxQ7Q008497
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2010 15:59:26 -0400
Message-ID: <554024.77471.qm@web87102.mail.ird.yahoo.com>
References: <mailman.3140.1269024912.9812.linux-lvm@redhat.com>
	<4A2CF3C24E05B348A46BAF5A7C4593D406F87546@BTCMVEXC1-PRD.hq.netapp.com>
Date: Thu, 1 Apr 2010 19:59:25 +0000 (GMT)
From: chris procter <chris-procter@talk21.com>
In-Reply-To: <4A2CF3C24E05B348A46BAF5A7C4593D406F87546@BTCMVEXC1-PRD.hq.netapp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Can not use vgimportclone multiple times for the
	attached disk
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

> I successfully mounted the associated logical volume from the backup of

> the same machine. Before SCSI scan I have only /dev/sda2 After SCSI 
> bus scan (rescan-scsi-bus.sh) I can see the new disk attached to my RHEL 
> machine.
>
> # vgimportclone -n NEWVG /dev/sdc2
> 
> It successfully rename the VG.
> #vgchange -ay NEWVG
>
> I am able to mount the logical volumes associated with this VG to verify
> the backup.
>
> After verifying I un-mounted logical volume and remove the volume group.
> Vgremove -f NEWVG 

This doesn't do what you think it does!  

vgremove removes the metadata from the physical volumes in the volume group, essentially destroying it.  So now /dev/sdc2 is not part of a vg at all. 

If you're just trying to unpresent /dev/sdc2 then you probably want to use vgexport to make the vg safe to export, then physically pull the disk.  While it is possible to do, LVM does not provide a way to make the linux forget about the disk, just as you have to use a seperate script to get it to recognize it in the first place.

As Stuart says, if you tell us more about what you're trying to do maybe we can be a bit more helpful :)


As an aside vgimportclone is only necesary if the metadata is an exact clone of that from an existing pv/vg if you've run it once then you dont need to run it again on that vg because the metadata has been already altered and therefore its no longer an exact clone (the data's the same but the disk headers are different)

chris



      
