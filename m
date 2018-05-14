Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3DFA30012A2
	for <linux-lvm@redhat.com>; Mon, 14 May 2018 00:47:34 +0000 (UTC)
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FE191092EC
	for <linux-lvm@redhat.com>; Mon, 14 May 2018 00:47:13 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id 131-v6so6473959vkf.8
	for <linux-lvm@redhat.com>; Sun, 13 May 2018 17:47:13 -0700 (PDT)
MIME-Version: 1.0
Sender: pankaj.scorpio@gmail.com
From: Pankaj Agarwal <pankaj@releasemanager.in>
Date: Sun, 13 May 2018 20:47:11 -0400
Message-ID: <CAHJ=Ofm_j2B6TeNZR_1GZk40L_fiAqMT=umehupKSnNd+ZHY2A@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000089c2ef056c1fd310"
Subject: [linux-lvm] how to set higher then 128 nr_requests on LV's
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

--00000000000089c2ef056c1fd310
Content-Type: text/plain; charset="UTF-8"

Hi,


How do i set the nr_request value for LV's as it's not writable like other
drives on a linux system.

LV's are set as dm-0 and dm-1 on my system.

 #cat /sys/block/dm-0/queue/nr_requests
128
# echo 256 > /sys/block/dm-0/queue/nr_requests
-bash: echo: write error: Invalid argument
#

Thanks,

Pankaj

--00000000000089c2ef056c1fd310
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div><br></div><div>How do i set the nr_=
request value for LV&#39;s as it&#39;s not writable like other drives on a =
linux system.</div><div><br></div><div>LV&#39;s are set as dm-0 and dm-1 on=
 my system.</div><div><br></div><div><div>=C2=A0#cat /sys/block/dm-0/queue/=
nr_requests</div><div>128</div><div># echo 256 &gt; /sys/block/dm-0/queue/n=
r_requests</div><div>-bash: echo: write error: Invalid argument</div><div>#=
</div></div><div><br></div><div>Thanks,</div><div><br></div><div>Pankaj<br>=
<br></div><div><br></div></div>

--00000000000089c2ef056c1fd310--
