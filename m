Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3C5B5D9C9
	for <linux-lvm@redhat.com>; Thu, 29 Aug 2019 14:00:37 +0000 (UTC)
Received: from m9a0002g.houston.softwaregrp.com
	(m9a0002g.houston.softwaregrp.com [15.124.64.67])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07B37CF19
	for <linux-lvm@redhat.com>; Thu, 29 Aug 2019 14:00:35 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0002g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Thu, 29 Aug 2019 13:59:44 +0000
From: Heming Zhao <heming.zhao@suse.com>
Date: Thu, 29 Aug 2019 13:52:48 +0000
Message-ID: <c88b7c49-1046-ae78-4352-fa51e1ef7873@suse.com>
Content-Language: en-US
Content-ID: <5BE9A62C59376A4C9352FA20AA319304@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm]  system boot time regression when using lvm2-2.03.05
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>, Martin Wilck <mwilck@suse.de>

Hello List,

I found lvm2-2.03 has some performance regression when system booting.

My env as below:
```
x86-64 qemu vm, 2vcpu, 8G memory,  7 disks (per disk 1GB)
each disk have 128 primary partition, each partition size is 6MB.
total pvs: 896 (each partition create a pv),  vgs 56 (every 16 pvs 
create a vg), lvs 56 (each vg create a lv).
```

When using lvm2-2.02, it only took about a few seconds to enter login 
prompt, but lvm2-2.03 took about 2mins.


## how to create lvm2-2.03.05

In fedora system,
go to website: https://src.fedoraproject.org/rpms/lvm2/tree/master
git clone https://src.fedoraproject.org/rpms/lvm2.git
To use rpmbuild to create rpm package and install.
And to run mkinitrd after changing the lvm.conf.

## teset result

below time got from the command: systemd-analyze --no-pager blame
the time line of "lvm2-pvscan@major:minor.service"

centos 7.6 (lvm2-2.02.180):
disable lvmetad:  2.341s
enable lvmetad:  I wait about more than two hours, the system can't 
enter login phase.

fedora-server (kernel: 5.2.9-200  with default installed lvm2: 
lvm2-2.02.183-3)
use_lvmetad=0: 187ms
use_lvmetad=1: (no test)

fedora-server (kernel: 5.2.9-200  with rpmbuild: lvm2-2.03.05)
event_activation=1: 2min 3.661s
event_activation=0: 1min 57.478s


Could you give me some advice to locate this issue?

Thank you.
