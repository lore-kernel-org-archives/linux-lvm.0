From: me@vger.org
In-Reply-To: <Pine.LNX.4.21.0205301649250.20123-100000@kenny.worldonline.se>
Message-ID: <Pine.LNX.4.21.0205301706550.20123-100000@kenny.worldonline.se>
MIME-Version: 1.0
Subject: [linux-lvm] Re: Strange RAID2 behavier...
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
Date: Thu May 30 09:37:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lvm-devel@sistina.com, linux-lvm@sistina.com

Here is more info:
--------------
# /etc/init.d/raid2 start
Starting RAID devices: /dev/md0 /dev/md1 /dev/md2 /dev/md3
done.
# /etc/init.d/raid2 stop 
Stopping RAID devices: /dev/md0 /dev/md1 /dev/md2 /dev/md3
done.
# /etc/init.d/raid2 start
Starting RAID devices: /dev/md0 /dev/md1 /dev/md2 /dev/md3
done.
# modprobe lvm-mod
# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "data"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

# vgchange -ay
vgchange -- volume group "data" successfully activated

# mount /dev/data/lvol1 /mnt
# df
Filesystem           1k-blocks      Used Available Use%
Mounted on
/dev/data/lvol1      ********        20 ********   1% /mnt
# umount /mnt
# vgchange -an
vgchange -- volume group "data" successfully deactivated

# rmmod lvm-mod
# /etc/init.d/raid2 stop
Stopping RAID devices: /dev/md0 /dev/md1 /dev/md2: Device or resource busy
/dev/md3: Device or resource busy
done.
# cat /proc/mdstat 
Personalities : [linear] [raid0] [raid1] [raid5] [multipath] 

read_ahead 1024 sectors
md3 : active raid0 hdl1[1] hdh1[0]
      ******** blocks 4k chunks
      
md2 : active linear hdk1[0]
      ******** blocks 4k rounding
      
unused devices: <none>
# /etc/init.d/raid2 stop
Stopping RAID devices: /dev/md2: Device or resource busy
/dev/md3: Device or resource busy
done.
--------------

Going to switch to lvm-1.0.4 and try.

On Thu, 30 May 2002 me@vger.org wrote:

> No worry linux-kernel, this seams to be a lvm problem.
> 
> Hi linux-lvm,
> 
> In short, I got 4 md devices (md0-4) that I make one device with using
> lvm. When I'm going to shutdown this device it seams that lvm locks md2-3.
> 
> Booting linux without lvm there is no problem what so ever to start and
> stop the raid mds.
> 
> Also as you read the futher down, the reason I could stop md3 was because
> I hadnt used lvm yet that time and hadnt made any VGs or LVs or mounted
> them. Also, the way i stop lvm is as described in the documents "umount,
> vgchange -an".
> 
> Im using lvm-1.1rc-2, 2.4.19-pre9 and debian testing dist.
> 
> Im going to try running lvm as module and unloading the module after
> stopping the lvm VGs and see if it still locks the mds.
> 
> If you need more info, please send a mail.
> 
