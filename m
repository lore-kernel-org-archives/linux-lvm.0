From: "Steffen Koch" <Steffen.Koch@koch-enterprises.de>
In-Reply-To: <3F133985.C98897C@eti.net.gn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Very newbie question (LVM+NFS)
Message-Id: <E19cI4X-0000iu-00@mrelayng.kundenserver.de>
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
Date: Tue Jul 15 00:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

On Mon, 14 Jul 2003 23:15:17 +0000, ETI - Barry Irchad Kader wrote:

>#/etc/fstab (master server)
>192.168.1.2:/home/share    /mnt/192.168.1.2    nfs
>rsize=8192,wsize=8192,timeo=14
>192.168.1.3:/home/share    /mnt/192.168.1.3    nfs
>rsize=8192,wsize=8192,timeo=14
>192.168.1.4:/home/share    /mnt/192.168.1.4    nfs
>rsize=8192,wsize=8192,timeo=14
>192.168.1.5:/home/share    /mnt/192.168.1.5    nfs
>rsize=8192,wsize=8192,timeo=14
>192.168.1.6:/home/share    /mnt/192.168.1.6    nfs
>rsize=8192,wsize=8192,timeo=14
>
>I would like to know if it is possible, then, to use LVM in order to
>aggregate all these nfs partitions onto one single volume.
No, but you can put all these disks into one box and put all disks
together into one LV to use or reexport them.
