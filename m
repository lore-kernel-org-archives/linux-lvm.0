Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3D1m1N7030879
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 21:48:01 -0400
Received: from mail-iw0-f200.google.com (mail-iw0-f200.google.com
	[209.85.214.200])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3D1lv1O018487
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 21:47:58 -0400
Received: by iwn3 with SMTP id 3so414977iwn.3
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 18:47:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110412234706.GA11244@redhat.com>
Message-ID: <20cf301cbef67d323104a0c2ff52@google.com>
Date: Wed, 13 Apr 2011 01:47:57 +0000
From: DarkNovaNick@gmail.com
Content-Type: multipart/alternative; boundary=20cf301cbef67d322304a0c2ff4f
Subject: Re: [linux-lvm] Testing TRIM with LVM
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--20cf301cbef67d322304a0c2ff4f
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes

On Apr 12, 2011 6:47pm, Mike Snitzer <snitzer@redhat.com> wrote:
> On Tue, Apr 12 2011 at 10:59am -0400,

> DarkNovaNick@gmail.com DarkNovaNick@gmail.com> wrote:



> > I recently purchased a Crucial C300 SSD and set it up as my primary

> > drive. I wanted to use LVM, and my reading indicates that LVM added

> > support to pass-through TRIM commands with kernel 2.6.37. I'm

> > running Ubuntu 10.10, but I installed the latest 11.04 kernel, so

> > I'm running kernel 2.6.38-8. I added "discard" to fstab so my

> > mountpoint looks like:

> >

> > /dev/mapper/vg0-vol0 on / type ext4

> > (rw,noatime,nodiratime,errors=remount-ro,discard,commit=0)



> If the discards aren't working then ext4 will print a warning and stop

> issuing them, see: http://git.kernel.org/linus/a30eec2a8650a77f7



> So if you don't see "discard not supported, disabling" in your dmesg (or

> /var/log/messages) then TRIM is likely working as expected.



> > I found directions on various sites like:

> >  
> http://duopetalflower.blogspot.com/2010/11/enterprise-kernel-6-has-ssd-trim.html

> > on how to confirm if TRIM is working. I ran (as root):

> >

> > dd if=/dev/urandom of=tempfile count=100 bs=512k oflag=direct

> > hdparm --fibmap tempfile

> > (then took the first begin_LBA)

> > hdparm --read-sector 191710208 /dev/sda

> >

> > and it printed:

> >

> > /dev/sda:

> > reading sector 191710208: succeeded

> > 3254 3a32 3834 313a 2b36 3030 303a 2030

> > 4544 5542 2047 3728 3a29 5320 7661 6e69

> > 2067 6e69 6564 2078 6f66 2072 7270 646f

> > ............

> >

> > Then I ran:

> > rm tempfile

> > sync

> > hdparm --read-sector 191710208 /dev/sda

> >

> > and it still returned:

> > /dev/sda:

> > reading sector 191710208: succeeded

> > 3254 3a32 3834 313a 2b36 3030 303a 2030

> > 4544 5542 2047 3728 3a29 5320 7661 6e69

> > 2067 6e69 6564 2078 6f66 2072 7270 646f

> > .............

> >

> > If TRIM is working, the sector is supposed to contain all zeros.



> That is only if the SSD implements TRIM so that it zeroes the discarded

> blocks. You can check if the device at least knows enough to report

> discard_zeroes_data:



> cat /sys/block/sda/queue/discard_zeroes_data



> Also, even if the SSD does zero, it may take some time -- well after the

> discard has completed -- for the SSD to actually zero the blocks (this

> is true of some lesser quality SSDs).



> > Am I doing something wrong or do I need to do something more to get

> > LVM to pass down the TRIM command?



> LVM (device mapper specifically) passes discards perfectly well. But

> the snapshot and dm-crypt targets don't have discard support. All other

> targets do have discard support. What is your output for: dmsetup table



> Mike




I get 0 back when I do "cat /sys/block/sda/queue/discard_zeroes_data" so  
does this mean that my drive doesn't zero out the TRIMed blocks? I don't  
really care if it does or does not, I just want to make sure the drive is  
getting the TRIM commands as the benchmarks I've seen show performance  
degradation if they aren't used.

Regarding snapshot targets, the only instance of "discard not supported"  
came as I did a snapshot today:

