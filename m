Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1A3YPW4001526
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2015 22:34:26 -0500
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1A3YNPS013827
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2015 22:34:24 -0500
Received: by mail-wi0-f179.google.com with SMTP id hi2so692721wib.0
	for <linux-lvm@redhat.com>; Mon, 09 Feb 2015 19:34:22 -0800 (PST)
Received: from [192.168.1.2] ([117.201.89.163])
	by mx.google.com with ESMTPSA id
	fo17sm18874066wjc.19.2015.02.09.19.34.21 for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Feb 2015 19:34:22 -0800 (PST)
Message-ID: <54D97C2C.2020602@gmail.com>
Date: Tue, 10 Feb 2015 09:04:04 +0530
From: dE <de.techno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgextend --restoremissing does not work.
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi!

vgextend --restoremissing sdc_sdd /dev/sdc
   Couldn't find device with uuid aHSXeM-P1H5-7epv-l1cu-DsCS-K7dC-10Aaco.
   WARNING: PV /dev/sdc not found in VG sdc_sdd
   No PV has been restored.

The reason why I'm doing a --restoremissing, is because

Couldn't find device with uuid aHSXeM-P1H5-7epv-l1cu-DsCS-K7dC-10Aaco.
