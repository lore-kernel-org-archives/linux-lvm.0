From: Marc MERLIN <marc_lvm@merlins.org>
Subject: Re: [linux-lvm] vgchange -a y /dev/System fails
Message-Id: <20020201210928.GO8651@merlins.org>
References: <20020125233533.GK26045@merlins.org>
    <20020128104258.A24830@sistina.com> <20020129215738.GA8651@merlins.org>
    <20020130131205.A3769@sistina.com> <20020131030417.GN8651@merlins.org>
    <20020131121417.A9764@sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020131121417.A9764@sistina.com>
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
Date: Fri Feb  1 15:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 31, 2002 at 12:14:17PM +0100, Heinz J . Mauelshagen wrote:
> > -> My BigAssLVMRaid VG is gone :-(
> > 
> > Did I just lose my data?
> 
> If you really tried all your  metadata backups unsuccessfully, I am afraid
> so  :-(  

I tried other ones, but every time, I'm getting:
vgcfgrestore -- VGDA for "BigAssLVMRaid" successfully restored to physical
volume "/dev/rd/disc0/part7"
vgcfgrestore -- you may not have an actual backup of restored volume group
"BigAssLVMRaid"

Am I supposed to give a special flag to vgcfgrestore, or maybe pvcreate?
(I did not use the default physicalextentsize)

As a reminder, I am currently running this command:
FILE=/etc/lvmconf/BigAssLVMRaid.conf.2.old; vgcfgrestore -f $FILE -n BigAssLVMRaid -ll; read a; pvcreate -yff `cat /tmp/partlist`; for pv in `cat /tmp/partlist `; do vgcfgrestore -f $FILE -n BigAssLVMRaid $pv; done; vgscan

Short of all this, can I re-create the VG the same way I did the first
time, and hope to get my filesytem again if I recreate the same LVs?
(like I can do with software raid)

This VG was working fine before I restored the other one (active and all)

> Some users reported snapshot problems with the recent 2.4.x kernels.  They
> are not  100% reliable  due to VM  issues being sorted  out by  the kernel
> community hopefully which will hopefully be integrated in 2.4.18.

Ok. I guess I'll know to steer clear  from snapshots in the meantime, but if
LVM doesn't even allow  me to recover a VG that  hasn't been overwriten with
random data, I don't know how much data I'm willing to trust to it...

Either way, thanks for your help.

Marc
-- 
Microsoft is to operating systems & security ....
                                      .... what McDonalds is to gourmet cooking
  
Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key
