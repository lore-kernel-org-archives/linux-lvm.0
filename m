From: James Hawtin <oolon@ankh.org>
In-Reply-To: <26540000.1011646741@duke.wrkhors.com>
Message-Id: <Pine.LNX.4.10.10201220040080.20722-100000@pzat.meep.org>
MIME-Version: 1.0
Subject: [linux-lvm] Whats wrong with this picture?
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
Date: Mon Jan 21 18:47:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

--- Physical volume ---
PV Name               /dev/ide/host2/bus1/target0/lun0/part4
VG Name               sunset_vg
PV Size               11.24 GB / NOT usable 51.50 MB [LVM: 125.00 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                4
PE Size (KByte)       32768
Total PE              358
Free PE               0
Allocated PE          358
PV UUID               0jqg8y-LkA2-vZ1w-jHpv-cSY6-t7sh-BcmDS6

My PE size 32M yet my unusable space is > 32M 

I tested this with different PE sizes and found that the unusable space
reported is aways in the range >= 1PE and < 2PE

I would have expected it in the range >=0PE and <1PE

Why is this not so?

James
