Message-ID: <3FE22101.8020602@stercomm.com>
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Reclaim free space
References: <3FE21CA1.6040201@onsitetech.com>
In-Reply-To: <3FE21CA1.6040201@onsitetech.com>
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
Date: Thu Dec 18 15:51:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Ian Burrell wrote:
> How do I reclaim the free space when a logical volume is reduced?  I am 
> using a volume group on one physical volume and three logical volumes.
> 
> I wanted to split off /usr/local and give it some space from reducing 
> another volume.  I shrank the existing logical volume with "ext2fsadm". 
>  After, the volume group had the same amount of free space as before. I 
> went ahead and created the new LV in that free space but would like to 
> make it bigger.  Now "vgdisplay" shows the volume group as being 
> completely full.  Except the allocated space for the logical volumes are 
> less than the total space.

1. Shrink the filesystem (sounds like you've done this).

2. Shrink the lv (lvreduce)... be careful!!

3. Expand the filesystem to fill any gap (error) in the lvreduce.
