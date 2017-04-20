References: <0b4ad0ce-ce85-ea8b-d540-cb978f4637ca@suse.com>
	<365141cd-0d3e-f8b2-0a55-7d0180071c24@suse.com>
From: Eric Ren <zren@suse.com>
Message-ID: <c277e116-41b2-f32e-4c3b-a1e5efb71c57@suse.com>
Date: Thu, 20 Apr 2017 16:06:17 +0800
MIME-Version: 1.0
In-Reply-To: <365141cd-0d3e-f8b2-0a55-7d0180071c24@suse.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] clvm: failed to activate logical volumes sometimes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: David Teigland <teigland@redhat.com>

Hi!

This issue can be replicated by the following steps:
1. setup two-node HA cluster with dlm and clvmd RAs configured;
2. prepare a shared disk through iscsi, named "sdb" for example;

3. execute lvm cmds on n1:
lvm2dev1:~# pvcreate /dev/sdb
Physical volume "/dev/sdb" successfully created
lvm2dev1:~ # vgcreate vg1 /dev/sdb
     Clustered volume group "vg1" successfully created
lvm2dev1:~ # lvcreate -l100%VG -n lv1 vg1
     Logical volume "lv1" created.
lvm2dev1:~ # lvchange -an vg1/lv1

4. disconnect shared iscsi disk on n2;
5. to activate vg1/lv1 on n1:
lvm2dev1:~ # lvchange -ay vg1/lv1
     Error locking on node UNKNOWN 1084783200: Volume group for uuid not found: 
TG0VguoR1HxSO1OPA0nk737FJSQTLYAMKV2M20cfttItrRnJetTZmKxtKs3a88Ri

6. re-connect shared disk on n2;
7. execute `clvmd -R` on n1; and then I can activate lv1 successfully.

In local mode, lvm will make a full scan on disks each time when lvmetad is disable. As we know,
lvmetad is also disable when clvm is in use, so that  device cache can not be refreshed 
automatically
when device is added or removed. We can solve this issue by executing "clvmd -R" manually. But,
in some auto scripts, it's boring to put "clvmd -R" before some lvm commands everywhere.

So, is there an option to enable full scan every time when lvm is invoked in cluster scenario?
Thanks in advance:)

Regards,
Eric

On 04/14/2017 06:27 PM, Eric Ren wrote:
> Hi!
>
> In cluster environment, lvcreate/lvchange may fail to activate logical volumes sometimes.
>
> For example:
>
> # lvcreate -l100%VG -n lv001 clustermd
>    Error locking on node a52cbcb: Volume group for uuid not found: 
> SPxo6WiQhEJWDFyeul4gKYX2bNDVEsoXRNfU3fI5TI9Pd3OrIEuIm8jGtElDJzEy
>    Failed to activate new LV.
>
> The log file for this failure is attached. My thoughts on this issue follows, for example 
> on two nodes:
> n1:
> ===
> #lvchange -ay vg/lv1
> ...
> clvmd will ask for peer daemon on n2
> to activate lv1 as well
>
> n2:
> ===
> lvm need to find lv1 and the PVs for lv1,
> in device cache which aims to avoid frequent scan all
> disks. But if the PV(s) might not be available
> in device cache, it responses n1 with errors....
>
> We found that 'clvmd -R' can be a workaround before activating LV, because
> what "clvmd -R" is to refresh device cache on every node as its commit message said:
> ===
> commit 13583874fcbdf1e63239ff943247bf5a21c87862
> Author: Patrick Caulfield <pcaulfie@redhat.com>
> Date:   Wed Oct 4 08:22:16 2006 +0000
>
>      Add -R switch to clvmd.
>      This option will instruct all the clvmd daemons in the cluster to reload their device 
> cache
> ==
>
> I think the reason why clvm doesn't refresh device cache every time before activating LV,
> is to avoid scanning all disks frequently.
>
> But, I'm not sure if I understand this issue correctly, will appreciate much if someone can
> help.
>
> Regards,
> Eric
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
