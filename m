From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] I broke my PVs!
Message-ID: <20021020104912.GD26167@percy.comedia.it>
References: <1035087242.1512.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1035087242.1512.4.camel@localhost.localdomain>
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
Date: Sun Oct 20 05:49:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Oct 19, 2002 at 11:14:02PM -0500, Austin Gonyou wrote:
>I have 3 disks, one 9GB and two 18GB scsi disks. I just re-installed my
>system with RH 8.0, and it didn't like that the two 18's weren't
>initialized, I guess I screwed up, cause I didn't think I was
>initializing them(since I told the installer not to), and instead ran
>fdisk and then saved without making partitions. 

what do you mean with initialized?
mke2fs? in this case you will find lovely ext2 superblock copies in the
middle of your data, but then you could salvage most of your data.

lost partition table? just recreate it, it is not destructive?

lost lvm metadata?
i s'pose you don't have a metadata backup handy,
how were your lv's laid out in your vg?

i never tried this on linux, but on hp-ux pvcreate, vgcreate and lvcreate weren't
destructive, it only touched disk metadata. so you could try pvcreate,
vgcreate and lvcreate.
DO A BACKUP OF YOUR RAW DISK DATA FIRST

L.
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