Apr 12 15:27:58 darknovanick kernel: [65147.211211] EXT4-fs warning (device  
dm-0): release_blocks_on_commit:2672: discard not supported, disabling
Apr 12 15:28:16 darknovanick kernel: [65166.103061] EXT4-fs (dm-1): 72  
orphan inodes deleted
Apr 12 15:28:16 darknovanick kernel: [65166.103062] EXT4-fs (dm-1):  
recovery complete
Apr 12 15:28:17 darknovanick kernel: [65166.232257] EXT4-fs (dm-1): mounted  
filesystem with ordered data mode. Opts: (null)

This snapshot was of a LV on the SSD, but the snapshot itself was being  
stored on a mechanical hard drive. Does this message mean that discard was  
just disabled for the snapshot itself (which was deleted a half hour  
later), or is it now disabled for the entire volume now that I've done a  
snapshot, even though its been removed?

My dmsetup table output:

vg0-vol0: 0 249438208 linear 8:2 512


Thanks,

Nick

--20cf301cbef67d322304a0c2ff4f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Apr 12, 2011 6:47pm, Mike Snitzer &lt;snitzer@redhat.com&gt; wrote:<br /=
>&gt; On Tue, Apr 12 2011 at 10:59am -0400,<br />&gt; <br />&gt; DarkNovaNi=
ck@gmail.com DarkNovaNick@gmail.com&gt; wrote:<br />&gt; <br />&gt; <br />&=
gt; <br />&gt; &gt; I recently purchased a Crucial C300 SSD and set it up a=
s my primary<br />&gt; <br />&gt; &gt; drive. I wanted to use LVM, and my r=
eading indicates that LVM added<br />&gt; <br />&gt; &gt; support to pass-t=
hrough TRIM commands with kernel 2.6.37. I&#39;m<br />&gt; <br />&gt; &gt; =
running Ubuntu 10.10, but I installed the latest 11.04 kernel, so<br />&gt;=
 <br />&gt; &gt; I&#39;m running kernel 2.6.38-8. I added &quot;discard&quo=
t; to fstab so my<br />&gt; <br />&gt; &gt; mountpoint looks like:<br />&gt=
; <br />&gt; &gt;<br />&gt; <br />&gt; &gt; /dev/mapper/vg0-vol0 on / type =
ext4<br />&gt; <br />&gt; &gt; (rw,noatime,nodiratime,errors=3Dremount-ro,d=
iscard,commit=3D0)<br />&gt; <br />&gt; <br />&gt; <br />&gt; If the discar=
ds aren&#39;t working then ext4 will print a warning and stop<br />&gt; <br=
 />&gt; issuing them, see: http://git.kernel.org/linus/a30eec2a8650a77f7<br=
 />&gt; <br />&gt; <br />&gt; <br />&gt; So if you don&#39;t see &quot;disc=
ard not supported, disabling&quot; in your dmesg (or<br />&gt; <br />&gt; /=
var/log/messages) then TRIM is likely working as expected.<br />&gt; <br />=
&gt; <br />&gt; <br />&gt; &gt; I found directions on various sites like:<b=
r />&gt; <br />&gt; &gt; http://duopetalflower.blogspot.com/2010/11/enterpr=
ise-kernel-6-has-ssd-trim.html<br />&gt; <br />&gt; &gt; on how to confirm =
if TRIM is working. I ran (as root):<br />&gt; <br />&gt; &gt;<br />&gt; <b=
r />&gt; &gt; dd if=3D/dev/urandom of=3Dtempfile count=3D100 bs=3D512k ofla=
g=3Ddirect<br />&gt; <br />&gt; &gt; hdparm --fibmap tempfile<br />&gt; <br=
 />&gt; &gt; (then took the first begin_LBA)<br />&gt; <br />&gt; &gt; hdpa=
rm --read-sector 191710208 /dev/sda<br />&gt; <br />&gt; &gt;<br />&gt; <br=
 />&gt; &gt; and it printed:<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt;=
 &gt; /dev/sda:<br />&gt; <br />&gt; &gt; reading sector 191710208: succeed=
