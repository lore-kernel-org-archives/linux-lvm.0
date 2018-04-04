Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9981179CB
	for <linux-lvm@redhat.com>; Wed,  4 Apr 2018 07:41:01 +0000 (UTC)
Received: from h3cmg01-ex.h3c.com (smtp.h3c.com [60.191.123.56])
	by mx1.redhat.com (Postfix) with ESMTP id C8A0F5F7A6
	for <linux-lvm@redhat.com>; Wed,  4 Apr 2018 07:40:57 +0000 (UTC)
From: Guozhonghua <guozhonghua@h3c.com>
Date: Wed, 4 Apr 2018 07:40:44 +0000
Message-ID: <71604351584F6A4EBAE558C676F37CA401071B23EB@H3CMLB12-EX.srv.huawei-3com.com>
Content-Language: zh-CN
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] compile lvm2 with --enable-lvmlockd-sanlock on
 Ubuntu 1710, configure failed.  For help, thanks
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
Content-Type: text/plain; charset="utf-8"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>


Hi, All

I add one file as below, so compiled it successfully. 

root@u610:/usr/lib/x86_64-linux-gnu/pkgconfig# cat libsanlock_client.pc 
		prefix=/usr
		exec_prefix=/usr
		libdir=${prefix}/lib/x86_64-linux-gnu
		includedir=${prefix}/include

		Name: libsanlock_client
		Version: 3.3.0-2.1
		Description: libsanlock_client
		Requires: corosync
		Cflags: -I${includedir}

While compile the code, I found one bug in the file, so there is one patch about. 

+	int lv_info_with_seg_status(struct cmd_context *cmd,
+                const struct lv_segment *lv_seg,
+                struct lv_with_info_and_seg_status *status,
+                int with_open_count, int with_read_ahead)
-	int lv_info_with_seg_status(struct cmd_context *cmd, const struct logical_volume *lv,
-				    const struct lv_segment *lv_seg, int use_layer,
-				    struct lv_with_info_and_seg_status *status,
-				    int with_open_count, int with_read_ahead)
	{
		return 0;
	}


Thanks. 
Guozhonghua.  



> -----�ʼ�ԭ��-----
> ������: guozhonghua (Cloud)
> ����ʱ��: 2018��3��30�� 16:34
> �ռ���: 'linux-lvm@redhat.com'
> ����: compile lvm2 with --enable-lvmlockd-sanlock on Ubuntu 1710, configure
> failed. For help, thanks
> 
> 
> Hi,
> 
> I want to have a test of lvmlockd, while try to compile the lvm2, which version is
> LVM2.2.02.177, or 2.2.02.168.
> 
> With the configure:
> ./configure --enable-cmirrord --enable-debug --disable-devmapper
> --enable-lvmetad --enable-lvmpolld --enable-lvmlockd-sanlock --enable-dmeventd
> --enable-udev_sync --enable-cmdlib
> 
> But failed as below with configure error check:
> 
> checking for LOCKD_SANLOCK... no
> configure: error: bailing out
> 
> The environment is Ubuntu 1710.
> 
> And I had install the sanlock as below:
> root@u610:~/LVM2.2.02.177# dpkg -l |grep sanlock
> ii  libsanlock-client1                         3.3.0-2.1
> amd64        Shared storage lock manager (client library)
> ii  libsanlock-dev                             3.3.0-2.1
> amd64        Shared storage lock manager (development files)
> ii  libsanlock1                                3.3.0-2.1
> amd64        Shared storage lock manager (shared library)
> ii  libvirt-sanlock                            3.6.0-1ubuntu5
> amd64        Sanlock plugin for virtlockd
> ii  python-sanlock                             3.3.0-2.1
> amd64        Python bindings to shared storage lock manager
> ii  sanlock                                    3.3.0-2.1
> amd64        Shared storage lock manager
> 
> Is there something wrong with it?
> 
> Thanks
