From: Vincent AE Scott <linux.lvm@codex.net>
Subject: Re: [linux-lvm] Howto Make LVM Work With NBD/ENBD?
Message-Id: <20020426172506.GG28959@majestic.codex.net>
References: <00e301c1e7b2$4f501d90$f42cb69d@cerc.wvu.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00e301c1e7b2$4f501d90$f42cb69d@cerc.wvu.edu>
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
Date: Fri Apr 26 12:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ning Ye(nye@csee.wvu.edu)@Fri, Apr 19, 2002 at 10:55:45AM -0400:
> Hi!,
> 
>     I want to make them work together, which makes me crazy these days.  
> 
>     I can initialize the disks and partitions exported by ENBD, but when trying to create a volume group on it, vgcreate fails.
> # vgcreate my_volume /dev/ndb
> vgcreate -- ERROR "pv_read(): read" reading physical volumes
>     After examine the debug output, it looks to me lvm trying to enumerate all physical disks present to the system.  These disks include SCSI disks(sda...), IDE disks(hda...) and loops(loop0...).  However, the LVM will not recognize the exported disk as a physical one.
> 
>     Did any one ever make it work before?  I would like to know before I am trying to look into the code.  Combining these two great packages would be wonderful.  But how?  Help needed.  Thanks.


hmm, YMMV, but have you tried using the long devfs names instead of the
older/original short names?

i.e.

/dev/ide/host0/bus0/target0/lun0/part1

instead of

/dev/hda1

this sounds like a problem i encountered recently...


-- 
PGP key:  http://codex.net/pgp/pgp.asc

 Cannot find REALITY.SYS. Universe halted.
