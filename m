Message-ID: <E631530D51ABD411B823009027855C5B0278BE@THOR>
From: Murthy Kambhampaty <Murthy.Kambhampaty@goeci.com>
Subject: RE: [linux-lvm] Volume group not found on restart [resent]
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed May 22 12:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Heinz, the "gone one" has been gone for a long while. It was a single SCSI
disk (/dev/sda) which I added to the VG to use for snapshotting db_dir (for
backup) and would immediately lvremove (see the SnapBach.sh script below;
not too sophisticated, just faithfully replicates the necessary keytrokes). 

However, the snapshot strategy did not work out for me (it was for backing
up my production databases; I decided to get MySQL to hotcopy the databases,
and then do a [xfs]dump of the filesystem containing the hotcopy). So, I did
a vgreduce /dev/sda, but pvscan kept telling me it was still in VG "db_vol",
so I did an lvmchange -R to see if I could "reset" the information, but that
didn't work, so I rebooted and then pvscan only gave /dev/rd/c0d0p6 in
"db_vol". NOTE: I was/am still learning to deal with LVM; I think I figured
out that all I needed to do was a vgscan, which is what the reboot did; too
much exposure to MS Windows, I guess ;(.

So, the preferred course here is to "to change the metadata in order to get
rid of the gone physical volume", and all will be well. 

Thanks for your continuing assistance. Its really great that you got on top
of this issue so quickly.

I look forward to your advice on the steps necessary for changing the
metadata,
	Murthy


Begin script SnapBack.sh:
#!/bin/bash
# FN: SnapBack.sh
# AB: Archives /home/db to a daily backup file on compa5
# DT: 20020321
# AU: Murthy Kambhampaty

SnapDir=/dev/db_vol/db_dir
SnapLVName=snap_db
SnapLVPath=/dev/db_vol/snap_db
SnapMount=/mnt/dbsnap

/sbin/lvcreate -s -l 4999 -n $SnapLVName $SnapDir ; \
        mount -v -t xfs -o ro,nouuid,norecovery $SnapLVPath $SnapMount  ; \
        cd $SnapMount ; \
        /opt/schily/bin/star -czl \
                f=/mnt/dbback/$(date +%A)_snap.tar . ; \
        cd / ; \
        umount -v $SnapMount ; \
        /sbin/lvremove -f $SnapLVPath
End SnapBack.sh script.

> -----Original Message-----
> From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com]
> Sent: Wednesday, May 22, 2002 13:21
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Volume group not found on restart [resent]
> 
> 
> 
> Murthy,
> 
> the metadata you sent to me directly shows, that 2 physical 
> volumes belong
> to your volume group db_vol but only one can be found on 
> /dev/rd/c0d0p6.
> 
...
> 
> If you can't get the physical volume back, there's hope to change the
> metadata in order to get rid of the gone physical volume.
> That could be possible, because logical volume "db_dir" seems 
> to be allocated
> on /dev/rd/c0d0p6 only and "snap_db" on the gone physical volume.
> 
