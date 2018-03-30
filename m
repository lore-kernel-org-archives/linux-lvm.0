Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF03F67652
	for <linux-lvm@redhat.com>; Fri, 30 Mar 2018 08:34:01 +0000 (UTC)
Received: from h3cmg01-ex.h3c.com (smtp.h3c.com [60.191.123.56])
	by mx1.redhat.com (Postfix) with ESMTP id 7BA1D2821B
	for <linux-lvm@redhat.com>; Fri, 30 Mar 2018 08:33:56 +0000 (UTC)
From: Guozhonghua <guozhonghua@h3c.com>
Date: Fri, 30 Mar 2018 08:33:44 +0000
Message-ID: <71604351584F6A4EBAE558C676F37CA401071B1902@H3CMLB12-EX.srv.huawei-3com.com>
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] compile lvm2 with --enable-lvmlockd-sanlock on Ubuntu
 1710, configure failed.  For help, thanks
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>


Hi, 

I want to have a test of lvmlockd, while try to compile the lvm2, which version is LVM2.2.02.177, or 2.2.02.168. 

With the configure:  
./configure --enable-cmirrord --enable-debug --disable-devmapper --enable-lvmetad --enable-lvmpolld --enable-lvmlockd-sanlock --enable-dmeventd --enable-udev_sync --enable-cmdlib

But failed as below with configure error check: 

checking for LOCKD_SANLOCK... no
configure: error: bailing out

The environment is Ubuntu 1710. 

And I had install the sanlock as below: 
root@u610:~/LVM2.2.02.177# dpkg -l |grep sanlock
ii  libsanlock-client1                         3.3.0-2.1                                    amd64        Shared storage lock manager (client library)
ii  libsanlock-dev                             3.3.0-2.1                                    amd64        Shared storage lock manager (development files)
ii  libsanlock1                                3.3.0-2.1                                    amd64        Shared storage lock manager (shared library)
ii  libvirt-sanlock                            3.6.0-1ubuntu5                               amd64        Sanlock plugin for virtlockd
ii  python-sanlock                             3.3.0-2.1                                    amd64        Python bindings to shared storage lock manager
ii  sanlock                                    3.3.0-2.1                                    amd64        Shared storage lock manager

Is there something wrong with it? 

Thanks
