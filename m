Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3DFcPk6021724
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2011 11:38:25 -0400
Received: from mail-iy0-f200.google.com (mail-iy0-f200.google.com
	[209.85.210.200])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3DFcKn5012921
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2011 11:38:21 -0400
Received: by iym1 with SMTP id 1so1622239iym.3
	for <linux-lvm@redhat.com>; Wed, 13 Apr 2011 08:38:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4DA561C3.9070808@redhat.com>
Message-ID: <bcaec51d23ca2a6bab04a0ce99d8@google.com>
Date: Wed, 13 Apr 2011 15:38:20 +0000
From: DarkNovaNick@gmail.com
Content-Type: multipart/alternative; boundary=bcaec51d23ca2a6b9604a0ce99d5
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
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, DarkNovaNick@gmail.com
Cc: Mike Snitzer <snitzer@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

--bcaec51d23ca2a6b9604a0ce99d5
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes

On Apr 13, 2011 3:41am, Zdenek Kabelac <zdenek.kabelac@gmail.com> wrote:
> Dne 13.4.2011 03:47, DarkNovaNick@gmail.com napsal(a):

> > On Apr 12, 2011 6:47pm, Mike Snitzer snitzer@redhat.com> wrote:

> >> On Tue, Apr 12 2011 at 10:59am -0400,

> >

> >> DarkNovaNick@gmail.com DarkNovaNick@gmail.com> wrote:

> >

> >

> >

> >> > I recently purchased a Crucial C300 SSD and set it up as my primary

> >

> >> > drive. I wanted to use LVM, and my reading indicates that LVM added

> >

> >> > support to pass-through TRIM commands with kernel 2.6.37. I'm

> >

> >> > running Ubuntu 10.10, but I installed the latest 11.04 kernel, so

> >

> >> > I'm running kernel 2.6.38-8. I added "discard" to fstab so my

> >

> >> > mountpoint looks like:

> >

> >> >

> >

> >> > /dev/mapper/vg0-vol0 on / type ext4

> >

> >> > (rw,noatime,nodiratime,errors=remount-ro,discard,commit=0)

> >

> >

> >

> >> If the discards aren't working then ext4 will print a warning and stop

> >

> >> issuing them, see: http://git.kernel.org/linus/a30eec2a8650a77f7

> >

> >

> >

> >> So if you don't see "discard not supported, disabling" in your dmesg  
> (or

> >

> >> /var/log/messages) then TRIM is likely working as expected.

> >

> >

> >

> >> > I found directions on various sites like:

> >

> >> >

> >>  
> http://duopetalflower.blogspot.com/2010/11/enterprise-kernel-6-has-ssd-trim.html

> >>

> >

> >> > on how to confirm if TRIM is working. I ran (as root):

> >

> >> >

> >

> >> > dd if=/dev/urandom of=tempfile count=100 bs=512k oflag=direct

> >

> >> > hdparm --fibmap tempfile

> >

> >> > (then took the first begin_LBA)

> >

> >> > hdparm --read-sector 191710208 /dev/sda

> >

> >> >

> >

> >> > and it printed:

> >

> >> >

> >

> >> > /dev/sda:

> >

> >> > reading sector 191710208: succeeded

> >

> >> > 3254 3a32 3834 313a 2b36 3030 303a 2030

> >

> >> > 4544 5542 2047 3728 3a29 5320 7661 6e69

> >

> >> > 2067 6e69 6564 2078 6f66 2072 7270 646f

> >

> >> > ............

> >

> >> >

> >

> >> > Then I ran:

> >

> >> > rm tempfile

> >

> >> > sync

> >

> >> > hdparm --read-sector 191710208 /dev/sda

> >

> >> >

> >

> >> > and it still returned:

> >

> >> > /dev/sda:

> >

> >> > reading sector 191710208: succeeded

> >

> >> > 3254 3a32 3834 313a 2b36 3030 303a 2030

> >

> >> > 4544 5542 2047 3728 3a29 5320 7661 6e69

> >

> >> > 2067 6e69 6564 2078 6f66 2072 7270 646f

> >

> >> > .............

> >

> >> >

> >

> >> > If TRIM is working, the sector is supposed to contain all zeros.

> >

> >

> >

> >> That is only if the SSD implements TRIM so that it zeroes the discarded

> >

> >> blocks. You can check if the device at least knows enough to report

> >

> >> discard_zeroes_data:

> >

> >

> >

> >> cat /sys/block/sda/queue/discard_zeroes_data

> >

> >

> >

> >> Also, even if the SSD does zero, it may take some time -- well after  
> the

> >

> >> discard has completed -- for the SSD to actually zero the blocks (this

> >

> >> is true of some lesser quality SSDs).

> >

> >

> >

> >> > Am I doing something wrong or do I need to do something more to get

> >

> >> > LVM to pass down the TRIM command?

> >

> >

> >

> >> LVM (device mapper specifically) passes discards perfectly well. But

> >

> >> the snapshot and dm-crypt targets don't have discard support. All other

> >

> >> targets do have discard support. What is your output for: dmsetup table

> >

> >

> >

> >> Mike

