Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1CGRJO15112
	for <linux-lvm@redhat.com>; Sat, 12 Feb 2005 11:27:19 -0500
Received: from postfix4-2.free.fr (postfix4-2.free.fr [213.228.0.176])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1CGRD0Q030745
	for <linux-lvm@redhat.com>; Sat, 12 Feb 2005 11:27:13 -0500
Received: from [192.168.0.2] (netchaiev.zarb.org [82.224.237.5])
	by postfix4-2.free.fr (Postfix) with ESMTP id 7ABD12BE979
	for <linux-lvm@redhat.com>; Sat, 12 Feb 2005 17:27:12 +0100 (CET)
Message-ID: <420E2E5F.8040401@inria.fr>
Date: Sat, 12 Feb 2005 17:27:11 +0100
From: Guillaume Rousse <Guillaume.Rousse@inria.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Troubles with 2.6.10 kernel, lvm and megaraid
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Hello.

I have troubles with an host running mandrake 10.1, hardware raid with=20
megaraid driver, and lvm. The setup works fine with initial=20
configuration, using a 2.6.8 kernel, but we recently tried to switch to=20
  2.6.10 as we're facing some unknown lock issues. Now the lvm doesn't=20
work anymore, and stop at boot with this message:

device-mapper ioctl cmd 0 failed: Inappropriate ioctl for device

Apparently, something changed either in the megaraid driver (I am still=20
using the legacy one) or the device mapper. I didn't attempted yet to=20
backport user-spaces tools such as lvm and libdevice-mapper, as I'm=20
trying to minimise support calls for rebooting the machine).

Any advice ?--
Divide the number of servings by two when reading the directions for=20
reconstituting anything freeze-dried
		-- Murphy's Laws of Camping n=EF=BF=BD16
