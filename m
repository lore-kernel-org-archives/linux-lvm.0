From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] LVM System
Message-Id: <20020305013930.A5231@golem.blacknet.de>
References: <auto-000021223409@front2.mail.megapathdsl.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auto-000021223409@front2.mail.megapathdsl.net>;
    from anthony@AWMObjects.com on Mon, Mar 04, 2002 at 04:39:10PM -0500
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
Date: Mon Mar  4 18:39:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 04 '02 at 16:39, Anthony W. Marino wrote:
> LVM 1.x
good idea
> 3Ware 7800 Raid Controller
what do you want to go for? RAID5
> Maxtor 40GB harddrives
All IDE drives are about the same, but I'm running softraid5 with 4x60GB
and 6x80GB, all Maxtor
> XFS Journalling FS
I'm using ReiserFS and ext3 (both in production), and am about to move
from reiserFS to ext3. Except for special purpose (e.g. my MP3 base, and
an thousends off small files (1-10k) box) 

> SuSE 2.4.18+ Linux
IMHO, don't use SuSE, pick one of the real RPM based distributions.
If you want everything provided go for RedHat or Mandrake, if you want a
real server (and know how to compile your kernel) go for trustix.

Some more comments:
- don't use striping on RAID5. It is not going to work (well, if you
  have two RAID5 sets it will, but that's a waste of disk space)
- this ony appiles to my bad expirience with the 6xxx 3ware controllers:
  test wether softRAID with the linux kernel is not faster than the
  hardware RAID
  (well, you can not boot from softRAID as comfortable as you can from
   hardware RAID)
- install the 3ware tool, the 3dm is a deamon that is configurateable
  from a web page (only runs on localhost, and has (for sure) some
  security holes). It can send mails on errors, too.
  (AFAIR the install script is realy broken, don't run it, do it by
   hand)
- with a 2.4.xx kernel you do not need a special driver
- I've a 6800 for sale. i switched my home filebase over to 3 promise
  controllers. They can do powersaving while I'm at work.

Cu,
    Goetz.