ed<br />&gt; <br />&gt; &gt; 3254 3a32 3834 313a 2b36 3030 303a 2030<br />&=
gt; <br />&gt; &gt; 4544 5542 2047 3728 3a29 5320 7661 6e69<br />&gt; <br /=
>&gt; &gt; 2067 6e69 6564 2078 6f66 2072 7270 646f<br />&gt; <br />&gt; &gt=
; ............<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt; Then I r=
an:<br />&gt; <br />&gt; &gt; rm tempfile<br />&gt; <br />&gt; &gt; sync<br=
 />&gt; <br />&gt; &gt; hdparm --read-sector 191710208 /dev/sda<br />&gt; <=
br />&gt; &gt;<br />&gt; <br />&gt; &gt; and it still returned:<br />&gt; <=
br />&gt; &gt; /dev/sda:<br />&gt; <br />&gt; &gt; reading sector 191710208=
: succeeded<br />&gt; <br />&gt; &gt; 3254 3a32 3834 313a 2b36 3030 303a 20=
30<br />&gt; <br />&gt; &gt; 4544 5542 2047 3728 3a29 5320 7661 6e69<br />&=
gt; <br />&gt; &gt; 2067 6e69 6564 2078 6f66 2072 7270 646f<br />&gt; <br /=
>&gt; &gt; .............<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt=
; If TRIM is working, the sector is supposed to contain all zeros.<br />&gt=
; <br />&gt; <br />&gt; <br />&gt; That is only if the SSD implements TRIM =
so that it zeroes the discarded<br />&gt; <br />&gt; blocks. =A0You can che=
ck if the device at least knows enough to report<br />&gt; <br />&gt; disca=
rd_zeroes_data:<br />&gt; <br />&gt; <br />&gt; <br />&gt; cat /sys/block/s=
da/queue/discard_zeroes_data<br />&gt; <br />&gt; <br />&gt; <br />&gt; Als=
o, even if the SSD does zero, it may take some time -- well after the<br />=
&gt; <br />&gt; discard has completed -- for the SSD to actually zero the b=
locks (this<br />&gt; <br />&gt; is true of some lesser quality SSDs).<br /=
>&gt; <br />&gt; <br />&gt; <br />&gt; &gt; Am I doing something wrong or d=
o I need to do something more to get<br />&gt; <br />&gt; &gt; LVM to pass =
down the TRIM command?<br />&gt; <br />&gt; <br />&gt; <br />&gt; LVM (devi=
ce mapper specifically) passes discards perfectly well. =A0But<br />&gt; <b=
r />&gt; the snapshot and dm-crypt targets don&#39;t have discard support. =
=A0All other<br />&gt; <br />&gt; targets do have discard support. =A0What =
is your output for: dmsetup table<br />&gt; <br />&gt; <br />&gt; <br />&gt=
; Mike<br />&gt; <br />&gt; <br /><br /><br />I get 0 back when I do &quot;=
cat /sys/block/sda/queue/discard_zeroes_data&quot; so does this mean that m=
y drive doesn&#39;t zero out the TRIMed blocks? I don&#39;t really care if =
it does or does not, I just want to make sure the drive is getting the TRIM=
 commands as the benchmarks I&#39;ve seen show performance degradation if t=
hey aren&#39;t used.<br /><br />Regarding snapshot targets, the only instan=
ce of &quot;discard not supported&quot; came as I did a snapshot today:<br =
/><br />Apr 12 15:27:58 darknovanick kernel: [65147.211211] EXT4-fs warning=
 (device dm-0): release_blocks_on_commit:2672: discard not supported, disab=
ling<br />Apr 12 15:28:16 darknovanick kernel: [65166.103061] EXT4-fs (dm-1=
): 72 orphan inodes deleted<br />Apr 12 15:28:16 darknovanick kernel: [6516=
6.103062] EXT4-fs (dm-1): recovery complete<br />Apr 12 15:28:17 darknovani=
ck kernel: [65166.232257] EXT4-fs (dm-1): mounted filesystem with ordered d=
ata mode. Opts: (null)<br /><br />This snapshot was of a LV on the SSD, but=
 the snapshot itself was being stored on a mechanical hard drive. Does this=
 message mean that discard was just disabled for the snapshot itself (which=
 was deleted a half hour later), or is it now disabled for the entire volum=
e now that I&#39;ve done a snapshot, even though its been removed?<br /><br=
 />My dmsetup table output:<br /><br />vg0-vol0: 0 249438208 linear 8:2 512=
<br /><br /><br />Thanks,<br /><br />Nick
--20cf301cbef67d322304a0c2ff4f--
