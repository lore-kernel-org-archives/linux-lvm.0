Date: Tue, 19 May 2020 11:08:59 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200519160859.GC8902@redhat.com>
References: <CABZYMH53DVpN0mPrrEacDedyyX-fdi4+QH7-hHc6Fvtjm8akUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABZYMH53DVpN0mPrrEacDedyyX-fdi4+QH7-hHc6Fvtjm8akUg@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] sanlock stuck while getting VGLK
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
Content-Transfer-Encoding: 7bit
To: Damon Wang <damon.devops@gmail.com>
Cc: sanlock-devel@lists.fedorahosted.org, linux-lvm@redhat.com

On Tue, May 19, 2020 at 09:31:16PM +0800, Damon Wang wrote:
> Hi,
> 
> I got a wired case recently with a 24-nodes sanlock cluster recently.
> One sanlock process stuck with getting VGLK since it thinks there are
> two live host using VGLK shared lock, here is sanlock log from this
> host(host_id 19): https://pastebin.com/zJubYLRv
> 
> I find important messages:

Hi, thanks for isolating the relevant portions of the debug log.

>     "2020-05-14 21:28:51 2018540 [14765]: r857 clear_dead_shared
> host_id 61 gen 1 alive"
>     "2020-05-14 21:28:51 2018540 [14765]: r857 clear_dead_shared
> host_id 94 gen 1 alive"
>     "2020-05-14 21:28:52 2018541 [14764]: r858 clear_dead_shared
> host_id 61 gen 1 alive"
>     "2020-05-14 21:28:52 2018541 [14764]: r858 clear_dead_shared
> host_id 94 gen 1 alive"
>     "2020-05-14 21:28:53 2018542 [14765]: r859 clear_dead_shared
> host_id 61 gen 1 alive"
>     "2020-05-14 21:28:53 2018542 [14765]: r859 clear_dead_shared
> host_id 94 gen 1 alive"
>     "2020-05-14 21:28:54 2018543 [14764]: r860 clear_dead_shared
> host_id 61 gen 1 alive"
>     "2020-05-14 21:28:54 2018543 [14764]: r860 clear_dead_shared
> host_id 94 gen 1 alive"
>     "2020-05-14 21:28:55 2018544 [14765]: r861 clear_dead_shared
> host_id 61 gen 1 alive"
>     "2020-05-14 21:28:55 2018544 [14765]: r861 clear_dead_shared
> host_id 94 gen 1 alive"

So far this looks like sanlock is working correctly.  At this point it
would have been interesting to look for any lvm commands on 61 & 94 that
might be holding this VGLK, or evidence of lvm commands that might have
failed to release the VGLK.  lvmlockctl -i / -d would help with that.

> So I try to find out what happend to host_id 61 and host_id 94, it
> seems both two hosts tried to acquire VGLK and then released, though
> with long time.
> 
> full log of host_id 61: https://pastebin.com/zDWQAtHE
>     2020-05-14 20:23:03 2545197 [33739]: cmd_acquire 6,16,33743 ci_in 6 fd 16 count 1 flags 9
>     2020-05-14 20:23:03 2545197 [33739]: s5:r1044 resource lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:69206016:SH for 6,16,33743
>     2020-05-14 20:23:03 2545197 [33739]: r1044 paxos_acquire begin e 0 0
>     2020-05-14 20:23:03 2545197 [33739]: r1044 leader 6067 owner 36 2 0 dblocks 35:12132036:12132036:36:2:2099201:6067:1,
>     2020-05-14 20:23:03 2545197 [33739]: r1044 paxos_acquire leader 6067 owner 36 2 0 max mbal[35] 12132036 our_dblock 12096061 12096061 61 1 2537794 6049
>     2020-05-14 20:23:03 2545197 [33739]: r1044 paxos_acquire leader 6067 free
>     2020-05-14 20:23:03 2545198 [33739]: r1044 acquire_disk rv 1 lver 6068 at 2545198
>     2020-05-14 20:23:03 2545198 [33739]: r1044 write_host_block host_id 61 flags 1 gen 1 dblock 12134061:12134061:61:1:2545198:6068:RELEASED.
>     2020-05-14 20:23:03 2545198 [33739]: r1044 paxos_release leader 6068 owner 61 1 2545198
>     2020-05-14 20:23:03 2545198 [33739]: cmd_acquire 6,16,33743 result 0 pid_dead 0
>     2020-05-14 20:23:03 2545198 [33740]: cmd_get_lvb ci 8 fd 20 result 0 res lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK

That log section shows the shared VGLK being acquired for host_id 61.

>     2020-05-14 20:23:03 2545198 [33739]: cmd_acquire 6,16,33743 ci_in 6 fd 16 count 1 flags 8
>     2020-05-14 20:23:03 2545198 [33739]: s5:r1045 resource lvm_fc261665e94c4d0f8341e254398e7ed5:lL0kHh-CZ1i-jtMi-1qHO-ykfR-6nmu-Gk0rES:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:104857600 for 6,16,33743
>     2020-05-14 20:23:03 2545198 [33739]: r1045 paxos_acquire begin a 0 0
>     2020-05-14 20:55:05 2547119 [33740]: r1045 paxos_release leader 10 owner 61 1 2545198
>     2020-05-14 20:55:05 2547119 [33740]: r1045 release_token done r_flags 8
>     2020-05-14 20:55:05 2547119 [33740]: cmd_release 6,16,33743 result 0 pid_dead 0 count 1

