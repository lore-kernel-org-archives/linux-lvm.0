Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6RCQPm8012231
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 08:26:25 -0400
Received: from mail-ew0-f220.google.com (mail-ew0-f220.google.com
	[209.85.219.220])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6RCPFh4032432
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 08:25:57 -0400
Received: by ewy20 with SMTP id 20so3027148ewy.3
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 05:25:15 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 27 Jul 2009 14:25:15 +0200
Message-ID: <29ae894c0907270525v63f0a334n464bb49ea60f71cf@mail.gmail.com>
From: brem belguebli <brem.belguebli@gmail.com>
Content-Type: multipart/alternative; boundary=0016e6d7e744d83df7046faf0bf1
Subject: [linux-lvm] CLVMD Simple method to get who holds a lock in a cluster
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

--0016e6d7e744d83df7046faf0bf1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

In a clustered environment, without GFS, we plan to use CLVMD exclusive
activation of VG's in order to prevent a VG to be activated on more than 1
node at a time.

I've been looking for how to check who holds a lock for a given VG but I
could'nt find no suitable way to do it.

The only way was to activate debug ( mount -t debugfs debug /debug) and cat
/debug/dlm/clvmd_locks.

Is there a way to request dlm (via dlm_tool) to get the lock holding node or
via  any LVM command.

Regards

--0016e6d7e744d83df7046faf0bf1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div>=A0</div>
<div>In a clustered environment, without GFS, we plan to use CLVMD exclusiv=
e activation of VG&#39;s in order to prevent a VG to be activated on more t=
han 1 node at a time.</div>
<div>=A0</div>
<div>I&#39;ve been looking for how to check who holds a lock for a given VG=
 but I could&#39;nt find no suitable way to do it.</div>
<div>=A0</div>
<div>The only way was to activate debug (=A0mount -t debugfs debug /debug) =
and cat /debug/dlm/clvmd_locks.</div>
<div>=A0</div>
<div>Is there a way to request dlm (via dlm_tool) to get the lock holding n=
ode or via=A0=A0any LVM command.</div>
<div>=A0</div>
<div>Regards</div>

--0016e6d7e744d83df7046faf0bf1--
