Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p55Clp8O011068
	for <linux-lvm@redhat.com>; Sun, 5 Jun 2011 08:47:51 -0400
Received: from mail-pw0-f46.google.com (mail-pw0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p55ClooT009194
	for <linux-lvm@redhat.com>; Sun, 5 Jun 2011 08:47:50 -0400
Received: by pwi15 with SMTP id 15so2243343pwi.33
	for <linux-lvm@redhat.com>; Sun, 05 Jun 2011 05:47:50 -0700 (PDT)
MIME-Version: 1.0
From: Andreas Schild <andreas@soulboarder.net>
Date: Sun, 5 Jun 2011 14:47:30 +0200
Message-ID: <BANLkTincWCwYQohG4D6uCU9JTZheV9w-wA@mail.gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd2965eff09d504a4f6649f
Subject: [linux-lvm] LVM label lost / system does not boot
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

--000e0cd2965eff09d504a4f6649f
Content-Type: text/plain; charset=UTF-8

Hi
The first part might sound like I am in the wrong group, but bear with me...
(I probably am, but I googled up and down RAID and LVM lists and I am still
 stuck):
I have a software RAID 5 with 4 disks and LVM on top. I had one volume group
with two logical volumes (for root and data).
I wanted to upgrade capacity and started by failing a drive, replacing it
with a bigger one and let the RAID resync. Worked fine for the first disk.
The second disk apparently worked (resynced, all looked good), but after a
reboot the system hung.
After some back and forth with superblocks (on the devices, never on the
array) I was able to re-assemble the array clean.
The system still does not reboot though: "Volume group "cmain" not found".

I booted a live cd, assembled the array and did a pvck on the array
(/dev/md0):
"Could not find LVM label on /dev/md0"
pvdisplay /dev/md0 results in:
  No physical volume label read from /dev/md0
  Failed to read physical volume "/dev/md0"

I do not have a backup of my /etc/ and therefore no details regarding the
configuration of the LVM setup (yes, I know...)
All I have of the broken system is the /boot partition with its content

Several questions arise:
- Is it possible to "reconstitute" the LVM with what I have?
- Is the RAID array really ok, or is it possibly corrupt to begin with (and
the reason no LVM labels are around)?
- Should I try to reconstruct with pvcreate/vgcreate? (I shied away from any
*create commands to not make things worse.)
- If all is lost, what did I do wrong and what would I need to backup for a
next time?

Any ideas on how I could get the data back would greatly be appreciated. I
am in way over my head, so if somebody knowledgeable tells me: "you lost,
move on" would be bad, but at least would save me some time...

Thanks,
Andreas

--000e0cd2965eff09d504a4f6649f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi<div>The first part might sound like I am in the wrong group, but bear wi=
th me...</div><div>(I probably am, but I googled up and down RAID and LVM l=
ists and I am still =C2=A0stuck):</div><div>I have a=C2=A0software RAID 5 w=
ith 4 disks and LVM on top. I had one volume group with two logical volumes=
 (for root and data).</div>

<div>I wanted to upgrade capacity and started by failing a drive, replacing=
 it with a bigger one and let the RAID resync. Worked fine for the first di=
sk. The second disk apparently worked (resynced, all looked good), but afte=
r a reboot the system hung.</div>

<div>After some back and forth with superblocks (on the devices, never on t=
he array) I was able to re-assemble the array clean.</div><div>The system s=
till does not reboot though: &quot;Volume group &quot;cmain&quot; not found=
&quot;.</div>

<div><br></div><div>I booted a live cd, assembled the array and did a pvck =
on the array (/dev/md0):</div><div>&quot;Could not find LVM label on /dev/m=
d0&quot;</div><div><div>pvdisplay /dev/md0 results in:</div><div>=C2=A0 No =
physical volume label read from /dev/md0</div>

<div>=C2=A0 Failed to read physical volume &quot;/dev/md0&quot;</div></div>=
<div><br></div><div>I do not have a backup of my /etc/ and therefore no det=
ails regarding the configuration of the LVM setup (yes, I know...)</div><di=
v>

All I have of the broken system is the /boot partition with its content</di=
v><div><br></div><div>Several questions arise:</div><div>- Is it possible t=
o &quot;reconstitute&quot; the LVM with what I have?</div><div>- Is the RAI=
D array really ok, or is it possibly corrupt to begin with (and the reason =
no LVM labels are around)?</div>

<div>- Should I try to reconstruct with pvcreate/vgcreate? (I shied away fr=
om any *create commands to not make things worse.)</div><div>- If all is lo=
st, what did I do wrong and what would I need to backup for a next time?</d=
iv>

<div><br></div><div>Any ideas on how I could get the data back would greatl=
y be appreciated. I am in way over my head, so if somebody knowledgeable te=
lls me: &quot;you lost, move on&quot; would be bad, but at least would save=
 me some time...</div>

<div><br></div><div>Thanks,</div><div>Andreas</div><div><br></div>

--000e0cd2965eff09d504a4f6649f--
