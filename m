From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] pvcreate problems - can't find partition
Message-Id: <20011224085415.A13907@colombina.comedia.it>
References: <000201c18c33$1ee48cc0$0b00a8c0@homelan.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000201c18c33$1ee48cc0$0b00a8c0@homelan.org>; from
    ben@bens-house.org.uk on Mon, Dec 24, 2001 at 04:26:12AM -0000
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
Date: Mon Dec 24 01:52:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 24, 2001 at 04:26:12AM -0000, Ben Holness wrote:
> 				/dev/ide/host0/bus0/target0/lun0/part4           372      7753  55807920
> 8e  Linux LVM

...

> [root@firewall root]# pvcreate -v /dev/hda4
> pvcreate -- locking logical volume manager
> pvcreate -- checking physical volume name "/dev/hda4"
> pvcreate -- getting physical volume size
> pvcreate -- device "/dev/hda4" doesn't exist

oh yeah,
there is a problem in lvm when devfs is enabled
it only sees devices with long devfs name
try using:
pvcreate -v /dev/ide/host0/bus0/target0/lun0/part4

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
