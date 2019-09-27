Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03CD83D8E
	for <linux-lvm@redhat.com>; Fri, 27 Sep 2019 09:14:46 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60045.outbound.protection.outlook.com [40.107.6.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88EA330ADBAE
	for <linux-lvm@redhat.com>; Fri, 27 Sep 2019 09:14:44 +0000 (UTC)
From: =?utf-8?B?TWF4IEhhbGxkw6lu?= <max.hallden@wisi.se>
Date: Fri, 27 Sep 2019 09:14:42 +0000
Message-ID: <a308600f-4a00-038c-1c6d-947564130712@wisi.se>
Content-Language: en-US
Content-ID: <E4457F2AA768104C8D5C4E54C6755B59@eurprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vg activation without backup
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi all,

I'm running this command:

root@(none):~# vgchange -A n -a y my_vg
  -A option not necessary with -a option
  Run `vgchange --help' for more information.

It seems like activation (-a) implies autobackup (-A) since it doesn't accept the option to disable it. Is the backup really required when activating the group? I would rather skip it.

Thanks,
Max
