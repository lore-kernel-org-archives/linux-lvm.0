Message-ID: <3DC97C42.7080305@mp.pl>
From: Tomasz Francuz <tfrancuz@mp.pl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm oddities seen
References: <HMEIJJCJJMDMOBLPBABOMEHDCDAA.ej_external@bigfoot.com>
Content-Transfer-Encoding: 7bit
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
Date: Wed Nov  6 14:50:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>
>
>Can anyone explain this for me?  I added a new hard drive to my LVM and
>while lvdisplay of the LVM shows the full size of all disks/partitions in
>the LVM, df -k does not:
>
>[root@bergamo sbin]# lvscan
>lvscan -- ACTIVE            "/dev/lvm01/1" [176.76 GB]
>lvscan -- 1 logical volumes with 176.76 GB total in 1 volume group
>lvscan -- 1 active logical volumes
>
>[root@bergamo sbin]# lvdisplay /dev/lvm01/1
>--- Logical volume ---
>LV Name                /dev/lvm01/1
>VG Name                lvm01
>LV Write Access        read/write
>LV Status              available
>LV #                   1
># open                 1
>LV Size                176.76 GB
>Current LE             45251
>Allocated LE           45251
>Allocation             next free
>Read ahead sectors     120
>Block device           58:0
>
>
>
>[root@bergamo sbin]# df -k
>Filesystem           1k-blocks      Used Available Use% Mounted on
>/dev/hda6             10317796   3808332   5985348  39% /
>/dev/hda1                62193     17850     41132  31% /boot
>none                     95628         0     95628   0% /dev/shm
>/dev/lvm01/1         115382824  63615676  47078212  58% /mnt/lvm01.01
>
>
>So while lvm shows the lvm size to be 176.76G, df -k shows the filesystem to
>be about 115G.  What is happening with this?
>
>  
>
Probably you have to extend your filesystem. Make resize2fs 
/dev/lvm/yourvolumename.


>  
>
