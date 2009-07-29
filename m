Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6TCrfSP024840
	for <linux-lvm@redhat.com>; Wed, 29 Jul 2009 08:53:41 -0400
Received: from mail-ew0-f220.google.com (mail-ew0-f220.google.com
	[209.85.219.220])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6TCrRil017171
	for <linux-lvm@redhat.com>; Wed, 29 Jul 2009 08:53:28 -0400
Received: by ewy20 with SMTP id 20so816048ewy.3
	for <linux-lvm@redhat.com>; Wed, 29 Jul 2009 05:53:27 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 29 Jul 2009 14:53:26 +0200
Message-ID: <29ae894c0907290553r5c51b938v4da9a0f944d75af2@mail.gmail.com>
From: brem belguebli <brem.belguebli@gmail.com>
Content-Type: multipart/alternative; boundary=0016e6dbe59a5d990c046fd7ac82
Subject: [linux-lvm] CLVM exclusive mode
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

--0016e6dbe59a5d990c046fd7ac82
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Here's the test I've done :

- Cluster formed of 2 nodes A and B, RHEL5.3 X86_64
- dlm used as lock_manager
- -

Hello,

I've been playing on RHEL 5.3 with CLVM and exclusive activation but the
results I'm getting are not what I'm expecting.

- My cluster is a freshly 2 nodes (node1 and node2) installed cluster with
the packages shipped by RHEL 5.3 X86_64.

- LVM locking type =  3

- a San LUN (/dev/mpath/mpath2) visible from both nodes

- dlm used as lock_manager

Everything starts normally from cman to clvmd.

Below what I'm doing

On node1:

 pvcreate /dev/mpath/mpath2
 vgcreate -c n vg11 /dev/mpath/mpath2

! nothing in /debug/dlm/clvmd_locks on both nodes

  vgchange -a n vg11

! nothing in /debug/dlm/clvmd_locks on both nodes


  vgchange -c y vg11

! nothing in /debug/dlm/clvmd_locks on both nodes, vg seen on both nodes as
clustered.

  vgchange -a ey vg11

! nothing in /debug/dlm/clvmd_locks on both nodes

 lvcreate -n lvol1 -L 6G /dev/vg11

On node1 cat /debug/dlm/clvmd_locks gives:

  6f0001 2 3da0001 2204 0 1 10001 2 1 -1 0 0 64
"iZ8vgn7nBm05aMSo5cfpy63rflTqL2ryr3Xrp1prEGceCkA2dhSA2ENWocunEfdf"
  38a0001 0 0 434 0 1 1 2 1 -1 0 0 64
"iZ8vgn7nBm05aMSo5cfpy63rflTqL2ryr3Xrp1prEGceCkA2dhSA2ENWocunEfdf"

On node2:

  3da0001 1 6f0001 2204 0 1 1 2 1 -1 0 1 64
"iZ8vgn7nBm05aMSo5cfpy63rflTqL2ryr3Xrp1prEGceCkA2dhSA2ENWocunEfdf"

Is there something I'm doing wrong or misunderstand?
I understand that node1 (which actually activated exclusively the vg) sees a
lock on /dev/vg11/lvol1 (uuid corresponding to it) from node id 2 wich is
node2
plus a lock from node id 0 (which seems to be the quorun disk id which is
not configured in my case).

Plus, node2 seems to see the right lock from node1.

I go on:

on both nodes, lvdisplay -v /dev/vg11/lvol1 gives:

...
 LV UUID                r3Xrp1-prEG-ceCk-A2dh-SA2E-NWoc-unEfdf
  LV Write Access        read/write
  LV Status              available
...

Shouldn't it be seen NOT available on node2 ?

Now, on node2:

vgchange -a y vg11 :

 1 logical volume(s) in volume group "vg11" now active <-- vg was supposed
to be held exlusively by node1

cat  /debug/dlm/clvmd_locks gives:

3da0001 1 6f0001 2204 0 1 1 2 1 -1 0 1 64
"iZ8vgn7nBm05aMSo5cfpy63rflTqL2ryr3Xrp1prEGceCkA2dhSA2ENWocunEfdf"

on node1:

6f0001 2 3da0001 2204 0 1 10001 2 1 -1 0 0 64
"iZ8vgn7nBm05aMSo5cfpy63rflTqL2ryr3Xrp1prEGceCkA2dhSA2ENWocunEfdf"
38a0001 0 0 434 0 1 1 2 1 -1 0 0 64
"iZ8vgn7nBm05aMSo5cfpy63rflTqL2ryr3Xrp1prEGceCkA2dhSA2ENWocunEfdf"



I may be missing something in my procedure that makes it do everything
except what I'm expecting.

Any ideas ?