> >

> >

> >

> >

> > I get 0 back when I do "cat /sys/block/sda/queue/discard_zeroes_data"  
> so does

> > this mean that my drive doesn't zero out the TRIMed blocks? I don't  
> really

> > care if it does or does not, I just want to make sure the drive is  
> getting the

> > TRIM commands as the benchmarks I've seen show performance degradation  
> if they

> > aren't used.



> As I've the same drive - what kind of performance degradation do you see?



> Note: this drive (unlike many others) is processing TRIM command on

> background. So 'traditional' benchmark do not provide valuable results.

> (As we've been evaluating this drive somewhat to compare with Intel).



> Outcome is - when you issue TRIM command - it's immediately finished -  
> but the

> performance of drive is temporarily decreased while the drive is  
> performing

> block trimming for some time. Thus you might get 'impressive' results when

> some benchmarks are evaluating TRIM performance ;)



> Zdenek



I may not have been clear, but the benchmarks I am referring to show the  
performance degradation if you are *not* using TRIM (ie just relying on the  
drive's internal garbage collector). Which is why I want to make sure the  
TRIM is working so it doesn't get into this poor state.

Nick

--bcaec51d23ca2a6b9604a0ce99d5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Apr 13, 2011 3:41am, Zdenek Kabelac &lt;zdenek.kabelac@gmail.com&gt; wro=
te:<br />&gt; Dne 13.4.2011 03:47, DarkNovaNick@gmail.com napsal(a):<br />&=
gt; <br />&gt; &gt; On Apr 12, 2011 6:47pm, Mike Snitzer snitzer@redhat.com=
&gt; wrote:<br />&gt; <br />&gt; &gt;&gt; On Tue, Apr 12 2011 at 10:59am -0=
400,<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; DarkNovaNick@g=
mail.com DarkNovaNick@gmail.com&gt; wrote:<br />&gt; <br />&gt; &gt;<br />&=
gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt;=
 &gt; I recently purchased a Crucial C300 SSD and set it up as my primary<b=
r />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; drive. I wanted=
 to use LVM, and my reading indicates that LVM added<br />&gt; <br />&gt; &=
gt;<br />&gt; <br />&gt; &gt;&gt; &gt; support to pass-through TRIM command=
s with kernel 2.6.37. I&#39;m<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt=
; &gt;&gt; &gt; running Ubuntu 10.10, but I installed the latest 11.04 kern=
el, so<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; I&#39;m=
 running kernel 2.6.38-8. I added &quot;discard&quot; to fstab so my<br />&=
gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; mountpoint looks lik=
e:<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt;<br />&gt; <=
br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; /dev/mapper/vg0-vol0 on /=
 type ext4<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; (rw=
,noatime,nodiratime,errors=3Dremount-ro,discard,commit=3D0)<br />&gt; <br /=
>&gt; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <b=
r />&gt; &gt;&gt; If the discards aren&#39;t working then ext4 will print a=
 warning and stop<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; i=
ssuing them, see: http://git.kernel.org/linus/a30eec2a8650a77f7<br />&gt; <=
br />&gt; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;<br />&gt=
; <br />&gt; &gt;&gt; So if you don&#39;t see &quot;discard not supported, =
disabling&quot; in your dmesg (or<br />&gt; <br />&gt; &gt;<br />&gt; <br /=
>&gt; &gt;&gt; /var/log/messages) then TRIM is likely working as expected.<=
br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &g=
t;<br />&gt; <br />&gt; &gt;&gt; &gt; I found directions on various sites l=
ike:<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt;<br />&gt;=
 <br />&gt; &gt;&gt; http://duopetalflower.blogspot.com/2010/11/enterprise-=
kernel-6-has-ssd-trim.html<br />&gt; <br />&gt; &gt;&gt;<br />&gt; <br />&g=
t; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; on how to confirm if TRIM is wor=
king. I ran (as root):<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&=
gt; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; dd if=
=3D/dev/urandom of=3Dtempfile count=3D100 bs=3D512k oflag=3Ddirect<br />&gt=
; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; hdparm --fibmap tempfi=
le<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; (then took =
the first begin_LBA)<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt=
; &gt; hdparm --read-sector 191710208 /dev/sda<br />&gt; <br />&gt; &gt;<br=
 />&gt; <br />&gt; &gt;&gt; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />=
&gt; &gt;&gt; &gt; and it printed:<br />&gt; <br />&gt; &gt;<br />&gt; <br =
/>&gt; &gt;&gt; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt=
; &gt; /dev/sda:<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &g=
t; reading sector 191710208: succeeded<br />&gt; <br />&gt; &gt;<br />&gt; =
<br />&gt; &gt;&gt; &gt; 3254 3a32 3834 313a 2b36 3030 303a 2030<br />&gt; =
<br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; 4544 5542 2047 3728 3a29=
 5320 7661 6e69<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt=
; 2067 6e69 6564 2078 6f66 2072 7270 646f<br />&gt; <br />&gt; &gt;<br />&g=
t; <br />&gt; &gt;&gt; &gt; ............<br />&gt; <br />&gt; &gt;<br />&gt=
; <br />&gt; &gt;&gt; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &=
gt;&gt; &gt; Then I ran:<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt=
;&gt; &gt; rm tempfile<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&=
gt; &gt; sync<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; =
hdparm --read-sector 191710208 /dev/sda<br />&gt; <br />&gt; &gt;<br />&gt;=
 <br />&gt; &gt;&gt; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &g=
t;&gt; &gt; and it still returned:<br />&gt; <br />&gt; &gt;<br />&gt; <br =
/>&gt; &gt;&gt; &gt; /dev/sda:<br />&gt; <br />&gt; &gt;<br />&gt; <br />&g=
t; &gt;&gt; &gt; reading sector 191710208: succeeded<br />&gt; <br />&gt; &=
gt;<br />&gt; <br />&gt; &gt;&gt; &gt; 3254 3a32 3834 313a 2b36 3030 303a 2=
030<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; 4544 5542 =
2047 3728 3a29 5320 7661 6e69<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt=
; &gt;&gt; &gt; 2067 6e69 6564 2078 6f66 2072 7270 646f<br />&gt; <br />&gt=
; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; .............<br />&gt; <br />&gt=
; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt;<br />&gt; <br />&gt; &gt;<br />&g=
t; <br />&gt; &gt;&gt; &gt; If TRIM is working, the sector is supposed to c=
ontain all zeros.<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;<br />=
&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; That is only if the SSD =
implements TRIM so that it zeroes the discarded<br />&gt; <br />&gt; &gt;<b=
r />&gt; <br />&gt; &gt;&gt; blocks. You can check if the device at least k=
nows enough to report<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&g=
t; discard_zeroes_data:<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;=
<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; cat /sys/block/sda=
/queue/discard_zeroes_data<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &=
gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; Also, even if t=
he SSD does zero, it may take some time -- well after the<br />&gt; <br />&=
gt; &gt;<br />&gt; <br />&gt; &gt;&gt; discard has completed -- for the SSD=
 to actually zero the blocks (this<br />&gt; <br />&gt; &gt;<br />&gt; <br =
/>&gt; &gt;&gt; is true of some lesser quality SSDs).<br />&gt; <br />&gt; =
&gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />&g=
t; &gt;&gt; &gt; Am I doing something wrong or do I need to do something mo=
re to get<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; &gt; LVM =
to pass down the TRIM command?<br />&gt; <br />&gt; &gt;<br />&gt; <br />&g=
t; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; LVM (device=
 mapper specifically) passes discards perfectly well. But<br />&gt; <br />&=
gt; &gt;<br />&gt; <br />&gt; &gt;&gt; the snapshot and dm-crypt targets do=
n&#39;t have discard support. All other<br />&gt; <br />&gt; &gt;<br />&gt;=
 <br />&gt; &gt;&gt; targets do have discard support. What is your output f=
or: dmsetup table<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;<br />=
&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;&gt; Mike<br />&gt; <br />&gt=
; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt;<br />&gt; <br />=
&gt; &gt;<br />&gt; <br />&gt; &gt; I get 0 back when I do &quot;cat /sys/b=
lock/sda/queue/discard_zeroes_data&quot; so does<br />&gt; <br />&gt; &gt; =
this mean that my drive doesn&#39;t zero out the TRIMed blocks? I don&#39;t=
 really<br />&gt; <br />&gt; &gt; care if it does or does not, I just want =
to make sure the drive is getting the<br />&gt; <br />&gt; &gt; TRIM comman=
ds as the benchmarks I&#39;ve seen show performance degradation if they<br =
/>&gt; <br />&gt; &gt; aren&#39;t used.<br />&gt; <br />&gt; <br />&gt; <br=
 />&gt; As I&#39;ve the same drive - what kind of performance degradation d=
o you see?<br />&gt; <br />&gt; <br />&gt; <br />&gt; Note: this drive (unl=
ike many others) is processing TRIM command on<br />&gt; <br />&gt; backgro=
und. So &#39;traditional&#39; benchmark do not provide valuable results.<br=
 />&gt; <br />&gt; (As we&#39;ve been evaluating this drive somewhat to com=
pare with Intel).<br />&gt; <br />&gt; <br />&gt; <br />&gt; Outcome is - w=
hen you issue TRIM command - it&#39;s immediately finished - but the<br />&=
gt; <br />&gt; performance of drive is temporarily decreased while the driv=
e is performing<br />&gt; <br />&gt; block trimming for some time. =A0Thus =
you might get &#39;impressive&#39; results when<br />&gt; <br />&gt; some b=
enchmarks are evaluating TRIM performance ;)<br />&gt; <br />&gt; <br />&gt=
; <br />&gt; Zdenek<br />&gt; <br />&gt; <br /><br />I may not have been cl=
ear, but the benchmarks I am referring to show the performance degradation =
if you are *not* using TRIM (i.e. just relying on the drive&#39;s internal =
garbage collector). Which is why I want to make sure the TRIM is working so=
 it doesn&#39;t get into this poor state.<br /><br />Nick
--bcaec51d23ca2a6b9604a0ce99d5--
