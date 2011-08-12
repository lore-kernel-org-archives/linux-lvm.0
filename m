Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7CG5YtA005901
	for <linux-lvm@redhat.com>; Fri, 12 Aug 2011 12:05:34 -0400
Received: from mail-yi0-f46.google.com (mail-yi0-f46.google.com
	[209.85.218.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7CG5XqY013032
	for <linux-lvm@redhat.com>; Fri, 12 Aug 2011 12:05:33 -0400
Received: by yie30 with SMTP id 30so2563284yie.33
	for <linux-lvm@redhat.com>; Fri, 12 Aug 2011 09:05:33 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 12 Aug 2011 19:05:31 +0300
Message-ID: <CAA-yEOLgSqD7N5C773M=54CmVy8=aYybkw1AWOhWmZgc+ET68Q@mail.gmail.com>
From: Pasha Z <free.lan.c2.718r@gmail.com>
Content-Type: multipart/mixed; boundary=90e6ba3fcd6537180804aa5115fe
Subject: [linux-lvm] lvm hangup on snapshot overflow
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

--90e6ba3fcd6537180804aa5115fe
Content-Type: multipart/alternative; boundary=90e6ba3fcd6537180404aa5115fc

--90e6ba3fcd6537180404aa5115fc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello everyone!

Well, the issue first =E2=80=93 lvm hangs up on sync command after snapshot
overflow.


How to reproduce the problem

You can do that with the script =E2=80=93 test.sh, which is in the attachme=
nts. It
may appear rather big, but that's primarily due to debug messages - in fact
It's quite simple. First it creates physical volume on a chosen physical
disk, creates volume group and 2 logical volumes. One of them is the
original LV that we write data to and the other one reserved for a snapshot=
.
Later it mounts the original volume, converts the second LV to a snapshot
and writes data to the origin LV in the amount that would make the next
snapshot overflow. Then sync is executed. Afterwards another logical volume
is created and converted to snapshot. sync. This sync hangs up.

It is advised to perform tests in virtual environment, because besides othe=
r
reasons, you won't be able to reboot normally. When you run the script for
the next time after a reboot it will take care of the old stuff =E2=80=93 t=
he
required commands are at the very beginning of the script.


 And this is what we have so far

We started off here: *
http://www.redhat.com/archives/dm-devel/2011-May/msg00059.html*, but after =
a
bunch of tests came to a conclusion that it is neither the kernel version,
nor its configuration or file system that has an impact on hangup. By now w=
e
know that this issue occurs on all versions of lvm past 2.02.56 (2.02.57
fails). An interesting fact is that when we built the most verbose version
of kernel possible (meaning the amount of kernel logs) and the system becam=
e
real slow the newer version (2.02.57), that had previously hung up, -
passed! Based on this we think there might be an overrun present that leads
to a deadlock.

For now there are two basic errors:

--------------------

lvconvert device-mapper: suspend ioctl failed: Input/output error

lvconvert Unable to suspend VG-sn_x (252:3)

lvconvert Failed to suspend origin lv

------- and --------

LV VG/sn_x in use: not deactivating

Couldn't deactivate LV sn_x

--------------------

The first one always precedes the hang up, while the second one doesn't
appear every time, but always comes first of the two and can appear multipl=
e
times before the first error. In both cases _lock_vol. returns 0.

As of the second error. The function lvconvert_snapshot fails, reporting
=E2=80=9CCouldn't deactivate LV sn_x=E2=80=9D, because info.open_count is n=
ot equal to zero.
That's indicated by =E2=80=9CLV VG/sn_x in use: not deactivating=E2=80=9D e=
rror. The value
of info.open_count is clearly set to 1 with the lv_info function, but seems
to be never cleared - the value of info.open_count is set to the value of a
field, stored in dm_ioctl struct, which is a member of dm_task struct, but =
I
couldn't find were it is assigned.


Things get much more complicated due to inability to use a debugger, so an
attending question would be =E2=80=93 how do you properly build lvm to get =
debugging
symbols on? Right now lvm wouldn't build with debug symbols even though
configuration script is provided with appropriate option and it's proved to
be applied, while building (configuration log says it's on and the
corresponding option (-g) is added to the list of flags, passed to gcc).


 Attachment description

It the attached archive you will find the following files:

kernel_logs - kernel logs after each tool invocation, retrieved by dmesg -c=
.

lvm.conf - lvm configuration file that we have used

lvm2.log - lvm logs with debug level set to 7

output_logs - 2 versions: neat and verbose. The difference is that verbose
contains commands performed (set -x)

test.sh - the main test-script

remove.sh - a portion of test.sh responsible for cleanup (sometimes
convenient to have separate)


 We continue to study the problem, but any help or guidance from people, ho=
w
are familiar with the structure and code of lvm would be highly appreciated=
.
Thanks a lot!

--90e6ba3fcd6537180404aa5115fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


=09
=09
=09


<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
=09
=09
=09


</p><p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; =
line-height: 150%">Hello everyone!</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
Well, the issue first =E2=80=93 lvm hangs up on sync command after snapshot
overflow.</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%"><br></p><p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; m=
argin-bottom: 0cm; line-height: 150%">How to reproduce the problem</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
You can do that with the script =E2=80=93 test.sh, which is in the
attachments. It may appear rather big, but that&#39;s primarily due to
debug messages - in fact It&#39;s quite simple. First it creates physical
volume on a chosen physical disk, creates volume group and 2 logical
volumes. One of them is the original LV that we write data to and the
other one reserved for a snapshot. Later it mounts the original
volume, converts the second LV to a snapshot and writes data to the
origin LV in the amount that would make the next snapshot overflow.
Then sync is executed. Afterwards another logical volume is created
and converted to snapshot. sync. This sync hangs up.</p><p align=3D"JUSTIFY=
" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line-height: 150%">It i=
s advised to perform tests in virtual environment, because
besides other reasons, you won&#39;t be able to reboot normally. When you
run the script for the next time after a reboot it will take care of
the old stuff =E2=80=93 the required commands are at the very beginning of
the script.</p><p></p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
<br>
</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
And this is what we have so far</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
We started off here:
<font color=3D"#000080"><span lang=3D"zxx"><u><a href=3D"http://www.redhat.=
com/archives/dm-devel/2011-May/msg00059.html">http://www.redhat.com/archive=
s/dm-devel/2011-May/msg00059.html</a></u></span></font>,
but after a bunch of tests came to a conclusion that it is neither
the kernel version, nor its configuration or file system that has an
impact on hangup. By now we know that this issue occurs on all
versions of lvm past 2.02.56 (2.02.57 fails). An interesting fact is
that when we built the most verbose version of  kernel possible
(meaning the amount of kernel logs) and the system became real slow
the newer version (2.02.57), that had previously hung up, - passed!
Based on this we think there might be an overrun present that leads
to a deadlock.</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
For now there are two basic errors:</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
--------------------</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
lvconvert  device-mapper: suspend ioctl failed: Input/output error</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
lvconvert  Unable to suspend VG-sn_x (252:3)</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
lvconvert  Failed to suspend origin lv</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
------- and --------</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
LV VG/sn_x in use: not deactivating</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
Couldn&#39;t deactivate LV sn_x</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
--------------------</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
The first one always precedes the hang up, while the second one
doesn&#39;t appear every time, but always comes first of the two and can
appear multiple times before the first error.  In both cases
_lock_vol. returns 0.</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
As of the second error. The function lvconvert_snapshot fails,
reporting =E2=80=9CCouldn&#39;t deactivate LV sn_x=E2=80=9D, because info.o=
pen_count
is not equal to zero. That&#39;s indicated by =E2=80=9CLV VG/sn_x in use: n=
ot
deactivating=E2=80=9D error. The value of info.open_count is clearly set to
1 with the <font color=3D"#000000">lv_info function, but
seems to be never cleared - the value of info.open_count is set to
the value of a field, stored in dm_ioctl struct, which is a member of
dm_task struct, but I couldn&#39;t find were it is assigned.</font></p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%"><br></p><p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; m=
argin-bottom: 0cm; line-height: 150%">Things get much more complicated due =
to inability to use a debugger,
so an attending question would be =E2=80=93 how do you properly build lvm
to get debugging symbols on? Right now lvm wouldn&#39;t build with debug
symbols even though configuration script is provided with appropriate
option and it&#39;s proved to be applied, while building (configuration
log says it&#39;s on and the corresponding option (-g) is added to the
list of flags, passed to gcc).</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%">
<br>
</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%; text-decoration: none">
Attachment description</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%; text-decoration: none">
It the attached archive you will find the following files:</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%; text-decoration: none">
kernel_logs	-	kernel logs after each tool invocation, retrieved by
dmesg -c.</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%; text-decoration: none">
lvm.conf	-	lvm configuration file that we have used</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%; text-decoration: none">
lvm2.log	-	lvm logs with debug level set to 7</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%; text-decoration: none">
output_logs	-	2 versions: neat and verbose. The difference is that
verbose contains commands performed (set -x)</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%; text-decoration: none">
test.sh		-	the main test-script</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%; text-decoration: none">
remove.sh	-	a portion of test.sh responsible for cleanup (sometimes
convenient to have separate)</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%; text-decoration: none">
<br>
</p>
<p align=3D"JUSTIFY" style=3D"text-indent: 1.25cm; margin-bottom: 0cm; line=
-height: 150%; text-decoration: none">
We continue to study the problem, but any help or guidance from
people, how are familiar with the structure and code of lvm would be
highly appreciated. Thanks a lot!</p>

--90e6ba3fcd6537180404aa5115fc--

--90e6ba3fcd6537180804aa5115fe
Content-Type: application/x-gzip; name="lvm-test.tar.gz"
Content-Disposition: attachment; filename="lvm-test.tar.gz"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gr9clb0h0

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
--90e6ba3fcd6537180804aa5115fe--
