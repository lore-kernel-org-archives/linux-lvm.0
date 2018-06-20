Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C667720155E0
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2018 04:34:04 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A7933086241
	for <linux-lvm@redhat.com>; Wed, 20 Jun 2018 04:34:03 +0000 (UTC)
Message-Id: <5B29D933020000F90002433C@prv1-mh.provo.novell.com>
Date: Tue, 19 Jun 2018 22:33:55 -0600
From: "Gang He" <ghe@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] python_lvm_unit.py.in file on v2_02_178 triggered a
 building error
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
To: linux-lvm@redhat.com

Hello List,

For LVM2 for v2_02_178, there is a file python_lvm_unit.py.in under /lvm2/test/api.
in this file, the first line looks like "#!@PYTHON@", I do not know if we should replace this line with "#!/usr/bin/python3"?
Otherwise, there will be a building error, the building log is as below for your reference.
[  117s] 
[  117s] lvm2-testsuite.x86_64: E: env-script-interpreter (Badness: 9) /usr/share/lvm2-testsuite/lib/aux /usr/bin/env bash
[  117s] lvm2-testsuite.x86_64: E: env-script-interpreter (Badness: 9) /usr/share/lvm2-testsuite/lib/check /usr/bin/env bash
[  117s] lvm2-testsuite.x86_64: E: env-script-interpreter (Badness: 9) /usr/share/lvm2-testsuite/lib/get /usr/bin/env bash
[  117s] lvm2-testsuite.x86_64: E: env-script-interpreter (Badness: 9) /usr/share/lvm2-testsuite/lib/inittest /usr/bin/env bash
[  117s] lvm2-testsuite.x86_64: E: env-script-interpreter (Badness: 9) /usr/share/lvm2-testsuite/lib/utils /usr/bin/env bash
[  117s] This script uses 'env' as an interpreter. For the rpm runtime dependency
[  117s] detection to work, the shebang #!/usr/bin/env python  needs to be patched into
[  117s] #!/usr/bin/python  otherwise the package dependency generator merely adds a
[  117s] dependency on /usr/bin/env rather than the actual interpreter /usr/bin/python.
[  117s] Alternatively, if the file should not be executed, then ensure that it is not
[  117s] marked as executable or don't install it in a path that is reserved for
[  117s] executables.
[  117s] 
[  117s] lvm2-testsuite.x86_64: E: wrong-script-interpreter (Badness: 490) /usr/share/lvm2-testsuite/api/python_lvm_unit.py # Copyright (C) 2012-2013 Red Hat, Inc. All rights reserved.
[  117s] This script uses an interpreter which is either an inappropriate one or
[  117s] located in an inappropriate directory for packaged system software.
[  117s] Alternatively, if the file isn't supposed to be executed, then ensure that it
[  117s] is not marked as being executable.
[  117s] 
[  117s] (none): E: badness 1175 exceeds threshold 1000, aborting.
[  117s] 6 packages and 0 specfiles checked; 8 errors, 332 warnings.
[  117s] 
[  117s] 
[  117s] lamb18 failed "build lvm2.spec" at Tue Jun 19 07:31:51 UTC 2018.
