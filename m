Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4QGIJqm004013
	for <linux-lvm@redhat.com>; Fri, 26 May 2006 12:18:19 -0400
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.232])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4QGIDkM013827
	for <linux-lvm@redhat.com>; Fri, 26 May 2006 12:18:13 -0400
Received: by wr-out-0506.google.com with SMTP id 50so102486wri
	for <linux-lvm@redhat.com>; Fri, 26 May 2006 09:18:13 -0700 (PDT)
Message-ID: <bd15b9d50605260918p24d51504q18ea7ad3072cae6a@mail.gmail.com>
Date: Fri, 26 May 2006 13:18:11 -0300
From: "Marconi Rivello" <marconirivello@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_6749_10262975.1148660291252"
Subject: [linux-lvm] COW Internals
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

------=_Part_6749_10262975.1148660291252
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,

Could anybody point me where to find the internal structures of the COW
devices in /dev/mapper?

What I want to do, exactly, is: make a backup of the snapshot in an image
file, reading all the used blocks, and leaving the "not-used" ones. Later, =
I
want to get the image file, and restore the cow device. But I can't find an
LVM document that describes exactly how the COW structure is stored in disk=
.


Thanks,
Marconi Rivello.

------=_Part_6749_10262975.1148660291252
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,<br><br>Could anybody point me where to find the internal structures =
of the COW devices in /dev/mapper?<br><br>What I want to do, exactly, is: m=
ake a backup of the snapshot in an image file, reading all the used blocks,=
 and leaving the &quot;not-used&quot; ones. Later, I want to get the image =
file, and restore the cow device. But I can't find an LVM document that des=
cribes exactly how the COW structure is stored in disk.
<br><br>Thanks,<br>Marconi Rivello.<br>


------=_Part_6749_10262975.1148660291252--
