Message-Id: <3C5049C2.1080401@cgg.com>
From: Guillaume Duquesnay <gduquesnay@cgg.com>
MIME-Version: 1.0
Subject: [Re: [linux-lvm] VG lost, no lvmconf => Help ! ] Corrupted PV UUID
References: <3C4EDF1A.3000409@cgg.com> <20020124154339.A8972@sistina.com>
    <3C50250F.40209@cgg.com> <20020124171255.A9239@sistina.com>
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
Date: Thu Jan 24 11:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Heinz J . Mauelshagen wrote:

 > On Thu, Jan 24, 2002 at 04:15:27PM +0100, Guillaume Duquesnay wrote:
 >
 >
 > So, let's hack one in to hopefully make LVM happier.
 >
 > First preserve the metadata on sda1 and sda3 for recovery with:
 >
 > dd if=/dev/sda1 of=sda1.VGDA count=512 bs=1k dd if=/dev/sda3
 > of=sda3.VGDA count=512 bs=1k

done ;-)

 >
 > Backup sda[13].VGDA please.

on a snapshoted nfs.


 >
 >
 > echo "sahdgdgasjg21hxjn45jxJJ45aasdc3d"|dd of=/dev/sda3 obs=1
 > seek=44 count=32

I didn't remember enough C to calculate this offset ;-) !
Question : is it a pure random UUID, that uuid_fixer will propagate
wherever it is needed ?

 >
 > Run
 >
 > ./uuid_fixer /dev/sda1 /dev/sda3
 >
 > again. Retry vgscan afterwards.

uuid_fixer found the 2 PVs with their respective UUID,
when asked about writing in each file, i didn't find what it was about 
in the README, but i answered affirmative, and then normal termination.
But vgscan missed again my VG.

Some few uuid_fixer and failing scans later, i tried "no" to the mistery 
question of uuid_fixer, after what vgscan find up my "main" VG.

vgchange -ay, mounting, cfgbackup, lilo, etc., everything was working 
like a charm ! Either did the reboot, so i'm currently running with my 
lvm root partition.
Many thanks, many thanks, everything is fixed.

So I have only some informative question : what did uuid_fixer do, and 
what does the question mean ?


Guillaume
