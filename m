Message-ID: <3F11153B.8080909@portrix.net>
From: Jan Dittmer <j.dittmer@portrix.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2, extending a physical volume
References: <3F0A9604.5000101@portrix.net> <20030709100320.A17130@sistina.com> <3F1078F9.9050608@portrix.net> <20030713005734.G23240@sistina.com>
In-Reply-To: <20030713005734.G23240@sistina.com>
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
Date: Sun Jul 13 03:17:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Heinz J . Mauelshagen wrote:
> On Sat, Jul 12, 2003 at 11:09:13PM +0200, Jan Dittmer wrote:
> 
>>Hi,
>>
>>would this be a reasonable course of action?
>>
>>vgcfgbackup myraid
>>pvcreate -yff -u wZQg66-cWrF-VDi5-GcRN-aYVg-RQQ3-PPm5K5 /dev/md0
>>`take the size pvcreate reports and change the backup file accordingly`
>>vgcfgrestore myraid
> 
> 
> Yes, this is the workaround.
> (vgcfgbackup shouldn't be necessary though)
>

Being on the careful side here (don't want to restore 300GB of data).
pvdisplay reports (after pvcreate):
--- NEW Physical volume ---
   PV Name               /dev/md0
   VG Name
   PV Size               447.15 GB
   Allocatable           NO
   PE Size (KByte)       0
   Total PE              0
   Free PE               0
   Allocated PE          0
   PV UUID               wZQg66-cWrF-VDi5-GcRN-aYVg-RQQ3-PPm5K5

So how do I get the PEs? Can I also create a new Volumegroup without damaging 
anything? Or is there another way to get the total/free PEs?

Thanks for the insight,

Jan



-- 
Linux rubicon 2.5.75-mm1-jd10 #1 SMP Sat Jul 12 19:40:28 CEST 2003 i686
