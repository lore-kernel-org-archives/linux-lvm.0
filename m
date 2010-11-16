Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAG4ArtW010454
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 23:10:53 -0500
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.122])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAG4AQd8010742
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 23:10:39 -0500
Message-ID: <4CE20431.1050306@cfl.rr.com>
Date: Mon, 15 Nov 2010 23:10:25 -0500
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Volume activation leaving stuck process after lvconvert
	--merge
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

I've been testing out the new snapshot merge support and I have noticed 
that after running an lvconvert --merge on the root, and rebooting so it 
can take effect, an instance of lvm remains running in some sort of 
stuck state well after the snapshot merge completes.  During boot, udev 
runs vgchange -a y twice, once for each detected physical volume.  The 
first one seems to perform the merge, and exit normally once it is 
complete, and the second one gets stuck, never exiting, but periodically 
touching the physical volumes.

I have just attached to the stuck process with gdb and run a backtrace, 
and I see the following call stack:

(gdb) bt
#0  0x00007fefd0efd1f0 in __nanosleep_nocancel () at 
../sysdeps/unix/syscall-template.S:82
#1  0x00007fefd0efd080 in __sleep (seconds=<value optimized out>) at 
../sysdeps/unix/sysv/linux/sleep.c:138
#2  0x0000000000423d9d in _sleep_and_rescan_devices 
(parms=0x7fff9ecc4ee0) at polldaemon.c:166
#3  0x0000000000423f9e in _wait_for_single_lv (cmd=0x1e6f048, 
name=0x7fff9ecc4f50 "faldara/maverick", uuid=0x7fff9ecc4f70 
"acsUzpv0JsQz67gkbyB4nZK2hPXXRfaxvAR0uU93YO1fe11WwFSICRDjLiP08caE", 
parms=0x7fff9ecc4ee0) at polldaemon.c:221
#4  0x00000000004242d7 in poll_daemon (cmd=0x1e6f048, 
name=0x7fff9ecc4f50 "faldara/maverick", uuid=0x7fff9ecc4f70 
"acsUzpv0JsQz67gkbyB4nZK2hPXXRfaxvAR0uU93YO1fe11WwFSICRDjLiP08caE", 
background=1, lv_type=0, poll_fns=0x6dc880, progress_title=0x4a8869 
"Merged") at polldaemon.c:325
#5  0x000000000041491d in lvconvert_poll (cmd=0x1e6f048, lv=0x1e99110, 
background=1) at lvconvert.c:492
#6  0x000000000042e752 in lv_spawn_background_polling (cmd=0x1e6f048, 
lv=0x1e99110) at toollib.c:1328
#7  0x000000000042feb6 in _activate_lvs_in_vg (cmd=0x1e6f048, 
vg=0x1e98c18, activate=0) at vgchange.c:148
#8  0x0000000000430283 in _vgchange_available (cmd=0x1e6f048, 
vg=0x1e98c18) at vgchange.c:234
#9  0x0000000000430dea in vgchange_single (cmd=0x1e6f048, 
vg_name=0x1e92678 "faldara", vg=0x1e98c18, handle=0x0) at vgchange.c:507
#10 0x000000000042c084 in _process_one_vg (cmd=0x1e6f048, 
vg_name=0x1e92678 "faldara", vgid=0x1e92630 
"acsUzpv0JsQz67gkbyB4nZK2hPXXRfax", tags=0x7fff9ecc5230, 
arg_vgnames=0x7fff9ecc5240, flags=0, handle=0x0, ret_max=1, 
process_single_vg=0x430b51 <vgchange_single>) at toollib.c:493
#11 0x000000000042c468 in process_each_vg (cmd=0x1e6f048, argc=0, 
argv=0x7fff9ecc5498, flags=0, handle=0x0, process_single_vg=0x430b51 
<vgchange_single>) at toollib.c:575
#12 0x0000000000431369 in vgchange (cmd=0x1e6f048, argc=0, 
argv=0x7fff9ecc5498) at vgchange.c:603
#13 0x000000000041ef4c in lvm_run_command (cmd=0x1e6f048, argc=0, 
argv=0x7fff9ecc5498) at lvmcmdline.c:1093
#14 0x000000000041fe88 in lvm2_main (argc=3, argv=0x7fff9ecc5480) at 
lvmcmdline.c:1450
#15 0x0000000000438770 in main (argc=4, argv=0x7fff9ecc5478) at lvm.c:21

If I had to guess from that, it looks like both processes begin polling 
for the merge to complete, the first eventually sees it, but the second 
is stuck waiting forever.  This comment I noticed seems relevant:

/*
* FIXME Sleeping after testing, while preferred, also works around
* unreliable "finished" state checking in _percent_run.  If the
* above _check_lv_status is deferred until after the first sleep it
* may be that a polldaemon will run without ever completing.
*
* This happens when one snapshot-merge polldaemon is racing with
* another (polling the same LV).  The first to see the LV status
* reach the "finished" state will alter the LV that the other
* polldaemon(s) are polling.  These other polldaemon(s) can then
* continue polling an LV that doesn't have a "status".
*/

Anyone have any ideas on how to fix this, or at least help me better 
understand the problem?
