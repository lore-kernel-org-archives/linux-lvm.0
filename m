From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Whats wrong with this picture?
Message-Id: <20020121193613.J4014@lynx.turbolabs.com>
References: <26540000.1011646741@duke.wrkhors.com>
    <Pine.LNX.4.10.10201220040080.20722-100000@pzat.meep.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.10.10201220040080.20722-100000@pzat.meep.org>;
    from oolon@ankh.org on Tue, Jan 22, 2002 at 12:45:23AM +0000
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
Date: Mon Jan 21 20:37:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Hawtin <oolon@ankh.org>
Cc: linux-lvm@sistina.com

On Jan 22, 2002  00:45 +0000, James Hawtin wrote:
> --- Physical volume ---
> PV Name               /dev/ide/host2/bus1/target0/lun0/part4
> VG Name               sunset_vg
> PV Size               11.24 GB / NOT usable 51.50 MB [LVM: 125.00 KB]
> PV#                   2
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                4
> PE Size (KByte)       32768
> Total PE              358
> Free PE               0
> Allocated PE          358
> PV UUID               0jqg8y-LkA2-vZ1w-jHpv-cSY6-t7sh-BcmDS6
> 
> My PE size 32M yet my unusable space is > 32M 
> 
> I tested this with different PE sizes and found that the unusable space
> reported is aways in the range >= 1PE and < 2PE
> 
> I would have expected it in the range >=0PE and <1PE
> 
> Why is this not so?

Because the Sistina folks changed it in a recent tools release to have
a _full_ empty PE available for future expansion.  IMHO that is a bit
of a waste, especially if you have large PEs.  I would much rather that
it reserve some minimum amount of free space (e.g. 4MB or whatever) and
then it doesn't need to waste so much.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
