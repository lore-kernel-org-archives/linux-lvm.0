Message-ID: <3E8F471D.3030105@comedia.it>
From: Luca Berra <bluca@comedia.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Unable to create a physical volume on a whole disk
References: <001a01c2fb93$bdef8330$240b892c@pe1mhp.ampr.org>
In-Reply-To: <001a01c2fb93$bdef8330$240b892c@pe1mhp.ampr.org>
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
Date: Sat Apr  5 15:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Jan H. van Gils wrote:
> 	Hi,
> 
> Thanks for reading this message.
> 
> The following is the case, I would like to create a pv on a whole disk
> but pvcreate gives me the message that there is a "partition table" on
> the
> disk.
> 
> I removed the partition table with "dd if=/dev/zero of=/dev/hdb bs=512
> count=1"
> The fdisk command shows me that there is no partion table but pvcreate
> tells me
> different.

check if kernel has seen a partition during boot (cat /proc/partition)
in this case you either have to issue

blockdev --rereadpt /dev/hdb
or reboot

L.
-- 
Luca Berra -- bluca@comedia.it
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
