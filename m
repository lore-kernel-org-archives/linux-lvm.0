Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBD1VcTA021615
	for <linux-lvm@redhat.com>; Wed, 12 Dec 2007 20:31:38 -0500
Received: from hs-out-2122.google.com (hs-out-0708.google.com [64.233.178.242])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBD1VHBX001917
	for <linux-lvm@redhat.com>; Wed, 12 Dec 2007 20:31:17 -0500
Received: by hs-out-2122.google.com with SMTP id k27so458862hsc.3
	for <linux-lvm@redhat.com>; Wed, 12 Dec 2007 17:31:17 -0800 (PST)
Message-ID: <1f31f75c0712121731v5de43eb9ucf7c2ba2b86b9763@mail.gmail.com>
Date: Wed, 12 Dec 2007 20:31:16 -0500
From: "Null EXE" <nullexe@gmail.com>
Subject: Re: [linux-lvm] lvm raid failure
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_10060_16792602.1197509477195"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

------=_Part_10060_16792602.1197509477195
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>
>
> ------------------------------
>
> Message: 6
> Date: Mon, 10 Dec 2007 21:42:45 -0500
> From: "Null EXE" <nullexe@gmail.com>
> Subject: [linux-lvm] lvm raid failure
> To: linux-lvm@redhat.com
> Message-ID:
>        <1f31f75c0712101842q4d71c03bu75926f1deb026a26@mail.gmail.com>
> Content-Type: text/plain; charset="iso-8859-1"
>
> Hi everyone,
>
>
> I have been running an Edgy fileserver for about 6 months now. When I came
> home from work last week I found my files all inaccessible. After
> investigation I found issues with my PV. I would like to recover my data
> and
> replace the drives if possible any help is greatly appreciated!
>
> I have one system drive and 6 storage drive, all raid1. The storage layout
> is
> 2x160GB /dev/md0
> 2x250GB /dev/md1
> 2x250GB /dev/md2
> After investigation I found problems with my lvm. pvdisplay showed:
> Couldn't find device with uuid 'xjWU5M-G3WB-tZjB-Tyrk-Q7rN-Yide-1FEVh3'.
>
> I ran the command:
> sudo pvcreate --uuid "xjWU5M-G3WB-tZjB-Tyrk-Q7rN-Yide-1FEVh3"
> --restorefile
> /etc/lvm/archive/fileserver_00006.vg /dev/md2
>
> This seemed to recover /dev/md2. I re-ran pvdisplay and got
> Couldn't find device with uuid '1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo'.
>
> I figured I could run the same command on md1,
> sudo pvcreate --uuid "1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo"
> --restorefile
> /etc/lvm/archive/fileserver_00006.vg /dev/md1
>
> and got the message:
> Couldn't find device with uuid '1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo'.
> Device /dev/md1 not found (or ignored by filtering).
>
> After re-executing the above command with -vvv at the bottom of the output
> I
> get the following message:
> #device/dev-io.c:439         Opened /dev/md1 RO
> #device/dev-io.c:264       /dev/md1: size is 0 sectors
> #filters/filter.c:106         /dev/md1: Skipping: Too small to hold a PV
> #device/dev-io.c:485         Closed /dev/md1
> #pvcreate.c:81   Device /dev/md1 not found (or ignored by filtering).
>
> Here is my pvdisplay. Again, any help is Greatly appreciated
> ***START***
>
> Couldn't find device with uuid '1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo'.
> Couldn't find device with uuid '1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo'.
> --- Physical volume ---
> PV Name /dev/md0
> VG Name fileserver
> PV Size 149.05 GB / not usable 0
> Allocatable yes
> PE Size (KByte) 4096
> Total PE 38156
> Free PE 9996
> Allocated PE 28160
> PV UUID pZV1Ff-Y7fu-S8m1-tVFn-fOMJ-VRls-fLFEov
>
> --- Physical volume ---
> PV Name unknown device
> VG Name fileserver
> PV Size 232.88 GB / not usable 0
> Allocatable yes (but full)
> PE Size (KByte) 4096
> Total PE 59618
> Free PE 0
> Allocated PE 59618
> PV UUID 1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo
>
> --- Physical volume ---
> PV Name /dev/md2
> VG Name fileserver
> PV Size 232.88 GB / not usable 0
> Allocatable yes
> PE Size (KByte) 4096
> Total PE 59618
> Free PE 9156
> Allocated PE 50462
> PV UUID xjWU5M-G3WB-tZjB-Tyrk-Q7rN-Yide-1FEVh3
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL:
> https://www.redhat.com/archives/linux-lvm/attachments/20071210/1c987df9/attachment.html
>
> ------------------------------
>
> Message: 7
> Date: Tue, 11 Dec 2007 09:20:29 +0100
> From: Luca Berra <bluca@comedia.it>
> Subject: Re: [linux-lvm] lvm raid failure
> To: linux-lvm@redhat.com
> Message-ID: <20071211082029.GA1535@percy.comedia.it>
> Content-Type: text/plain; charset=us-ascii; format=flowed
>
> On Mon, Dec 10, 2007 at 09:42:45PM -0500, Null EXE wrote:
> >get the following message:
> >#device/dev-io.c:439         Opened /dev/md1 RO
> >#device/dev-io.c:264       /dev/md1: size is 0 sectors
> >#filters/filter.c:106         /dev/md1: Skipping: Too small to hold a PV
> >#device/dev-io.c:485         Closed /dev/md1
> >#pvcreate.c:81   Device /dev/md1 not found (or ignored by filtering).
> >
> >Here is my pvdisplay. Again, any help is Greatly appreciated
> you should investigate what's wrong at the md layer, lvm seems to be
> just a victim.
>
> check
> /proc/mdstat
> kernel-logs
> mdadm.conf
> mdadm -Es
>
> L.
>
> --
> Luca Berra -- bluca@comedia.it
>        Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>  X        AGAINST HTML MAIL
>  / \
>
>
>   ***
/proc/mdstat
Personalities : [raid1]
md2 : active raid1 dm-5[1]
      244195904 blocks [2/1] [_U]

