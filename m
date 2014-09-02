Mime-Version: 1.0 (Apple Message framework v1085)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <1408896497.27190.12.camel@kurenai.local>
Date: Tue, 2 Sep 2014 16:49:55 -0500
Message-Id: <5211F372-B9BB-43A8-B569-AC1E3B077D15@redhat.com>
References: <1408896497.27190.12.camel@kurenai.local>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Does LVM RAID1 have TRIM support?
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
Content-Type: text/plain; charset="us-ascii"
To: oranenj+lvm@iki.fi, LVM general discussion and development <linux-lvm@redhat.com>


On Aug 24, 2014, at 11:08 AM, Jarkko Oranen wrote:

> Hello
> 
> Yesterday I experimented a bit with my RAID configuration on a pair of
> SSDs, and it seems that LVM's native RAID does not have TRIM support...
> At least, when I try to run fstrim manually, it complains even though
> issue_discards is enabled. Plain LVs on top of an MD RAID PV do work, of
> course.
> 
> Am I perhaps missing some configuration, or do RAID1 logical volumes
> simply not have support for TRIM yet? I'm running a fairly recent kernel
> (3.15.8) and lvm version says this:
> 
>  LVM version:     2.02.106(2) (2014-04-10)
>  Library version: 1.02.85 (2014-04-10)
>  Driver version:  4.27.0

TRIM is not yet supported in LVM RAID.  However, if MD has a solid TRIM implementation, it should be simple to enable it for LVM.  (This is because the MD kernel modules are used to perform RAID for LVM.  There is only a thin wrapper layer (linux/drivers/md/dm-raid.c) in device-mapper used to set-up the device.)

> As an aside, can anyone point me to documentation or other resources
> about the pros and cons of LVM native RAID1 setup (which I understand
> uses MD RAID internally?) vs. MD RAID PV + LVM. It seems I might be able
> to save some SSD space and only mirror the LVs I actually need to keep
> safe from crashes.

I don't know if there is a specific list to point to out there, but I can give you a couple pros/cons.
PRO:
- use one volume manager instead of two
- LVM is better suited to creating devices of varying sizes - leaving spare capacity for snapshots, etc

CONS:
- no trim support with RAID through LVM (although, I'm not sure of the state in MD)
- no reshaping (changing from one RAID type to another) capability in LVM RAID.

 brassow
