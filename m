Message-ID: <013101c293a8$fd403eb0$4700a8c0@bibixp>
From: =?iso-8859-1?Q?S=E9bastien_GALLET?= <sgallet@ibourgogne.net>
References: <20021122200742.GE8618@rdlg.net>
Subject: Re: [linux-lvm] problem with vgcreate
MIME-Version: 1.0
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
Date: Sun Nov 24 05:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

----- Original Message ----- 
From: "Robert L. Harris" <Robert.L.Harris@rdlg.net>
To: <Linux-LVM@Sistina.com>
Cc: <robert@rdlg.net>
Sent: Friday, November 22, 2002 9:07 PM
Subject: [linux-lvm] problem with vgcreate


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
Sure of that ???                               ^^^^

...