md1 : inactive hdj1[0]
      244195904 blocks super non-persistent

md0 : active raid1 hdc1[0]
      156288256 blocks [2/1] [U_]

unused devices: <none>

/should my dm-5 be displayed or should it be a /dev/hd[a-z] device

***
mdadm -Es
ARRAY /dev/md0 level=raid1 num-devices=2
UUID=eeb0befe:9e50d574:974f5eae:ccb8e527
ARRAY /dev/md2 level=raid1 num-devices=2
UUID=1e5c1ab5:a5a06f84:d722583d:ca0f8cad
ARRAY /dev/md1 level=raid1 num-devices=2
UUID=41fc507e:7293a47c:7f18baeb:89dd5958

***
mdadm.conf
DEVICE partitions

/proc/partitions
   3     0   10022040 hda
   3     1    9574708 hda1
   3     2          1 hda2
   3     5     441756 hda5
  22     0  156290904 hdc
  22     1  156288321 hdc1
  22    64  156290904 hdd
  22    65  156288321 hdd1
  56     0  244198584 hdi
  56     1  244196001 hdi1
  56    64  244198584 hdj
  56    65  244196001 hdj1
  57     0  244198584 hdk
  57     1  244196001 hdk1
  57    64  244198584 hdl
  57    65  244196001 hdl1
   9     0  156288256 md0
   9     2  244195904 md2
 253     0    9574708 dm-0
 253     1     441756 dm-1
 253     2  156288321 dm-2
 253     3  156288321 dm-3
 253     4  244196001 dm-4
 253     5  244196001 dm-5
 253     6  244196001 dm-6
 253     7  244196001 dm-7


