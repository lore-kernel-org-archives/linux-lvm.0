From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: md and lvm
Message-ID: <20020530173923.GA2502@colombina.comedia.it>
References: <OF812C20AD.43539AFD-ON48256BC9.0028280B@legend.com.cn>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF812C20AD.43539AFD-ON48256BC9.0028280B@legend.com.cn>
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
Date: Thu May 30 12:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lilha@legend.com.cn
Cc: linux-lvm@sistina.com

On Thu, May 30, 2002 at 04:31:59PM +0800, lilha@legend.com.cn wrote:
> > md1 : active raid1 hda9[1]
> >       272960 blocks [2/1] [_U]
> is this a bad disk???
> 
> yes. md1 is bad, but I have delete the inforamtion about md1 in the file
> (/etc/raidtab)
> and change the partition type to 83.
> after reboot the machine, i change the partion type to FD, and reboot
> again.
> I dont't know why the md1 still can be find and how to delete it.
> 
get mdadm from http://www.cse.unsw.edu.au/~neilb/source/mdadm/
and use the option --zero-superblock to wipe the superblock from
/dev/hda9

> > e2fsck 1.18, 11-Nov-1999 for EXT2 FS 0.5b, 95/08/09
> > The filesystem size (according to the superblock) is 338944 blocks
> > The physical size of the device is 236544 blocks
> > Either the superblock or the partition table is likely to be corrupt!
> > Abort<y>? no
> seems you have some problem with the filesystem in /dev/raid-lvm/lv_raid
> did you play at reducing it before?
> 
> yes, i use lvextend to extend it and then use lvreduce to reduce it, at
> last i use
> e2fsadm -L+1G /dev/raid-lvm/lv_raid

if you reduce an LV with lvreduce you must reduce the filesystem
BEFORE running lvreduce


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
