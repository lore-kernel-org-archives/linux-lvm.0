Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBLCUlRQ019390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 21 Dec 2015 07:30:48 -0500
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mx1.redhat.com (Postfix) with ESMTPS id 5F9DF8E395
	for <linux-lvm@redhat.com>; Mon, 21 Dec 2015 12:30:47 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id c96so83130914qgd.3
	for <linux-lvm@redhat.com>; Mon, 21 Dec 2015 04:30:47 -0800 (PST)
Received: from biodora.local ([70.45.27.18]) by smtp.gmail.com with ESMTPSA id
	x136sm1796703qka.0.2015.12.21.04.30.45 for <linux-lvm@redhat.com>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Dec 2015 04:30:46 -0800 (PST)
Message-ID: <5677F0E5.5050101@gmail.com>
Date: Mon, 21 Dec 2015 08:30:29 -0400
From: =?UTF-8?B?Sm9yZ2UgRsOhYnJlZ2Fz?= <jorge.fabregas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Extend VG - Expand LUN vs New Disk
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
Content-Type: text/plain; charset="us-ascii"
To: LVM Mailingliste <linux-lvm@redhat.com>

Hi everyone,

Are there any major differences between expanding an existing LUN
(already striped & mirrored on storage-array) and use pvresize &
"lvextend -r ..." vs adding a new disk to your VG when you need to
expand an existing filesystem?

At work we do the latter and almost everyone believes expanding an
existing LUN is not a safe operation.  Is there really a preferred
method? Or is it just a matter of personal preference?

Thanks!
Jorge
