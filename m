From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
Message-Id: <20020111093859.B30751@colombina.comedia.it>
References: <200201020451.g024pPg00867@oss.sgi.com>
    <200201050212.TAA16774@cthulhu.turbolabs.com>
    <20020105142527.I12868@lynx.no> <E16Oh1M-0003UB-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16Oh1M-0003UB-00@hermes.sistina.com>; from
    ahead@bigpond.net.au on Fri, Jan 11, 2002 at 01:21:26AM +1000
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
Date: Fri Jan 11 02:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 11, 2002 at 01:21:26AM +1000, Adrian Head wrote:
> The problem now is that when I try to mount a ext3 snapshot using:
> mount /dev/HDA/SNAP /mnt/snapshot
> The kernel mounts the snapshot as ext2.  Is was not happening before the 
> patch and I was wondering if anyone thinks this is a problem.  As ext3 is 
> backward compatible with ext2 there doesn't seem to be any problems during my 
> testing with respect to standard file operations.  I can mount the snapshot 
> as ext3 if I use:
> mount -t ext3 /dev/HDA/SNAP /mnt/snapshot
this depends on the order the mount porgram tries to autodetect a filesystem
if the luser does not specify it. I don't have mount sources at hand
but AFAIR it reads /etc/filesystems, /proc/filesystems and then tries
an hardcoded list. you can modify /etc/filesystems to change the probe
order.
[you already got answers to the other issues]

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