That log section shows an LV lock (r1045) being released.

I'm not seeing a log of the VGLK (r1044) being released, so perhaps the
VGLK is still held by lvmlockd (either because it failed to release the
VGLK or because there's some long running lvm command holding it.)

> useful log, it's similar to host_id 60, but shorter time to release:
> 
>     2020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,16,11206 ci_in 6 fd 16 count 1 flags 9
>     2020-05-14 20:01:20 8414771 [11203]: s5:r3021 resource lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:69206016:SH for 6,16,11206
>     2020-05-14 20:01:20 8414771 [11203]: r3021 paxos_acquire begin e 0 0
>     2020-05-14 20:01:20 8414771 [11203]: r3021 leader 6063 owner 36 2 0 dblocks 35:12124036:12124036:36:2:2097966:6063:1,
>     2020-05-14 20:01:20 8414771 [11203]: r3021 paxos_acquire leader 6063 owner 36 2 0 max mbal[35] 12124036 our_dblock 11840094 11840094 94 1 8325309 5921
>     2020-05-14 20:01:20 8414771 [11203]: r3021 paxos_acquire leader 6063 free
>     2020-05-14 20:01:20 8414771 [11203]: r3021 acquire_disk rv 1 lver 6064 at 8414771
>     2020-05-14 20:01:20 8414771 [11203]: r3021 write_host_block host_id 94 flags 1 gen 1 dblock 12126094:12126094:94:1:8414771:6064:RELEASED.
>     2020-05-14 20:01:20 8414771 [11203]: r3021 paxos_release leader 6064 owner 94 1 8414771
>     2020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,16,11206 result 0 pid_dead 0
>     2020-05-14 20:01:20 8414771 [11202]: cmd_get_lvb ci 8 fd 20 result 0 res lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK
>     2020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,16,11206 ci_in 6 fd 16 count 1 flags 8

That log section shows the shared VGLK being acquired for host_id 94.
Again, there's no logging showing the VGLK being released.

>     2020-05-14 20:01:20 8414771 [11203]: s5:r3022 resource lvm_fc261665e94c4d0f8341e254398e7ed5:lL0kHh-CZ1i-jtMi-1qHO-ykfR-6nmu-Gk0rES:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:104857600:SH for 6,16,11206
>     2020-05-14 20:01:20 8414771 [11203]: r3022 paxos_acquire begin e 0 0
>     2020-05-14 20:01:20 8414771 [11203]: r3022 leader 8 owner 36 2 0 dblocks 35:14036:14036:36:2:1566014:8:1,
>     2020-05-14 20:01:20 8414771 [11203]: r3022 paxos_acquire leader 8 owner 36 2 0 max mbal[35] 14036 our_dblock 0 0 0 0 0 0
>     2020-05-14 20:01:20 8414771 [11203]: r3022 paxos_acquire leader 8 free
>     2020-05-14 20:01:20 8414771 [11203]: r3022 acquire_disk rv 1 lver 9 at 8414771
>     2020-05-14 20:01:20 8414771 [11203]: r3022 write_host_block host_id 94 flags 1 gen 1 dblock 16094:16094:94:1:8414771:9:RELEASED.
>     2020-05-14 20:01:20 8414771 [11203]: r3022 paxos_release leader 9 owner 94 1 8414771
>     2020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,16,11206 result 0 pid_dead 0
>     ... ...
>     2020-05-14 20:11:20 8415371 [11202]: cmd_release 6,16,11206 ci_in 6 fd 16 count 1 flags 0
>     2020-05-14 20:11:20 8415371 [11202]: r3022 release_token r_flags 1 lver 9
>     2020-05-14 20:11:20 8415371 [11202]: r3022 write_host_block host_id 94 flags 0 gen 0 dblock 16094:16094:94:1:8414771:9:RELEASED.
>     2020-05-14 20:11:20 8415371 [11202]: r3022 release_token done r_flags 1
>     2020-05-14 20:11:20 8415371 [11202]: cmd_release 6,16,11206 result 0 pid_dead 0 count 1

That log section shows an LV lock being acquired and released.

> So, I got several questions:
> 
> 1. Why it takes so long to release lock, does it should blame to storage I/O ?

It doesn't appear the VG lock is being released, so we'd want to look at
lvmlockd state/logs and for an lvm commands that might be holding it.

> 2. Why other host(host_id 19) can read pervious shared lock(host_id 60 & 94) after hour?

I'm not seeing an issue like that.

> 3. What's the "right" way to solve this problem?

Reinitializing the lock on disk was insightful and effective, and since
the lock was shared is probably quite harmless.  If there were lvm
commands holding the VGLK for a long time (which we'd want to fix in lvm),
it would probably have been better to kill those commands so their locks
would be released.  If lvmlockd failed to release VG locks that were no
long being used (we'd also want to fix in lvm), then you could have
stopped and restarted the VG to clear things.

Dave
