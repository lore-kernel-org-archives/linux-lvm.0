From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] extending a logical volume
Message-Id: <20020123103949.N960@lynx.adilger.int>
References: <E16Syml-0004V1-00@arwen.dev33.cvf>
    <Pine.LNX.4.10.10201221211580.24040-100000@pzat.meep.org>
    <20020122120317.Z4014@lynx.turbolabs.com>
    <E16TP0T-0001zV-00@arwen.dev33.cvf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16TP0T-0001zV-00@arwen.dev33.cvf>; from ppons@cvf.fr on Wed,
    Jan 23, 2002 at 04:08:09PM +0100
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
Date: Wed Jan 23 11:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Jan 23, 2002  16:08 +0100, Pierrick PONS wrote:
> To conclude on this subject, here is what I've done.
> I've extended my ext3 partition offline and not online.
> These commands are easy but maybe they will help some persons.
> They would have helped me ...
> 
> 
> lvextend -L+200 /dev/testlvm/testlv
> lvscan
> umount /dev/testlvm/testlv 
> 
> e2fsck -f /dev/testlvm/testlv 
> resize2fs -d -p /dev/testlvm/testlv
> mount /dev/testlvm/testlv /mnt/lvm  
> df -k

This is all done for you with the "e2fsadm" command included with the
LVM user tools (including e2fsck):

umount /dev/testlvm/testlv
e2fsadm -L+200 /dev/testlvm/testlv
mount /dev/testlvm/testlv

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
