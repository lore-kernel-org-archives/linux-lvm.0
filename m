Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31A4B1000049
	for <linux-lvm@redhat.com>; Mon, 17 Dec 2018 20:41:07 +0000 (UTC)
Received: from sender-pp-o92.zoho.eu (sender-pp-o92.zoho.eu [31.186.226.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1858C7FDE5
	for <linux-lvm@redhat.com>; Mon, 17 Dec 2018 20:41:05 +0000 (UTC)
From: Giuseppe Vacanti <giuseppe@vacanti.org>
Message-Id: <167bde59673.fc2fc0a351387.5941487526649049402@vacanti.org>
In-Reply-To: <807b41c03c2d66e16153a8ee3489b4f1@assyoma.it>
References: <167b30557b8.d471a29712958.970233558882873666@vacanti.org>
	<807b41c03c2d66e16153a8ee3489b4f1@assyoma.it>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_138763_332312350.1545079199347"
Subject: Re: [linux-lvm] PV not found
Reply-To: giuseppe@vacanti.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Date: Mon, 17 Dec 2018 20:41:09 -0000
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_138763_332312350.1545079199347
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello, I have found a solution to the problem, however the problem seems to come back after every reboot. I have been put on the good path by the remarks made on this list by John and Gionatan. The fix is the following: - convince myself that the device has the correct uuid, I used blkid and compared the result with the information in the lvm backup - run pvck -t on /dev/sdc. Nothing special, all seems OK - run vgscan --cache. This command brings back knowledge of the VG the PV belongs to - now pvs lists my PV again, but the LV is inactive - I activate the LV with lvchange - all is back, I can mount and use the LV After a reboot however the information about the VG is gone again, and I have to repeat the steps above to be able to use the LV. I have a running system, but I don't know what is happening. Where can I look to figure this out? Regards, Giuseppe -- Giuseppe Vacanti
------=_Part_138763_332312350.1545079199347
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D'font-size:10pt;font-family:Calibri,Arial,Verdana,s=
ans-serif;color:#00000;'><div class=3D"zmail_extra"><div><div><div>Hello,<b=
r></div><div><br></div><div>I have found a solution to the problem, however=
 the problem seems to come back after every reboot.<br></div><div><br></div=
><div>I have been put on the good path by the remarks made on this list by =
John and Gionatan.<br></div><div><br></div><div>The fix is the following:<b=
r></div><div><br></div><div>- convince myself that the device has the corre=
ct uuid, I used blkid and compared the result with the information in the l=
vm backup<br></div><div>- run pvck -t on /dev/sdc. Nothing special, all see=
ms OK<br></div><div>- run vgscan --cache. This command brings back knowledg=
e of the VG the PV belongs to<br></div><div>- now pvs lists my PV again, bu=
t the LV is inactive<br></div><div>- I activate the LV with lvchange<br></d=
iv><div>- all is back, I can mount and use the LV<br></div><div><br></div><=
div>After a reboot however the information about the VG is gone again, and =
I have to repeat the steps above to be able to use the LV.<br></div></div><=
/div></div><div><br></div><div>I have a running system, but I don't know wh=
at is happening. Where can I look to figure this out?<br></div><div><br></d=
iv><div>Regards, Giuseppe<br></div><div><br></div><div id=3D"Zm-_Id_-Sgn"><=
div>--<br></div><div>Giuseppe Vacanti<br></div></div><div><br></div></div><=
br></body></html>
------=_Part_138763_332312350.1545079199347--
