From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] problem with vgcreate
Message-ID: <690630000.1037996221@[192.168.200.4]>
In-Reply-To: <20021122200742.GE8618@rdlg.net>
References: <20021122200742.GE8618@rdlg.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Fri Nov 22 14:12:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com
Cc: robert@rdlg.net


-- "Robert L. Harris" <Robert.L.Harris@rdlg.net>

>
>
> I'm trying to create a LVM for a system.  I partitioned my drives,
> rebooted and do my pvcreates but then it blows up on vgcreate.  The
> drives are both 18Gig, I've duplicated the partitions so they're
> identicle size even though they're going to be concats, not stripes.
>
> Here's a screen dump just made a bit readable.
>
> root@performance:/root# pvcreate /dev/sda2
> pvcreate -- physical volume "/dev/sda2" successfully created
>
> root@performance:/root# pvcreate /dev/sdb2
> pvcreate -- physical volume "/dev/sda2" successfully created
>
> root@performance:/root# pvscan -v
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- walking through all physical volumes found
> pvscan -- no valid physical volumes found
>
> performanc:/root# vgcreate -v lvm-vg1
> /dev/scsi/host0/bus0/target0/lun0/part2
> /dev/scsi/host0/bus0/target1/lun0/part2 vgcreate -- checking volume group

Any reason you use the devfs paths for the vgcreate and
devfsd for the pvcreate's?


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