--0016e6dbe59a5d990c046fd7ac82
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Here&#39;s the test I&#39;ve done :</div>
<div>=A0</div>
<div>- Cluster formed of 2 nodes A and B, RHEL5.3 X86_64</div>
<div>- dlm used as lock_manager </div>
<div>- -=A0 </div>
<div>
<p>Hello,</p>
<p>I&#39;ve been playing on RHEL 5.3 with CLVM and exclusive activation but=
 the results I&#39;m getting are not what I&#39;m expecting.</p>
<p>- My cluster is a freshly 2 nodes (node1 and node2) installed cluster wi=
th the packages shipped by RHEL 5.3 X86_64. </p>
<p>- LVM locking type =3D=A0=A03</p>
<p>- a San LUN (/dev/mpath/mpath2) visible from both nodes</p>
<p>- dlm used as lock_manager </p>
<p>Everything starts normally from cman to clvmd.</p>
<p>Below what I&#39;m doing</p>
<p>On node1:</p>
<p>=A0pvcreate /dev/mpath/mpath2<br>=A0vgcreate -c n vg11 /dev/mpath/mpath2=
</p>
<p>! nothing in /debug/dlm/clvmd_locks on both nodes<br>=A0 <br>=A0 vgchang=
e -a n vg11</p>
<p>! nothing in /debug/dlm/clvmd_locks on both nodes</p>
<p><br>=A0 vgchange -c y vg11</p>
<p>! nothing in /debug/dlm/clvmd_locks on both nodes, vg seen on both nodes=
 as clustered.<br>=A0 <br>=A0 vgchange -a ey vg11</p>
<p>! nothing in /debug/dlm/clvmd_locks on both nodes</p>
<p>=A0lvcreate -n lvol1 -L 6G /dev/vg11</p>
<p>On node1 cat /debug/dlm/clvmd_locks gives:</p>
<p>=A0 6f0001 2 3da0001 2204 0 1 10001 2 1 -1 0 0 64 &quot;iZ8vgn7nBm05aMSo=
5cfpy63rflTqL2ryr3Xrp1prEGceCkA2dhSA2ENWocunEfdf&quot;<br>=A0 38a0001 0 0 4=
34 0 1 1 2 1 -1 0 0 64 &quot;iZ8vgn7nBm05aMSo5cfpy63rflTqL2ryr3Xrp1prEGceCk=
A2dhSA2ENWocunEfdf&quot;</p>

<p>On node2: </p>
<p>=A0 3da0001 1 6f0001 2204 0 1 1 2 1 -1 0 1 64 &quot;iZ8vgn7nBm05aMSo5cfp=
y63rflTqL2ryr3Xrp1prEGceCkA2dhSA2ENWocunEfdf&quot;</p>
<p>Is there something I&#39;m doing wrong or misunderstand? <br>I understan=
d that node1 (which actually activated exclusively the vg) sees a lock on /=
dev/vg11/lvol1 (uuid corresponding to it) from node id 2 wich is node2<br>
plus a lock from node id 0 (which seems to be the quorun disk id which is n=
ot configured in my case).</p>
<p>Plus, node2 seems to see the right lock from node1.</p>
<p>I go on:</p>
<p>on both nodes, lvdisplay -v /dev/vg11/lvol1 gives:</p>
<p>...<br>=A0LV UUID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 r3Xrp1-pr=
EG-ceCk-A2dh-SA2E-NWoc-unEfdf<br>=A0 LV Write Access=A0=A0=A0=A0=A0=A0=A0 r=
ead/write<br>=A0 LV Status=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 available=
<br>...</p>
<p>Shouldn&#39;t it be seen NOT available on node2 ?</p>
<p>Now, on node2:</p>
<p>vgchange -a y vg11 :</p>
<p>=A01 logical volume(s) in volume group &quot;vg11&quot; now active &lt;-=
- vg was supposed to be held exlusively by node1</p>
<p>cat=A0 /debug/dlm/clvmd_locks gives:</p>
<p>3da0001 1 6f0001 2204 0 1 1 2 1 -1 0 1 64 &quot;iZ8vgn7nBm05aMSo5cfpy63r=
flTqL2ryr3Xrp1prEGceCkA2dhSA2ENWocunEfdf&quot;</p>
<p>on node1:</p>
<p>6f0001 2 3da0001 2204 0 1 10001 2 1 -1 0 0 64 &quot;iZ8vgn7nBm05aMSo5cfp=
y63rflTqL2ryr3Xrp1prEGceCkA2dhSA2ENWocunEfdf&quot;<br>38a0001 0 0 434 0 1 1=
 2 1 -1 0 0 64 &quot;iZ8vgn7nBm05aMSo5cfpy63rflTqL2ryr3Xrp1prEGceCkA2dhSA2E=
NWocunEfdf&quot;</p>

<p>=A0</p>
<p>I may be missing something in my procedure that makes it do everything e=
xcept what I&#39;m expecting.</p>
<p>Any ideas ?</p></div>

--0016e6dbe59a5d990c046fd7ac82--
