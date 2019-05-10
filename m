Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF7305B681
	for <linux-lvm@redhat.com>; Fri, 10 May 2019 03:00:40 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B6EC307D849
	for <linux-lvm@redhat.com>; Fri, 10 May 2019 03:00:39 +0000 (UTC)
Message-Id: <5CD4E950020000F900064DCE@prv1-mh.provo.novell.com>
Date: Thu, 09 May 2019 21:00:32 -0600
From: "Gang He" <ghe@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Does LVM2 support building with LTO enablement?
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

Our build team wants to build LVM2 with LTO enablement, but looks failed.
The error message likes,

[   30s] gcc -fmessage-length=0 -grecord-gcc-switches -O2 -Wall -D_FORTIFY_SOURCE=2 -fstack-protector-strong -funwind-tables -fasynchronous-unwind-tables -fstack-clash-protection -flto=160 -g -fPIC  -L../libdm -L../lib -L../libdaemon/client -L../daemons/dmeventd -Wl,-z,relro,-z,now -pie -fPIE -Wl,--export-dynamic -o lvm command.o dumpconfig.o formats.o lvchange.o lvconvert.o lvconvert_poll.o lvcreate.o lvdisplay.o lvextend.o lvmcmdline.o lvmdiskscan.o lvreduce.o lvremove.o lvrename.o lvresize.o lvscan.o polldaemon.o pvchange.o pvck.o pvcreate.o pvdisplay.o pvmove.o pvmove_poll.o pvremove.o pvresize.o pvscan.o reporter.o segtypes.o tags.o toollib.o vgcfgbackup.o vgcfgrestore.o vgchange.o vgck.o vgcreate.o vgconvert.o vgdisplay.o vgexport.o vgextend.o vgimport.o vgmerge.o vgmknodes.o lvpoll.o vgimportclone.o vgreduce.o vgremove.o vgrename.o vgscan.o vgsplit.o  lvm.o \
[   30s] 	-llvm-internal -ldevmapper-event -ldaemonclient  -ludev -ldl -lblkid -ldevmapper -laio -lreadline 
[   30s] /usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld: /tmp/lvm.vKOJS8.ltrans0.ltrans.o: in function `_async_wait':
[   30s] /home/abuild/rpmbuild/BUILD/LVM2.2.02.180/tools/device/bcache.c:268: undefined reference to `io_getevents'
[   30s] /usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld: /usr/lib64/gcc/x86_64-suse-linux/9/../../../../lib64/libaio.so: undefined reference to `io_cancel'
[   30s] collect2: error: ld returned 1 exit status
[   30s] make[1]: *** [Makefile:143: lvm] Error 1
[   30s] make[1]: Leaving directory '/home/abuild/rpmbuild/BUILD/LVM2.2.02.180/tools'
[   30s] make[1]: *** Waiting for unfinished jobs....
[   30s] make[1]: Entering directory '/home/abuild/rpmbuild/BUILD/LVM2.2.02.180/tools'
[   30s]     [CC] liblvm2cmd.so

About LTO information, you can look at the links as below,
https://lists.opensuse.org/opensuse-factory/2019-04/msg00320.html 
https://en.opensuse.org/openSUSE:LTO 


Thanks
Gang
