Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o35IADBb028855
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2010 14:10:13 -0400
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o35I9wVT003613
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2010 14:09:58 -0400
Received: by gwb19 with SMTP id 19so1354870gwb.33
	for <linux-lvm@redhat.com>; Mon, 05 Apr 2010 11:09:58 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 5 Apr 2010 12:09:56 -0600
Message-ID: <x2kd3791e4a1004051109h8d1a0af1s89565555a2215d53@mail.gmail.com>
From: "Qinghua(Kevin) Ye" <kevin.ye@gmail.com>
Content-Type: multipart/alternative; boundary=0016e647621e9ec1020483813cf2
Subject: [linux-lvm] question on lvm snapshot
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

--0016e647621e9ec1020483813cf2
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have a question on lvm snapshot. As I understood, there is a cow table
created when a snapshot is created. My question is: Is any way to reload the
cow table for a snapshot? I tried lvchange --refresh original_volume, it
seems doesn't work.

Thanks for help!
Kevin

--0016e647621e9ec1020483813cf2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br><br>I have a question on lvm snapshot. As I understood, there is a c=
ow table created when a snapshot is created. My question is: Is any way to =
reload the cow table for a snapshot? I tried lvchange --refresh original_vo=
lume, it seems doesn&#39;t work.<br>
<br>Thanks for help!<br>Kevin<br><br><br>

--0016e647621e9ec1020483813cf2--
