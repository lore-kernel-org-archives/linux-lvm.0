Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o299emkh001177
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2010 04:40:48 -0500
Received: from mail-iw0-f204.google.com (mail-iw0-f204.google.com
	[209.85.223.204])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o299eWVx012550
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2010 04:40:32 -0500
Received: by iwn42 with SMTP id 42so6273195iwn.6
	for <linux-lvm@redhat.com>; Tue, 09 Mar 2010 01:40:32 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 9 Mar 2010 17:40:31 +0800
Message-ID: <f20232a81003090140s5f99a32du4dc47763e770e86a@mail.gmail.com>
From: =?UTF-8?B?5ZC05b635paw?= <wudx05@gmail.com>
Content-Type: multipart/alternative; boundary=005045013d2e05670d04815af9e3
Subject: [linux-lvm] The maximum size of a Logical volume
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

--005045013d2e05670d04815af9e3
Content-Type: text/plain; charset=UTF-8

From LVM2 FAQ,  I get the following answer*:

4.1.13. * What is the maximum size of a single LV?

* * The answer to this question depends upon the CPU architecture of your
computer and the kernel you are a running:

   -

   For 2.4 based kernels, the maximum LV size is 2TB. For some older
   kernels, however, the limit was 1TB due to signedness problems in the block
   layer. Red Hat Enterprise Linux 3 Update 5 has fixes to allow the full 2TB
   LVs. Consult your distribution for more information in this regard.
   -

   For 32-bit CPUs on 2.6 kernels, the maximum LV size is 16TB.
   -

   For 64-bit CPUs on 2.6 kernels, the maximum LV size is 8EB. (Yes, that is
   a very large number.)



But I want to why the maximum size is 16TB on 32-bit CPU.  With LBD (large
block device) is configured,  kernel use u64 to represent sector number, so
the capacity of a block device can become more than 16TB.  Where is the
limitation ?  Thanks.

--005045013d2e05670d04815af9e3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From LVM2 FAQ,=C2=A0 I get the following answer<b>:<br><br>4.1.13. </b>
	      What is the maximum size of a single LV?
	    <p><b> </b>
	      The answer to this question depends upon the CPU
	      architecture of your computer and the kernel you are a
	      running:
	      </p><ul><li><p>
		    For 2.4 based kernels, the maximum LV size is 2TB.
		    For some older kernels, however, the limit was 1TB
		    due to signedness problems in the block layer.
		    Red Hat Enterprise Linux 3 Update 5 has fixes to
		    allow the full 2TB LVs.  Consult your distribution
		    for more information in this regard.
		  </p></li><li><p>
		    For 32-bit CPUs on 2.6 kernels, the maximum LV size is 16TB.
		  </p></li><li><p>
		    For 64-bit CPUs on 2.6 kernels, the maximum LV
		    size is 8EB. (Yes, that is a very large number.)
		  </p></li></ul><br><br>But I want to why the maximum size is 16TB on 32-=
bit CPU.=C2=A0 With LBD (large block device) is configured,=C2=A0 kernel us=
e u64 to represent sector number, so the capacity of a block device can bec=
ome more than 16TB.=C2=A0 Where is the limitation ?=C2=A0 Thanks.<br>

--005045013d2e05670d04815af9e3--
