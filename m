From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Partitions on same Drive
Message-Id: <20020121214908.F22618@colombina.comedia.it>
References: <1011645757.7846.12.camel@desktop.athome.dyndns.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1011645757.7846.12.camel@desktop.athome.dyndns.org>;
    from Rene@athome.dyndns.org on Mon, Jan 21, 2002 at 09:42:37PM +0100
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
Date: Mon Jan 21 14:49:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

On Mon, Jan 21, 2002 at 09:42:37PM +0100, Rene Schumann wrote:
>    /dev/sdb1             1      4462  35840983+   c  Win95 FAT32 (LBA)
>    /dev/sdb2          4463      9730  42315210   8e  Linux LVM
>    I want to delete sdb1 vfat partition and use it as LVM space.
>    If i do a "pvcreate vg01 /dev/sdb1" it is ugly for performance because
>    there are 2 LVM Partions at one drive.
>    right?
>    If i do lvm partition on sdb1 and do a pvmove,
>    Can i resize sdb1 to fit the whole drive and after that lvm use this
>    full space?
you cannot resize a PV.
if you don't create striped LVs on the two partitions i see no
significant performance problem.

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
