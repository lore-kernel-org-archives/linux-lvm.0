Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94F7F10EE847
	for <linux-lvm@redhat.com>; Wed, 20 May 2020 15:18:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5456185A78B
	for <linux-lvm@redhat.com>; Wed, 20 May 2020 15:18:46 +0000 (UTC)
MIME-Version: 1.0
References: <CABZYMH53DVpN0mPrrEacDedyyX-fdi4+QH7-hHc6Fvtjm8akUg@mail.gmail.com>
	<20200519160859.GC8902@redhat.com>
In-Reply-To: <20200519160859.GC8902@redhat.com>
From: Damon Wang <damon.devops@gmail.com>
Date: Wed, 20 May 2020 23:18:05 +0800
Message-ID: <CABZYMH5uvXDdy0cypYgHV=+APb1Ky8d+YAp0pstQNtcjnMChsQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000a356005a615e92a"
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
To: David Teigland <teigland@redhat.com>
Cc: sanlock-devel@lists.fedorahosted.org, LVM general discussion and development <linux-lvm@redhat.com>

--0000000000000a356005a615e92a
Content-Type: text/plain; charset="UTF-8"

Hi Dave,

Your information is insightful, I'm sorry for I mixed lvlock & VGLK up.
It's a pity that the log of lvmlockd has been lost since I misconfigured
related configuration.

But I gained a good deal of enlightenment from your reply.

Here I need to talk more about the background:

On May 14th, my customer mapped some new LUNs to all servers in this
"24-node sanlock cluster". Meanwhile we found lots of hosts "multipath -ll"
got hung forever with these logs in messages:

  May 14 17:52:50 sdc-c-3 kernel: blk_update_request: I/O error, dev sdcd,
sector 0
  May 14 17:52:50 sdc-c-3 kernel: Buffer I/O error on dev sdcd, logical
block 0, async page read
  May 14 17:52:50 sdc-c-3 kernel: sd 1:0:0:10: [sdcd] tag#0 FAILED Result:
hostbyte=DID_OK driverbyte=DRIVER_SENSE
  May 14 17:52:50 sdc-c-3 kernel: sd 1:0:0:10: [sdcd] tag#0 Sense Key :
Illegal Request [current]
  May 14 17:52:50 sdc-c-3 kernel: sd 1:0:0:10: [sdcd] tag#0 ASC=0x25
ASCQ=0x1
  May 14 17:52:50 sdc-c-3 kernel: sd 1:0:0:10: [sdcd] tag#0 CDB: Read(10)
28 00 00 00 00 00 00 00 08 00

It may because of some wrong configuration in storage side, so my customer
unmapped these LUNs.
The default multipath configuration of vender "DGC" contains 'features "1
queue_if_no_path"', so though customer has unmaped LUNs, some IO possibly
queued, multipathd still not works. Execute "dmsetup message xx 0
'fail_if_no_path'" also hung...
Eventually we rebooted some of these servers to make multipathd works
well(that's painful, I'm wondering if there is any better solution). And
plan to reboot others on the second day.

On May 15th, my customer told us that some of his business still not work
well, so I found VGLK stuck with two tricky shared locks we talked about in
the previous posts.

Since critical log lost, I try to simulate the environment by this setup:
https://pastebin.com/St2NP4c6
In a word, I use LIO to simulate two multipath, backstorage of LUN0 is a
lvm lv, LUN1 is a virtio volume. And I set "queue_if_no_path" to multipaths.
Then I use "dmsetup suspend LUN0" to make it not respond to any IO to
simulate the customer's wrong storage.
Meanwhile "multipath -ll" hung -- that's what I expected, after a while,
"multipath -ll" recovered but LUN0 and LUN1 both failed.

Although there are some "symptoms" that are not exactly the same, I believe
"queue_if_no_path" may not work as expected, if some paths fail, other
paths may also not work well.

Damon

On Wed, May 20, 2020 at 12:09 AM David Teigland <teigland@redhat.com> wrote:

