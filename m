Return-Path: <bcorsello@usa.net>
Date: Sun, 07 Jan 2001 14:53:40 -0500
From: Brad Corsello <bcorsello@usa.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-Path: bcorsello@usa.net
Message-ID: <0226f5953190711NYCSMTP3@nyc.rr.com>
Subject: [linux-lvm] Possible bug in vgcfgrestore?
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, lvm-bugs@sistina.com

I am trying to restore the config of a volume group with two physical volumes.
 I ran vgcfgrestore against each of the two PVs, which reported back that the
VG had been restored successfully.  However, when I run a vgscan, it reports
back that there are no volume groups.  Looking at the debug output of vgscan,
it appears that the uuid-list on each of the PVs has only one uuid in it, and
not two (as I think there should be?).  Specifically, the uuid-list on each PV
contains its own uuid, and not the uuid of the other PV.  (I verified that
fact by examining the first 10k of each of the PVs, and it's true -- after the
restore, each PV has only its own uuid in the uuid-list.)
Thus, vg_check_exist blows up with the following error:
<22> vg_check_exist -- before vg->pv_cur check with vg->pv_cur: 2  pv_count: 1
<22> vg_check_exist -- LEAVING with ret: -347 [LVM_EVG_CHECK_EXIST_PV_COUNT]

The debug outputs are too voluminous to post to the list, so I'll just post
links to the relevant files:

Output of vgscan -d			 -> http://home.nyc.rr.com/bcorsello/lvm/vgscandebug
Output of vgcfgrestore -d 	->
http://home.nyc.rr.com/bcorsello/lvm/lvmrestoredebug
Output of vgcfgrestore -ll	 ->  http://home.nyc.rr.com/bcorsello/lvm/vgconfig
First 10k of /dev/hdb1 			-> http://home.nyc.rr.com/bcorsello/lvm/hdb1
First 10k of /dev/hdb2			->  http://home.nyc.rr.com/bcorsello/lvm/hdb2

Is there any way I can restore the VG config successfully?  Any help would be
appreciated.

(BTW, the patch I applied to lvm.c is the one Jan posted to fix the kernel
oops on vgextend.  But the vgconfig file I'm trying to restore is from before
I vgextended with the patched module, so I think it's not relevant to the
present problem.)
