In-Reply-To: <20040430093051.GB5278@redhat.com>
References: <17E8B4A8-9A72-11D8-A52D-000A95BD189A@pacbell.net>
	<20040430093051.GB5278@redhat.com>
Mime-Version: 1.0 (Apple Message framework v613)
Message-Id: <DFBB7A68-9ACC-11D8-B2AA-000A95BD189A@pacbell.net>
Content-Transfer-Encoding: 7bit
From: Brian Zaugg <bzaugg@pacbell.net>
Date: Fri, 30 Apr 2004 10:36:12 -0700
Subject: [linux-lvm] Re: pvcreate_name_from_kdev_t no VALID PV
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mauelshagen@redhat.com
Cc: linux-lvm@redhat.com

Hello Heinz and fellow list members,

Earlier today, I posted with a problem with my PV's not being seen 
following a system crash. I've found the cause, but not a permanent 
fix. It looks like a bug to me. The system had a cd in its ide cdrom 
drive, but the cd was not mounted. When I removed the cd, I was able to 
pvscan, vgscan, and restore my previous vg configuration. No data loss; 
I'm very happy. But, I'm left wondering why/how an unmounted cd could 
cause LVM to fail to start. Should I report this as a bug to LVM? 
3ware? ide-scsi kernel module? Any suggestions appreciated.

-Brian

On Apr 30, 2004, at 2:30 AM, Heinz Mauelshagen wrote:

<SNIP>

> Don't have access to such 3ware HW here. Maybe they use /dev/Something/
> as the namespace to their devices in which case LVM1 needs extending in
> lvm_dir_cache.c and lvm_check_partitioned_dev.c.
>
> Please tell me if that is the case and the exact subdirectory they use
> and I'll provide a patch.
>
<SNIP>