***
kernel logs
Nov 28 22:58:46 ark-server kernel: [42949384.540000] raid1: raid set md1
active with 1 out of 2 mirrors
Nov 28 22:58:46 ark-server kernel: [42949384.560000] md: md2 stopped.
Nov 28 22:58:46 ark-server kernel: [42949384.560000] md: bind<hdj1>
Nov 28 22:58:46 ark-server kernel: [42949384.560000] md: hdl1 has same UUID
but different superblock to hdj1
Nov 28 22:58:46 ark-server kernel: [42949384.560000] md: hdl1 has different
UUID to hdj1
Nov 28 22:58:46 ark-server kernel: [42949384.560000] md: export_rdev(hdl1)

***
Looking at all of this.  When I set up the array I remember my devices
ordered with hd[cdefgh] now I'm seeing md1 trying to use hd[jl].  Is this a
problem that it put assigned the drives new letter automatically?

------=_Part_10060_16792602.1197509477195
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div class="gmail_quote"><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><br>------------------------------<br><br>Message: 6<br>Date: Mon, 10 Dec 2007 21:42:45 -0500
<br>From: &quot;Null EXE&quot; &lt;<a href="mailto:nullexe@gmail.com">nullexe@gmail.com</a>&gt;<br>Subject: [linux-lvm] lvm raid failure<br>To: <a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>Message-ID:
<br> &nbsp; &nbsp; &nbsp; &nbsp;&lt;<a href="mailto:1f31f75c0712101842q4d71c03bu75926f1deb026a26@mail.gmail.com">1f31f75c0712101842q4d71c03bu75926f1deb026a26@mail.gmail.com</a>&gt;<br>Content-Type: text/plain; charset=&quot;iso-8859-1&quot;<br>
<br>Hi everyone,<br><br><br>I have been running an Edgy fileserver for about 6 months now. When I came<br>home from work last week I found my files all inaccessible. After<br>investigation I found issues with my PV. I would like to recover my data and
<br>replace the drives if possible any help is greatly appreciated!<br><br>I have one system drive and 6 storage drive, all raid1. The storage layout<br>is<br>2x160GB /dev/md0<br>2x250GB /dev/md1<br>2x250GB /dev/md2<br>After investigation I found problems with my lvm. pvdisplay showed:
<br>Couldn&#39;t find device with uuid &#39;xjWU5M-G3WB-tZjB-Tyrk-Q7rN-Yide-1FEVh3&#39;.<br><br>I ran the command:<br>sudo pvcreate --uuid &quot;xjWU5M-G3WB-tZjB-Tyrk-Q7rN-Yide-1FEVh3&quot; --restorefile<br>/etc/lvm/archive/fileserver_00006.vg /dev/md2
<br><br>This seemed to recover /dev/md2. I re-ran pvdisplay and got<br>Couldn&#39;t find device with uuid &#39;1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo&#39;.<br><br>I figured I could run the same command on md1,<br>sudo pvcreate --uuid &quot;1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo&quot; --restorefile
<br>/etc/lvm/archive/fileserver_00006.vg /dev/md1<br><br>and got the message:<br>Couldn&#39;t find device with uuid &#39;1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo&#39;.<br>Device /dev/md1 not found (or ignored by filtering).
<br><br>After re-executing the above command with -vvv at the bottom of the output I<br>get the following message:<br>#device/dev-io.c:439 &nbsp; &nbsp; &nbsp; &nbsp; Opened /dev/md1 RO<br>#device/dev-io.c:264 &nbsp; &nbsp; &nbsp; /dev/md1: size is 0 sectors
<br>#filters/filter.c:106 &nbsp; &nbsp; &nbsp; &nbsp; /dev/md1: Skipping: Too small to hold a PV<br>#device/dev-io.c:485 &nbsp; &nbsp; &nbsp; &nbsp; Closed /dev/md1<br>#pvcreate.c:81 &nbsp; Device /dev/md1 not found (or ignored by filtering).<br><br>Here is my pvdisplay. Again, any help is Greatly appreciated
<br>***START***<br><br>Couldn&#39;t find device with uuid &#39;1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo&#39;.<br>Couldn&#39;t find device with uuid &#39;1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo&#39;.<br>--- Physical volume ---
<br>PV Name /dev/md0<br>VG Name fileserver<br>PV Size 149.05 GB / not usable 0<br>Allocatable yes<br>PE Size (KByte) 4096<br>Total PE 38156<br>Free PE 9996<br>Allocated PE 28160<br>PV UUID pZV1Ff-Y7fu-S8m1-tVFn-fOMJ-VRls-fLFEov
<br><br>--- Physical volume ---<br>PV Name unknown device<br>VG Name fileserver<br>PV Size 232.88 GB / not usable 0<br>Allocatable yes (but full)<br>PE Size (KByte) 4096<br>Total PE 59618<br>Free PE 0<br>Allocated PE 59618
<br>PV UUID 1ATm8s-oxKG-nz0p-z1QA-a0s4-od9T-AMZRoo<br><br>--- Physical volume ---<br>PV Name /dev/md2<br>VG Name fileserver<br>PV Size 232.88 GB / not usable 0<br>Allocatable yes<br>PE Size (KByte) 4096<br>Total PE 59618<br>
Free PE 9156<br>Allocated PE 50462<br>PV UUID xjWU5M-G3WB-tZjB-Tyrk-Q7rN-Yide-1FEVh3<br>-------------- next part --------------<br>An HTML attachment was scrubbed...<br>URL: <a href="https://www.redhat.com/archives/linux-lvm/attachments/20071210/1c987df9/attachment.html" target="_blank">
https://www.redhat.com/archives/linux-lvm/attachments/20071210/1c987df9/attachment.html</a><br><br>------------------------------<br><br>Message: 7<br>Date: Tue, 11 Dec 2007 09:20:29 +0100<br>From: Luca Berra &lt;<a href="mailto:bluca@comedia.it">
bluca@comedia.it</a>&gt;<br>Subject: Re: [linux-lvm] lvm raid failure<br>To: <a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>Message-ID: &lt;<a href="mailto:20071211082029.GA1535@percy.comedia.it">20071211082029.GA1535@percy.comedia.it
</a>&gt;<br>Content-Type: text/plain; charset=us-ascii; format=flowed<br><br>On Mon, Dec 10, 2007 at 09:42:45PM -0500, Null EXE wrote:<br>&gt;get the following message:<br>&gt;#device/dev-io.c:439 &nbsp; &nbsp; &nbsp; &nbsp; Opened /dev/md1 RO
<br>&gt;#device/dev-io.c:264 &nbsp; &nbsp; &nbsp; /dev/md1: size is 0 sectors<br>&gt;#filters/filter.c:106 &nbsp; &nbsp; &nbsp; &nbsp; /dev/md1: Skipping: Too small to hold a PV<br>&gt;#device/dev-io.c:485 &nbsp; &nbsp; &nbsp; &nbsp; Closed /dev/md1<br>&gt;#pvcreate.c:81 &nbsp; Device /dev/md1 not found (or ignored by filtering).
<br>&gt;<br>&gt;Here is my pvdisplay. Again, any help is Greatly appreciated<br>you should investigate what&#39;s wrong at the md layer, lvm seems to be<br>just a victim.<br><br>check<br>/proc/mdstat<br>kernel-logs<br>mdadm.conf
<br>mdadm -Es<br><br>L.<br><br>--<br>Luca Berra -- <a href="mailto:bluca@comedia.it">bluca@comedia.it</a><br> &nbsp; &nbsp; &nbsp; &nbsp;Communication Media &amp; Services S.r.l.<br>&nbsp;/&quot;\<br>&nbsp;\ / &nbsp; &nbsp; ASCII RIBBON CAMPAIGN<br> &nbsp;X &nbsp; &nbsp; &nbsp; &nbsp;AGAINST HTML MAIL
<br>&nbsp;/ \<br><br><br></blockquote></div> &nbsp; ***<br>/proc/mdstat<br>Personalities : [raid1] <br>md2 : active raid1 dm-5[1]<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 244195904 blocks [2/1] [_U]<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>md1 : inactive hdj1[0]<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 244195904 blocks super non-persistent
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>md0 : active raid1 hdc1[0]<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 156288256 blocks [2/1] [U_]<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>unused devices: &lt;none&gt;<br><br>/should my dm-5 be displayed or should it be a /dev/hd[a-z] device<br><br>***<br>mdadm -Es<br>
ARRAY /dev/md0 level=raid1 num-devices=2 UUID=eeb0befe:9e50d574:974f5eae:ccb8e527<br>ARRAY /dev/md2 level=raid1 num-devices=2 UUID=1e5c1ab5:a5a06f84:d722583d:ca0f8cad<br>ARRAY /dev/md1 level=raid1 num-devices=2 UUID=41fc507e:7293a47c:7f18baeb:89dd5958
<br><br>***<br>mdadm.conf<br>DEVICE partitions<br><br>/proc/partitions<br>&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp; 10022040 hda<br>&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp; 9574708 hda1<br>&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1 hda2<br>&nbsp;&nbsp; 3&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp;&nbsp;&nbsp;&nbsp; 441756 hda5<br>&nbsp; 22&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 156290904 hdc<br>
&nbsp; 22&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp; 156288321 hdc1<br>&nbsp; 22&nbsp;&nbsp;&nbsp; 64&nbsp; 156290904 hdd<br>&nbsp; 22&nbsp;&nbsp;&nbsp; 65&nbsp; 156288321 hdd1<br>&nbsp; 56&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 244198584 hdi<br>&nbsp; 56&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp; 244196001 hdi1<br>&nbsp; 56&nbsp;&nbsp;&nbsp; 64&nbsp; 244198584 hdj<br>&nbsp; 56&nbsp;&nbsp;&nbsp; 65&nbsp; 244196001 hdj1<br>&nbsp; 57&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 244198584 hdk
<br>&nbsp; 57&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp; 244196001 hdk1<br>&nbsp; 57&nbsp;&nbsp;&nbsp; 64&nbsp; 244198584 hdl<br>&nbsp; 57&nbsp;&nbsp;&nbsp; 65&nbsp; 244196001 hdl1<br>&nbsp;&nbsp; 9&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp; 156288256 md0<br>&nbsp;&nbsp; 9&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp; 244195904 md2<br>&nbsp;253&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp; 9574708 dm-0<br>&nbsp;253&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp; 441756 dm-1<br>&nbsp;253&nbsp;&nbsp;&nbsp;&nbsp; 2&nbsp; 156288321 dm-2
<br>&nbsp;253&nbsp;&nbsp;&nbsp;&nbsp; 3&nbsp; 156288321 dm-3<br>&nbsp;253&nbsp;&nbsp;&nbsp;&nbsp; 4&nbsp; 244196001 dm-4<br>&nbsp;253&nbsp;&nbsp;&nbsp;&nbsp; 5&nbsp; 244196001 dm-5<br>&nbsp;253&nbsp;&nbsp;&nbsp;&nbsp; 6&nbsp; 244196001 dm-6<br>&nbsp;253&nbsp;&nbsp;&nbsp;&nbsp; 7&nbsp; 244196001 dm-7<br><br><br>***<br>kernel logs<br>Nov 28 22:58:46 ark-server kernel: [42949384.540000
] raid1: raid set md1 active with 1 out of 2 mirrors<br>Nov 28 22:58:46 ark-server kernel: [42949384.560000] md: md2 stopped.<br>Nov 28 22:58:46 ark-server kernel: [42949384.560000] md: bind&lt;hdj1&gt;<br>Nov 28 22:58:46 ark-server kernel: [
42949384.560000] md: hdl1 has same UUID but different superblock to hdj1<br>Nov 28 22:58:46 ark-server kernel: [42949384.560000] md: hdl1 has different UUID to hdj1<br>Nov 28 22:58:46 ark-server kernel: [42949384.560000] md: export_rdev(hdl1)
<br><br>***<br>Looking at all of this.&nbsp; When I set up the array I remember my devices ordered with hd[cdefgh] now I&#39;m seeing md1 trying to use hd[jl].&nbsp; Is this a problem that it put assigned the drives new letter automatically?
<br><br>

------=_Part_10060_16792602.1197509477195--
