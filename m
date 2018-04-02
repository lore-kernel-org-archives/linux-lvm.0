Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F30F5D723
	for <linux-lvm@redhat.com>; Mon,  2 Apr 2018 02:16:28 +0000 (UTC)
Received: from prv-mh.provo.novell.com (prv-mh.provo.novell.com
	[137.65.248.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BBB99C0587C1
	for <linux-lvm@redhat.com>; Mon,  2 Apr 2018 02:16:26 +0000 (UTC)
Message-Id: <5AC202F1020000F9000B3146@prv-mh.provo.novell.com>
Date: Sun, 01 Apr 2018 20:16:17 -0600
From: "Gang He" <ghe@suse.com>
References: <71604351584F6A4EBAE558C676F37CA401071B1902@H3CMLB12-EX.srv.huawei-3com.com>
In-Reply-To: <71604351584F6A4EBAE558C676F37CA401071B1902@H3CMLB12-EX.srv.huawei-3com.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I can compile the code smoothly on openSUSE Tumbleweed, but I am not sure if my configuration is the same with yours.

tb0307-nd3:/usr/src/packages/BUILD/LVM2.2.02.177 # rpm -qa | grep -i san
sane-backends-1.0.27-3.3.x86_64
noto-sans-fonts-20170919-2.1.noarch
adobe-sourcesanspro-fonts-2.020-1.8.noarch
hplip-sane-3.17.9-2.2.x86_64
sanlock-devel-3.6.0-1.2.x86_64
libtsan0-gcc8-8.0.1+r257983-1.1.x86_64
libubsan0-7.3.1+r258025-1.3.x86_64
sane-backends-autoconfig-1.0.27-3.3.x86_64
libsanlock1-3.6.0-1.2.x86_64
ruby2.5-rubygem-rails-html-sanitizer-1.0.3-1.8.x86_64
libasan4-7.3.1+r258025-1.3.x86_64
liblsan0-gcc8-8.0.1+r257983-1.1.x86_64
sanlock-3.6.0-1.2.x86_64


Thanks
Gang


>>> 

> Hi, 
> 
> I want to have a test of lvmlockd, while try to compile the lvm2, which 
> version is LVM2.2.02.177, or 2.2.02.168. 
> 
> With the configure:  
> ./configure --enable-cmirrord --enable-debug --disable-devmapper --enable-lvmetad 
> --enable-lvmpolld --enable-lvmlockd-sanlock --enable-dmeventd --enable-udev_sync 
> --enable-cmdlib
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
>              amd64        Shared storage lock manager (client library)
> ii  libsanlock-dev                             3.3.0-2.1                       
>              amd64        Shared storage lock manager (development files)
> ii  libsanlock1                                3.3.0-2.1                      
>               amd64        Shared storage lock manager (shared library)
> ii  libvirt-sanlock                            3.6.0-1ubuntu5                  
>              amd64        Sanlock plugin for virtlockd
> ii  python-sanlock                             3.3.0-2.1                       
>              amd64        Python bindings to shared storage lock manager
> ii  sanlock                                    3.3.0-2.1                      
>               amd64        Shared storage lock manager
> 
> Is there something wrong with it? 
> 
> Thanks
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com 
> https://www.redhat.com/mailman/listinfo/linux-lvm 
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
