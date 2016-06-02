References: <574CB690.5030401@partidopirata.com.ar>
	<dc632a53-2e8a-651e-5c95-fcf467d6628d@redhat.com>
	<574D8EE6.8020903@partidopirata.com.ar>
From: Ondrej Kozina <okozina@redhat.com>
Message-ID: <fadf6004-73b7-ebd6-035f-9167764ff7a8@redhat.com>
Date: Thu, 2 Jun 2016 15:22:19 +0200
MIME-Version: 1.0
In-Reply-To: <574D8EE6.8020903@partidopirata.com.ar>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [dm-crypt] LVM on LUKS: volumes missing
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
Cc: fauno@partidopirata.com.ar

On 05/31/2016 03:17 PM, fauno wrote:
>
> #libdm-config.c:863       Setting activation/monitoring to 0
> #lvmcmdline.c:1093         Processing: pvscan -vvvv --cache
> /dev/mapper/system
> #lvmcmdline.c:1096         O_DIRECT will be used
> #libdm-config.c:799       Setting global/locking_type to 1
> #libdm-config.c:799       Setting global/wait_for_locks to 1
> #locking/locking.c:242       File-based locking selected.
> #libdm-config.c:768       Setting global/locking_dir to /run/lock/lvm
> #libdm-config.c:863       Setting global/prioritise_write_locks to 1
> #locking/file_locking.c:236       Locking /run/lock/lvm/P_global RB
> #locking/file_locking.c:141         _do_flock /run/lock/lvm/P_global:aux WB
> #locking/file_locking.c:51         _undo_flock /run/lock/lvm/P_global:aux
> #locking/file_locking.c:141         _do_flock /run/lock/lvm/P_global RB
> #pvscan.c:150     Using physical volume(s) on command line
> #device/dev-cache.c:347         /dev/mapper/system: Added to device cache
> #locking/file_locking.c:74       Unlocking /run/lock/lvm/P_global
> #locking/file_locking.c:51         _undo_flock /run/lock/lvm/P_global
>   Command failed with status code 5.

This is very strange pvscan -vvvv output. Reading upstream lvm2 code, it 
doesn't make much sense to me. Most notably I can't see full error path. 
Could it be that pvscan -vvvv output was cut off somehow?

Regards
O.
