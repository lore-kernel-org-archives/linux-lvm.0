Message-ID: <51A8C4EC.1010706@redhat.com>
Date: Fri, 31 May 2013 17:42:36 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <51A7BE6D.3090609@gmail.com>
	<1369952053.99499.YahooMailClassic@web181504.mail.ne1.yahoo.com>
	<CAEh524ZjZRizYoEimXg0OsLxz2kD8HLu2bqw2V2RbjYKdggVxw@mail.gmail.com>
	<CAEh524ZaPCWidwO6n8RukzDVBpWw9ENAu=X5gLysV-AopYRQag@mail.gmail.com>
	<FFA8D6D8-8C13-41AF-8AAD-A42E9999BD6A@oxeva.fr>
In-Reply-To: <FFA8D6D8-8C13-41AF-8AAD-A42E9999BD6A@oxeva.fr>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Fwd: file-based locking initialization failed after
	pvresize
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 31.5.2013 11:04, Gabriel Barazer napsal(a):
> Hi,
>
> Did you try booting off another system (e.g. live usb ) and restoring the LVM
> meta data ? If your root filesystem is still bootable, you can find a backup
> of the LVM metadata in /etc/lvm/backup, and then start over your data resizing
> procedure. Look for the vgcfgrestore command.
>
> The right procedure to resize a LV after growing a PV is :
> - adjust the partition table on sdb with fdisk, the simple way is deleting the
> partition table and creating a new one with the main partition having the same
> start offset (_very_ important)
> - THEN pvresize the device (no need to add any --setphysicalwhatever argument)
> - then lvresize, but if you want to be safe always check that the size you set
> is larger than the current volume size otherwise you can damage your data
> pretty bad. A good way to do this is to add a "+" in the lvresize command :
> lvresize -L +100G /device adds 100G to volume.
> - then run a filesystem resize command, depending on the filesystem used
> (xfs_growfs for XFS, resize2fs for ext4)

For couple years lvresize has the option '-r'  so it knows how to resize 
common filesystems (via fsadm script) - so it keeps the right order of 
commands (very important in case you are reducing size)

Zdenek