> On Tue, May 19, 2020 at 09:31:16PM +0800, Damon Wang wrote:
> > Hi,
> >
> > I got a wired case recently with a 24-nodes sanlock cluster recently.
> > One sanlock process stuck with getting VGLK since it thinks there are
> > two live host using VGLK shared lock, here is sanlock log from this
> > host(host_id 19): https://pastebin.com/zJubYLRv
> >
> > I find important messages:
>
> Hi, thanks for isolating the relevant portions of the debug log.
>
> >     "2020-05-14 21:28:51 2018540 [14765]: r857 clear_dead_shared
> > host_id 61 gen 1 alive"
> >     "2020-05-14 21:28:51 2018540 [14765]: r857 clear_dead_shared
> > host_id 94 gen 1 alive"
> >     "2020-05-14 21:28:52 2018541 [14764]: r858 clear_dead_shared
> > host_id 61 gen 1 alive"
> >     "2020-05-14 21:28:52 2018541 [14764]: r858 clear_dead_shared
> > host_id 94 gen 1 alive"
> >     "2020-05-14 21:28:53 2018542 [14765]: r859 clear_dead_shared
> > host_id 61 gen 1 alive"
> >     "2020-05-14 21:28:53 2018542 [14765]: r859 clear_dead_shared
> > host_id 94 gen 1 alive"
> >     "2020-05-14 21:28:54 2018543 [14764]: r860 clear_dead_shared
> > host_id 61 gen 1 alive"
> >     "2020-05-14 21:28:54 2018543 [14764]: r860 clear_dead_shared
> > host_id 94 gen 1 alive"
> >     "2020-05-14 21:28:55 2018544 [14765]: r861 clear_dead_shared
> > host_id 61 gen 1 alive"
> >     "2020-05-14 21:28:55 2018544 [14765]: r861 clear_dead_shared
> > host_id 94 gen 1 alive"
>
> So far this looks like sanlock is working correctly.  At this point it
> would have been interesting to look for any lvm commands on 61 & 94 that
> might be holding this VGLK, or evidence of lvm commands that might have
> failed to release the VGLK.  lvmlockctl -i / -d would help with that.
>
> > So I try to find out what happend to host_id 61 and host_id 94, it
> > seems both two hosts tried to acquire VGLK and then released, though
> > with long time.
> >
> > full log of host_id 61: https://pastebin.com/zDWQAtHE
> >     2020-05-14 20:23:03 2545197 [33739]: cmd_acquire 6,16,33743 ci_in 6
> fd 16 count 1 flags 9
> >     2020-05-14 20:23:03 2545197 [33739]: s5:r1044 resource
> lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:69206016:SH
> for 6,16,33743
> >     2020-05-14 20:23:03 2545197 [33739]: r1044 paxos_acquire begin e 0 0
> >     2020-05-14 20:23:03 2545197 [33739]: r1044 leader 6067 owner 36 2 0
> dblocks 35:12132036:12132036:36:2:2099201:6067:1,
> >     2020-05-14 20:23:03 2545197 [33739]: r1044 paxos_acquire leader 6067
> owner 36 2 0 max mbal[35] 12132036 our_dblock 12096061 12096061 61 1
> 2537794 6049
> >     2020-05-14 20:23:03 2545197 [33739]: r1044 paxos_acquire leader 6067
> free
> >     2020-05-14 20:23:03 2545198 [33739]: r1044 acquire_disk rv 1 lver
> 6068 at 2545198
> >     2020-05-14 20:23:03 2545198 [33739]: r1044 write_host_block host_id
> 61 flags 1 gen 1 dblock 12134061:12134061:61:1:2545198:6068:RELEASED.
> >     2020-05-14 20:23:03 2545198 [33739]: r1044 paxos_release leader 6068
> owner 61 1 2545198
> >     2020-05-14 20:23:03 2545198 [33739]: cmd_acquire 6,16,33743 result 0
> pid_dead 0
> >     2020-05-14 20:23:03 2545198 [33740]: cmd_get_lvb ci 8 fd 20 result 0
> res lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK
>
> That log section shows the shared VGLK being acquired for host_id 61.
>
> >     2020-05-14 20:23:03 2545198 [33739]: cmd_acquire 6,16,33743 ci_in 6
> fd 16 count 1 flags 8
> >     2020-05-14 20:23:03 2545198 [33739]: s5:r1045 resource
> lvm_fc261665e94c4d0f8341e254398e7ed5:lL0kHh-CZ1i-jtMi-1qHO-ykfR-6nmu-Gk0rES:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:104857600
> for 6,16,33743
> >     2020-05-14 20:23:03 2545198 [33739]: r1045 paxos_acquire begin a 0 0
> >     2020-05-14 20:55:05 2547119 [33740]: r1045 paxos_release leader 10
> owner 61 1 2545198
> >     2020-05-14 20:55:05 2547119 [33740]: r1045 release_token done
> r_flags 8
> >     2020-05-14 20:55:05 2547119 [33740]: cmd_release 6,16,33743 result 0
> pid_dead 0 count 1
>
> That log section shows an LV lock (r1045) being released.
>
> I'm not seeing a log of the VGLK (r1044) being released, so perhaps the
> VGLK is still held by lvmlockd (either because it failed to release the
> VGLK or because there's some long running lvm command holding it.)
>
> > useful log, it's similar to host_id 60, but shorter time to release:
> >
> >     2020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,16,11206 ci_in 6
> fd 16 count 1 flags 9
> >     2020-05-14 20:01:20 8414771 [11203]: s5:r3021 resource
> lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:69206016:SH
> for 6,16,11206
> >     2020-05-14 20:01:20 8414771 [11203]: r3021 paxos_acquire begin e 0 0
> >     2020-05-14 20:01:20 8414771 [11203]: r3021 leader 6063 owner 36 2 0
> dblocks 35:12124036:12124036:36:2:2097966:6063:1,
> >     2020-05-14 20:01:20 8414771 [11203]: r3021 paxos_acquire leader 6063
> owner 36 2 0 max mbal[35] 12124036 our_dblock 11840094 11840094 94 1
> 8325309 5921
> >     2020-05-14 20:01:20 8414771 [11203]: r3021 paxos_acquire leader 6063
> free
> >     2020-05-14 20:01:20 8414771 [11203]: r3021 acquire_disk rv 1 lver
> 6064 at 8414771
> >     2020-05-14 20:01:20 8414771 [11203]: r3021 write_host_block host_id
> 94 flags 1 gen 1 dblock 12126094:12126094:94:1:8414771:6064:RELEASED.
> >     2020-05-14 20:01:20 8414771 [11203]: r3021 paxos_release leader 6064
> owner 94 1 8414771
> >     2020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,16,11206 result 0
> pid_dead 0
> >     2020-05-14 20:01:20 8414771 [11202]: cmd_get_lvb ci 8 fd 20 result 0
> res lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK
> >     2020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,16,11206 ci_in 6
> fd 16 count 1 flags 8
>
> That log section shows the shared VGLK being acquired for host_id 94.
> Again, there's no logging showing the VGLK being released.
>
> >     2020-05-14 20:01:20 8414771 [11203]: s5:r3022 resource
> lvm_fc261665e94c4d0f8341e254398e7ed5:lL0kHh-CZ1i-jtMi-1qHO-ykfR-6nmu-Gk0rES:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:104857600:SH
> for 6,16,11206
> >     2020-05-14 20:01:20 8414771 [11203]: r3022 paxos_acquire begin e 0 0
> >     2020-05-14 20:01:20 8414771 [11203]: r3022 leader 8 owner 36 2 0
> dblocks 35:14036:14036:36:2:1566014:8:1,
> >     2020-05-14 20:01:20 8414771 [11203]: r3022 paxos_acquire leader 8
> owner 36 2 0 max mbal[35] 14036 our_dblock 0 0 0 0 0 0
> >     2020-05-14 20:01:20 8414771 [11203]: r3022 paxos_acquire leader 8
> free
> >     2020-05-14 20:01:20 8414771 [11203]: r3022 acquire_disk rv 1 lver 9
> at 8414771
> >     2020-05-14 20:01:20 8414771 [11203]: r3022 write_host_block host_id
> 94 flags 1 gen 1 dblock 16094:16094:94:1:8414771:9:RELEASED.
> >     2020-05-14 20:01:20 8414771 [11203]: r3022 paxos_release leader 9
> owner 94 1 8414771
> >     2020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,16,11206 result 0
> pid_dead 0
> >     ... ...
> >     2020-05-14 20:11:20 8415371 [11202]: cmd_release 6,16,11206 ci_in 6
> fd 16 count 1 flags 0
> >     2020-05-14 20:11:20 8415371 [11202]: r3022 release_token r_flags 1
> lver 9
> >     2020-05-14 20:11:20 8415371 [11202]: r3022 write_host_block host_id
> 94 flags 0 gen 0 dblock 16094:16094:94:1:8414771:9:RELEASED.
> >     2020-05-14 20:11:20 8415371 [11202]: r3022 release_token done
> r_flags 1
> >     2020-05-14 20:11:20 8415371 [11202]: cmd_release 6,16,11206 result 0
> pid_dead 0 count 1
>
> That log section shows an LV lock being acquired and released.
>
> > So, I got several questions:
> >
> > 1. Why it takes so long to release lock, does it should blame to storage
> I/O ?
>
> It doesn't appear the VG lock is being released, so we'd want to look at
> lvmlockd state/logs and for an lvm commands that might be holding it.
>
> > 2. Why other host(host_id 19) can read pervious shared lock(host_id 60 &
> 94) after hour?
>
> I'm not seeing an issue like that.
>
> > 3. What's the "right" way to solve this problem?
>
> Reinitializing the lock on disk was insightful and effective, and since
> the lock was shared is probably quite harmless.  If there were lvm
> commands holding the VGLK for a long time (which we'd want to fix in lvm),
> it would probably have been better to kill those commands so their locks
> would be released.  If lvmlockd failed to release VG locks that were no
> long being used (we'd also want to fix in lvm), then you could have
> stopped and restarted the VG to clear things.
>
> Dave
>
>

--0000000000000a356005a615e92a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Dave,<br><br>Your information is insightful, I&#39;m so=
rry for I mixed lvlock &amp; VGLK up.<br>It&#39;s a pity that the log of lv=
mlockd has been lost since I misconfigured related configuration.<br><br>Bu=
t I gained a good deal of enlightenment from your reply.<br><br>Here I need=
 to talk more about the background:<br><br>On May 14th, my customer mapped =
some new LUNs to all servers in this &quot;24-node sanlock cluster&quot;. M=
eanwhile we found lots of hosts &quot;multipath -ll&quot; got hung forever =
with these logs in messages:<br><br>=C2=A0 May 14 17:52:50 sdc-c-3 kernel: =
blk_update_request: I/O error, dev sdcd, sector 0<br>=C2=A0 May 14 17:52:50=
 sdc-c-3 kernel: Buffer I/O error on dev sdcd, logical block 0, async page =
read<br>=C2=A0 May 14 17:52:50 sdc-c-3 kernel: sd 1:0:0:10: [sdcd] tag#0 FA=
ILED Result: hostbyte=3DDID_OK driverbyte=3DDRIVER_SENSE<br>=C2=A0 May 14 1=
7:52:50 sdc-c-3 kernel: sd 1:0:0:10: [sdcd] tag#0 Sense Key : Illegal Reque=
st [current]<br>=C2=A0 May 14 17:52:50 sdc-c-3 kernel: sd 1:0:0:10: [sdcd] =
tag#0 ASC=3D0x25 ASCQ=3D0x1<br>=C2=A0 May 14 17:52:50 sdc-c-3 kernel: sd 1:=
0:0:10: [sdcd] tag#0 CDB: Read(10) 28 00 00 00 00 00 00 00 08 00<br><br>It =
may because of some wrong configuration in storage side, so my customer unm=
apped these LUNs.<br>The default multipath configuration of vender &quot;DG=
C&quot; contains &#39;features &quot;1 queue_if_no_path&quot;&#39;, so thou=
gh customer has unmaped LUNs, some IO possibly queued, multipathd still not=
 works. Execute &quot;dmsetup message xx 0 &#39;fail_if_no_path&#39;&quot; =
also hung...<br>Eventually we rebooted some of these servers to make multip=
athd works well(that&#39;s painful, I&#39;m wondering if there is any bette=
r solution). And plan to reboot others on the second day.<br><br>On May 15t=
h, my customer told us that some of his business still not work well, so I =
found VGLK stuck with two tricky shared locks we talked about in the previo=
us posts.<br><br>Since critical log lost, I try to simulate the environment=
 by this setup: <a href=3D"https://pastebin.com/St2NP4c6">https://pastebin.=
com/St2NP4c6</a><br>In a word, I use LIO to simulate two multipath, backsto=
rage of LUN0 is a lvm lv, LUN1 is a virtio volume. And I set &quot;queue_if=
_no_path&quot; to multipaths.<br>Then I use &quot;dmsetup suspend LUN0&quot=
; to make it not respond to any IO to simulate the customer&#39;s wrong sto=
rage.<br>Meanwhile &quot;multipath -ll&quot; hung -- that&#39;s what I expe=
cted, after a while, &quot;multipath -ll&quot; recovered but LUN0 and LUN1 =
both failed. <br><br>Although there are some &quot;symptoms&quot; that are =
not exactly the same, I believe &quot;queue_if_no_path&quot; may not work a=
s expected, if some paths fail, other paths may also not work well.<br><br>=
Damon<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, May 20, 2020 at 12:09 AM David Teigland &lt;<a href=3D"mai=
lto:teigland@redhat.com">teigland@redhat.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Tue, May 19, 2020 at 09:31:1=
6PM +0800, Damon Wang wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I got a wired case recently with a 24-nodes sanlock cluster recently.<=
br>
&gt; One sanlock process stuck with getting VGLK since it thinks there are<=
br>
&gt; two live host using VGLK shared lock, here is sanlock log from this<br=
>
&gt; host(host_id 19): <a href=3D"https://pastebin.com/zJubYLRv" rel=3D"nor=
eferrer" target=3D"_blank">https://pastebin.com/zJubYLRv</a><br>
&gt; <br>
&gt; I find important messages:<br>
<br>
Hi, thanks for isolating the relevant portions of the debug log.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2020-05-14 21:28:51 2018540 [14765]: r857 cle=
ar_dead_shared<br>
&gt; host_id 61 gen 1 alive&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2020-05-14 21:28:51 2018540 [14765]: r857 cle=
ar_dead_shared<br>
&gt; host_id 94 gen 1 alive&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2020-05-14 21:28:52 2018541 [14764]: r858 cle=
ar_dead_shared<br>
&gt; host_id 61 gen 1 alive&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2020-05-14 21:28:52 2018541 [14764]: r858 cle=
ar_dead_shared<br>
&gt; host_id 94 gen 1 alive&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2020-05-14 21:28:53 2018542 [14765]: r859 cle=
ar_dead_shared<br>
&gt; host_id 61 gen 1 alive&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2020-05-14 21:28:53 2018542 [14765]: r859 cle=
ar_dead_shared<br>
&gt; host_id 94 gen 1 alive&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2020-05-14 21:28:54 2018543 [14764]: r860 cle=
ar_dead_shared<br>
&gt; host_id 61 gen 1 alive&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2020-05-14 21:28:54 2018543 [14764]: r860 cle=
ar_dead_shared<br>
&gt; host_id 94 gen 1 alive&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2020-05-14 21:28:55 2018544 [14765]: r861 cle=
ar_dead_shared<br>
&gt; host_id 61 gen 1 alive&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;2020-05-14 21:28:55 2018544 [14765]: r861 cle=
ar_dead_shared<br>
&gt; host_id 94 gen 1 alive&quot;<br>
<br>
So far this looks like sanlock is working correctly.=C2=A0 At this point it=
<br>
would have been interesting to look for any lvm commands on 61 &amp; 94 tha=
t<br>
might be holding this VGLK, or evidence of lvm commands that might have<br>
failed to release the VGLK.=C2=A0 lvmlockctl -i / -d would help with that.<=
br>
<br>
&gt; So I try to find out what happend to host_id 61 and host_id 94, it<br>
&gt; seems both two hosts tried to acquire VGLK and then released, though<b=
r>
&gt; with long time.<br>
&gt; <br>
&gt; full log of host_id 61: <a href=3D"https://pastebin.com/zDWQAtHE" rel=
=3D"noreferrer" target=3D"_blank">https://pastebin.com/zDWQAtHE</a><br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545197 [33739]: cmd_acquire 6,=
16,33743 ci_in 6 fd 16 count 1 flags 9<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545197 [33739]: s5:r1044 resou=
rce lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK:/dev/mapper/fc261665e94c4d0f8=
341e254398e7ed5-lvmlock:69206016:SH for 6,16,33743<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545197 [33739]: r1044 paxos_ac=
quire begin e 0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545197 [33739]: r1044 leader 6=
067 owner 36 2 0 dblocks 35:12132036:12132036:36:2:2099201:6067:1,<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545197 [33739]: r1044 paxos_ac=
quire leader 6067 owner 36 2 0 max mbal[35] 12132036 our_dblock 12096061 12=
096061 61 1 2537794 6049<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545197 [33739]: r1044 paxos_ac=
quire leader 6067 free<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545198 [33739]: r1044 acquire_=
disk rv 1 lver 6068 at 2545198<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545198 [33739]: r1044 write_ho=
st_block host_id 61 flags 1 gen 1 dblock 12134061:12134061:61:1:2545198:606=
8:RELEASED.<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545198 [33739]: r1044 paxos_re=
lease leader 6068 owner 61 1 2545198<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545198 [33739]: cmd_acquire 6,=
16,33743 result 0 pid_dead 0<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545198 [33740]: cmd_get_lvb ci=
 8 fd 20 result 0 res lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK<br>
<br>
That log section shows the shared VGLK being acquired for host_id 61.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545198 [33739]: cmd_acquire 6,=
16,33743 ci_in 6 fd 16 count 1 flags 8<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545198 [33739]: s5:r1045 resou=
rce lvm_fc261665e94c4d0f8341e254398e7ed5:lL0kHh-CZ1i-jtMi-1qHO-ykfR-6nmu-Gk=
0rES:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:104857600 for 6,1=
6,33743<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:23:03 2545198 [33739]: r1045 paxos_ac=
quire begin a 0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:55:05 2547119 [33740]: r1045 paxos_re=
lease leader 10 owner 61 1 2545198<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:55:05 2547119 [33740]: r1045 release_=
token done r_flags 8<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:55:05 2547119 [33740]: cmd_release 6,=
16,33743 result 0 pid_dead 0 count 1<br>
<br>
That log section shows an LV lock (r1045) being released.<br>
<br>
I&#39;m not seeing a log of the VGLK (r1044) being released, so perhaps the=
<br>
VGLK is still held by lvmlockd (either because it failed to release the<br>
VGLK or because there&#39;s some long running lvm command holding it.)<br>
<br>
&gt; useful log, it&#39;s similar to host_id 60, but shorter time to releas=
e:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,=
16,11206 ci_in 6 fd 16 count 1 flags 9<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: s5:r3021 resou=
rce lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK:/dev/mapper/fc261665e94c4d0f8=
341e254398e7ed5-lvmlock:69206016:SH for 6,16,11206<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3021 paxos_ac=
quire begin e 0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3021 leader 6=
063 owner 36 2 0 dblocks 35:12124036:12124036:36:2:2097966:6063:1,<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3021 paxos_ac=
quire leader 6063 owner 36 2 0 max mbal[35] 12124036 our_dblock 11840094 11=
840094 94 1 8325309 5921<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3021 paxos_ac=
quire leader 6063 free<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3021 acquire_=
disk rv 1 lver 6064 at 8414771<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3021 write_ho=
st_block host_id 94 flags 1 gen 1 dblock 12126094:12126094:94:1:8414771:606=
4:RELEASED.<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3021 paxos_re=
lease leader 6064 owner 94 1 8414771<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,=
16,11206 result 0 pid_dead 0<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11202]: cmd_get_lvb ci=
 8 fd 20 result 0 res lvm_fc261665e94c4d0f8341e254398e7ed5:VGLK<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,=
16,11206 ci_in 6 fd 16 count 1 flags 8<br>
<br>
That log section shows the shared VGLK being acquired for host_id 94.<br>
Again, there&#39;s no logging showing the VGLK being released.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: s5:r3022 resou=
rce lvm_fc261665e94c4d0f8341e254398e7ed5:lL0kHh-CZ1i-jtMi-1qHO-ykfR-6nmu-Gk=
0rES:/dev/mapper/fc261665e94c4d0f8341e254398e7ed5-lvmlock:104857600:SH for =
6,16,11206<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3022 paxos_ac=
quire begin e 0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3022 leader 8=
 owner 36 2 0 dblocks 35:14036:14036:36:2:1566014:8:1,<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3022 paxos_ac=
quire leader 8 owner 36 2 0 max mbal[35] 14036 our_dblock 0 0 0 0 0 0<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3022 paxos_ac=
quire leader 8 free<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3022 acquire_=
disk rv 1 lver 9 at 8414771<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3022 write_ho=
st_block host_id 94 flags 1 gen 1 dblock 16094:16094:94:1:8414771:9:RELEASE=
D.<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: r3022 paxos_re=
lease leader 9 owner 94 1 8414771<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:01:20 8414771 [11203]: cmd_acquire 6,=
16,11206 result 0 pid_dead 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0... ...<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:11:20 8415371 [11202]: cmd_release 6,=
16,11206 ci_in 6 fd 16 count 1 flags 0<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:11:20 8415371 [11202]: r3022 release_=
token r_flags 1 lver 9<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:11:20 8415371 [11202]: r3022 write_ho=
st_block host_id 94 flags 0 gen 0 dblock 16094:16094:94:1:8414771:9:RELEASE=
D.<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:11:20 8415371 [11202]: r3022 release_=
token done r_flags 1<br>
&gt;=C2=A0 =C2=A0 =C2=A02020-05-14 20:11:20 8415371 [11202]: cmd_release 6,=
16,11206 result 0 pid_dead 0 count 1<br>
<br>
That log section shows an LV lock being acquired and released.<br>
<br>
&gt; So, I got several questions:<br>
&gt; <br>
&gt; 1. Why it takes so long to release lock, does it should blame to stora=
ge I/O ?<br>
<br>
It doesn&#39;t appear the VG lock is being released, so we&#39;d want to lo=
ok at<br>
lvmlockd state/logs and for an lvm commands that might be holding it.<br>
<br>
&gt; 2. Why other host(host_id 19) can read pervious shared lock(host_id 60=
 &amp; 94) after hour?<br>
<br>
I&#39;m not seeing an issue like that.<br>
<br>
&gt; 3. What&#39;s the &quot;right&quot; way to solve this problem?<br>
<br>
Reinitializing the lock on disk was insightful and effective, and since<br>
the lock was shared is probably quite harmless.=C2=A0 If there were lvm<br>
commands holding the VGLK for a long time (which we&#39;d want to fix in lv=
m),<br>
it would probably have been better to kill those commands so their locks<br=
>
would be released.=C2=A0 If lvmlockd failed to release VG locks that were n=
o<br>
long being used (we&#39;d also want to fix in lvm), then you could have<br>
stopped and restarted the VG to clear things.<br>
<br>
Dave<br>
<br>
</blockquote></div>

--0000000000000a356005a615e92a--
