From: Pasi Valminen <okun@photon.tky.hut.fi>
Message-ID: <20030411120517.GA1659@photon.tky.hut.fi>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Kernel won't release my logical volume
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
Date: Fri Apr 11 07:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, 

I have 2.4.20-openmosix kernel installed and LVM compiled into the
kernel. I have VG data in which I have /home and /var partitions as LVs.
Now I had some 700 MB of unpartitioned space in that VG I planned to use
for snapshots to backup my data. Of course this was a good idea, but bad
result.

What i did: I created a snapshot volume:

lvcreate -l 23 -s -n backup /dev/data/home

and mounted it into /mnt/bkp/home. Then I backed it up using rsync. All
was still fine. This is the good part, I've got backups.

Now I tried to remove the lv and all #$* broke loose. lvremove seg
faulted. I'm using LVM tools version 1.0.7. It did remove the special
device from the /dev/data but did not free the space allocated for it in
the VG. Also lot's of tools seem to hang and always because of the
following:

lvm_get_iop_version -- LEAVING with ret: 10

which according to man pages indicates
10 error removing logical volume from kernel

Now it seems my metadata is corrupted but I do have backups in
/etc/lvmconf. But you can't do vgcfgrestore while VG is active. And
vgchange will hang because of the above. So I take it, it won't reboot
either.

I have /home shared by nfs. Might that be the prob? I'm totally puzzled,
any help is appreciated. Please mail me since I don't subscribe the
list, for now. 
