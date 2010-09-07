Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o87GjejX021172
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2010 12:45:41 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o87GjR5V017873
	for <linux-lvm@redhat.com>; Tue, 7 Sep 2010 12:45:28 -0400
Received: by wyf22 with SMTP id 22so5197851wyf.33
	for <linux-lvm@redhat.com>; Tue, 07 Sep 2010 09:45:27 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 8 Sep 2010 00:45:24 +0800
Message-ID: <AANLkTikbz3mxVyaXtE_gavc3ri-4Y7TJTWmCXxcDkbT=@mail.gmail.com>
From: James Corteciano <james@linux-source.org>
Content-Type: multipart/alternative; boundary=0016363b98f6a695ea048fae1f89
Subject: [linux-lvm] Either the superblock or the partition table is likely
	to be corrupted
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
To: linux-lvm@redhat.com

--0016363b98f6a695ea048fae1f89
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I have volume group called "vg-nfs1" and it is controlled by RHCS
(rhcs-nfs1) to mount in rhcs-node1 server. This group has 3 logical volumes
namely lv-wf1 (160G), lv-wf2 (20G), and lv-dev (10G).

Now I have plan to reduce lv-wf1 into 70G and lv-wf2 increase into 30G.
These are the steps I did:
1) Umount /nfs/lv-wf1, /nfs/lv-wf2, and /nfs/lv-dev but I can't unmounted
them because message said "device busy". Since it's running in RHCS, I use
"clusvcadm -s rhcs-nfs1" and the service is stop successfully.

2) I run system-config-lvm and reduce lv-wf1 from 160G to 70G and increased
lv-wf2 from 10G to 30G.

Now, when I run the rhcs-nfs1 service using the command "clusvcadm -e
rhcs-nfs1 -m rhcs-node1", I got failed result. I have checked the
/var/log/messages and this is the output.

--------------------------------------------------------------
clurgmgrd: [7981]: <err> 'fsck -p /dev/vg-nfs1/lv-wf1' failed, error=4;
check /tmp/fs-wf1-fs.fsck.log.e24076 for errors
clurgmgrd[7981]: <warning> #68: Failed to start service:rhcs-nfs1; return
value: 1
multipathd: dm-18: remove map (uevent)
multipathd: dm-19: remove map (uevent)
multipathd: dm-20: remove map (uevent)
clurgmgrd[7981]: <warning> #71: Relocating failed service service:rhcs-nfs1
--------------------------------------------------------------

When I check the /tmp/fs-wf1-fs.fsck.log.e24076, this is the output:

--------------------------------------------------------------
fsck 1.39 (29-May-2006)
/dev/vg-nfs1/lv-wf1: The filesystem size (according to the superblock) is
41943040 blocks
The physical size of the device is 18350080 blocks
Either the superblock or the partition table is likely to be corrupt!

/dev/vg-nfs1/lv-wf1: UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY.
        (i.e., without -a or -p options)
--------------------------------------------------------------

# ll -d /dev/vg-nfs1/lv-wf1
ls: /dev/vg-nfs1/lv-wf1: No such file or directory


I hope anyone could help me to rectify this.

Thank you.

Regards,
James

--0016363b98f6a695ea048fae1f89
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi All,<div><br></div><div>I have volume group called &quot;vg-nfs1&quot; a=
nd it is controlled by RHCS (rhcs-nfs1) to mount in rhcs-node1 server. This=
 group has 3 logical volumes namely lv-wf1 (160G), lv-wf2 (20G), and lv-dev=
 (10G).</div>
<div><br></div><div>Now I have plan to reduce lv-wf1 into 70G and lv-wf2 in=
crease into 30G. These are the steps I did:</div><div>1) Umount /nfs/lv-wf1=
, /nfs/lv-wf2, and /nfs/lv-dev but I can&#39;t unmounted them because messa=
ge said &quot;device busy&quot;. Since it&#39;s running in RHCS, I use &quo=
t;clusvcadm -s rhcs-nfs1&quot; and the service is stop successfully.</div>
<div><br></div><div>2) I run system-config-lvm and reduce lv-wf1 from 160G =
to 70G and increased lv-wf2 from 10G to 30G.=A0</div><div><br></div><div>No=
w, when I run the rhcs-nfs1 service using the command &quot;clusvcadm -e rh=
cs-nfs1 -m rhcs-node1&quot;, I got failed result. I have checked the /var/l=
og/messages and this is the output.</div>
<div><br></div><div>-------------------------------------------------------=
-------</div><div>clurgmgrd: [7981]: &lt;err&gt; &#39;fsck -p /dev/vg-nfs1/=
lv-wf1&#39; failed, error=3D4; check /tmp/fs-wf1-fs.fsck.log.e24076 for err=
ors</div>
<div>clurgmgrd[7981]: &lt;warning&gt; #68: Failed to start service:rhcs-nfs=
1; return value: 1</div><div>multipathd: dm-18: remove map (uevent)</div><d=
iv>multipathd: dm-19: remove map (uevent)</div><div>multipathd: dm-20: remo=
ve map (uevent)</div>
<div>clurgmgrd[7981]: &lt;warning&gt; #71: Relocating failed service servic=
e:rhcs-nfs1</div><div>-----------------------------------------------------=
---------</div><div><br></div><div>When I check the=A0/tmp/fs-wf1-fs.fsck.l=
og.e24076, this is the output:</div>
<div><br></div><div>-------------------------------------------------------=
-------</div><div><div>fsck 1.39 (29-May-2006)</div><div>/dev/vg-nfs1/lv-wf=
1: The filesystem size (according to the superblock) is 41943040 blocks</di=
v>
<div>The physical size of the device is 18350080 blocks</div><div>Either th=
e superblock or the partition table is likely to be corrupt!</div><div><br>=
</div><div>/dev/vg-nfs1/lv-wf1: UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY=
.</div>
<div>=A0=A0 =A0 =A0 =A0(i.e., without -a or -p options)</div></div><div>---=
-----------------------------------------------------------</div><div><br><=
/div><div><div># ll -d /dev/vg-nfs1/lv-wf1</div><div>ls: /dev/vg-nfs1/lv-wf=
1: No such file or directory</div>
</div><div><br></div><div><br></div><div>I hope anyone could help me to rec=
tify this.</div><div><br></div><div>Thank you.</div><div><br></div><div>Reg=
ards,</div><div>James</div><div><br></div>

--0016363b98f6a695ea048fae1f89--
