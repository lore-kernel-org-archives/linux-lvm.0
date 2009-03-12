Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2CEqoQh017302
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 10:52:50 -0400
Received: from qw-out-2122.google.com (qw-out-2122.google.com [74.125.92.24])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2CEqWX2017383
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 10:52:32 -0400
Received: by qw-out-2122.google.com with SMTP id 3so269856qwe.39
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 07:52:32 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 12 Mar 2009 09:52:32 -0500
Message-ID: <f4f537b50903120752s73e40288wbdfaaae814acbdd9@mail.gmail.com>
From: Eugene Vilensky <evilensky@gmail.com>
Content-Type: multipart/alternative; boundary=0015175cdd404cf1ef0464ed22d4
Subject: [linux-lvm] pvcreate and partition alignment
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0015175cdd404cf1ef0464ed22d4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Greetings,

NetApp requires for best performance that all partitions be aligned to 4k
boundaries to prevent "partial writes" and lost IOPS.  We are using LVM on
un-partitioned devices.  The only response I can get out of NetApp is that,
by not having a partition, the partition itself is not mis-aligned.

We are using a blocksize of 4096b for ext3.

Is there another "allocation" setting that we need to select for LVM
specifically, to ensure alignment to this 4k NetApp boundary?

Thanks,
Eugene

--0015175cdd404cf1ef0464ed22d4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Greetings,<br><br>NetApp requires for best performance that all partitions =
be aligned to 4k boundaries to prevent &quot;partial writes&quot; and lost =
IOPS.=A0 We are using LVM on un-partitioned devices.=A0 The only response I=
 can get out of NetApp is that, by not having a partition, the partition it=
self is not mis-aligned.=A0 <br>
<br>We are using a blocksize of 4096b for ext3.=A0 <br><br>Is there another=
 &quot;allocation&quot; setting that we need to select for LVM specifically=
, to ensure alignment to this 4k NetApp boundary?<br><br>Thanks,<br>Eugene<=
br>


--0015175cdd404cf1ef0464ed22d4--
