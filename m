Message-ID: <4D5901BB.1010600@redhat.com>
Date: Mon, 14 Feb 2011 10:19:39 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <4D54552E.6070202@Yahoo.com>
In-Reply-To: <4D54552E.6070202@Yahoo.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Cannot access logical volume (open count=1)
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Peter Flass <Peter_Flass@yahoo.com>

On 02/10/2011 09:14 PM, Peter Flass wrote:
> I'm truly sorry to bother the developers' list with this question, but 
> I've searched and can't find an ansewr that works.  A system crash seems 
> to have corrupted something in my fedora system.  I boot to a rescue CD 
> and look thru LVM.  The disk (sdb) has one vg and three lv's on it.  
> Call the vg vg_xxx, the lv's are lv_boot (ext3, I believe), lv_swap (no 
> fs) and lv_home (ext4).  I can't fsck (e2fsck) lv_home or do anything 
> else with it, LVM says it's open count=1 where the open count of the 
> other two lv's is zero.
> 
> I can't find who has it open.  /proc/mounts shows /dev/sdb1 mounted on 
> /media/usb0, when I umount  it (either by mount point or device) it 
> disappears, but the lv still shows open, and as a result I am unable to 
> do anything with it.  lsof also shows nothing open that resembles this 
> lv.  I can inactivate the other two lvs in this vg, but not lv_home.
> 
> What can I do to fix this problem?

What does "dmsetup ls --tree" look like?

E.g.:

$ sudo dmsetup ls --tree
tvg0-l0 (253:7)
 └─ (7:1)
bmr_vg1-swap (253:4)
 └─ (9:1)
luks-ca3de7ff-5487-4e9b-ac2b-846efc71b2e2 (253:5)
 └─bmr_vg0-data (253:2)
    └─ (9:2)
bmr_vg0-var (253:1)
 └─ (9:2)
luks-a48853af-19d8-4965-a346-d82ae4672b66 (253:6)
 └─bmr_vg0-home (253:3)
    └─ (9:2)
bmr_vg0-root (253:0)
 └─ (9:2)

Regards,
Bryn.
