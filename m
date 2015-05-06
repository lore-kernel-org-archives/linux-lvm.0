Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t46IFLNY003664
	for <linux-lvm@redhat.com>; Wed, 6 May 2015 14:15:21 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t46IFJ1J016728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 6 May 2015 14:15:20 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id A558A20FD7
	for <linux-lvm@redhat.com>; Wed,  6 May 2015 14:15:19 -0400 (EDT)
Message-Id: <1430936119.4184346.263587013.215904AE@webmail.messagingengine.com>
From: Kyle Manna <kyle@kylemanna.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 06 May 2015 11:15:19 -0700
Subject: [linux-lvm] lvchange seg faults after switching cache policy
	mq->cleaner->mq
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
To: linux-lvm@redhat.com

Hi,

I (attempted to) change the cache policy on a LV to write the changes
out to the disk.

# lvchange --cachepolicy cleaner vg0/home

Verified the expected setting with:

# lvs -o +cache_policy,cache_settings vg0/home
  LV   VG   Attr       LSize Pool     Origin       Data%  Meta%  Move
  Log Cpy%Sync Convert Cache Policy Cache Settings
  home vg0  Cwi-aoC--- 2.61t [cache0] [home_corig] 100.00 13.25         
   0.00             cleaner

After doing some tasks (i.e. reflashing the firmware of my broken
Samsung 840 EVO), I wanted to re-enable the mq cache policy with:

# lvchange --cachepolicy mq vg0/home

However, now lvchange segmentation faults on me.  I started with lvm2 on
Arch Linux at version 2.02.116-1.  I just compiled the git head
(75aa3e951f2) and still have the seg fault.

Recompiled with debug flags and have this stack trace:

#0  0x00007ffff756c8ef in _clone_config_value (mem=0x5555559543a0,
v=0x0) at libdm-config.c:1261
#1  0x00007ffff756cfde in _override_path (path=0x555555954330
"/policy_settings", node=0x555555983e18, baton=0x555555997420) at
libdm-config.c:1343
#2  0x00007ffff756d1e3 in _enumerate (path=0x7ffff7580d2a "",
cn=0x555555983e18, cb=0x7ffff756cf08 <_override_path>,
baton=0x555555997420) at libdm-config.c:1360
#3  0x00007ffff756d36b in dm_config_flatten (cft=0x55555594ae60) at
libdm-config.c:1382
#4  0x00005555555f5bfc in lv_cache_setpolicy (lv=0x5555559830b0,
policy=0x55555597a6d0) at metadata/cache_manip.c:417
#5  0x000055555557bb62 in _lvchange_cachepolicy (cmd=0x555555900000,
lv=0x5555559830b0) at lvchange.c:685
#6  0x000055555557d736 in _lvchange_single (cmd=0x555555900000,
lv=0x5555559830b0, handle=0x555555940558) at lvchange.c:1102
#7  0x00005555555aa61f in process_each_lv_in_vg (cmd=0x555555900000,
vg=0x555555982b80, arg_lvnames=0x7fffffffdbd0, tags_in=0x7fffffffdcc0,
stop_on_error=0, 
    handle=0x555555940558, process_single_lv=0x55555557c836
    <_lvchange_single>) at toollib.c:2072
#8  0x00005555555aaec0 in _process_lv_vgnameid_list (cmd=0x555555900000,
flags=1048576, vgnameids_to_process=0x7fffffffdc80,
arg_vgnames=0x7fffffffdcb0, 
    arg_lvnames=0x7fffffffdca0, arg_tags=0x7fffffffdcc0,
    handle=0x555555940558, process_single_lv=0x55555557c836
    <_lvchange_single>) at toollib.c:2280
#9  0x00005555555ab27b in process_each_lv (cmd=0x555555900000, argc=1,
argv=0x7fffffffdee0, flags=1048576, handle=0x555555940558, 
    process_single_lv=0x55555557c836 <_lvchange_single>) at
    toollib.c:2356
#10 0x000055555557e136 in lvchange (cmd=0x555555900000, argc=1,
argv=0x7fffffffdee0) at lvchange.c:1260
#11 0x0000555555597bca in lvm_run_command (cmd=0x555555900000, argc=1,
argv=0x7fffffffdee0) at lvmcmdline.c:1521
#12 0x000055555559921e in lvm2_main (argc=4, argv=0x7fffffffdec8) at
lvmcmdline.c:1985
#13 0x00005555555b6cc0 in main (argc=4, argv=0x7fffffffdec8) at lvm.c:21
(gdb) frame 1
#1  0x00007ffff756cfde in _override_path (path=0x555555954330
"/policy_settings", node=0x555555983e18, baton=0x555555997420) at
libdm-config.c:1343
1343            if (!(target->v = _clone_config_value(cft->mem,
node->v)))

More readable @ https://gist.github.com/fb7a054e6c3f77332b85

I didn't have enough time to dig in deeper, but the v=0 in the
_clone_config_value() is where things appear to go off the rails.

Hoping this means more to someone who is more familiar with this code.

I was able to recover with the vgcfgrestore tool.

Thanks,
- Kyle
