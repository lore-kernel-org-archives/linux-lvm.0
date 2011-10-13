Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9D90Zi7023952
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2011 05:00:35 -0400
Received: from smtp.retaggio.net (q.retaggio.net [80.88.84.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9D90Xe9019699
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2011 05:00:34 -0400
Received: from localhost (q.retaggio.net [127.0.0.1])
	by smtp.retaggio.net (Postfix) with ESMTP id 856D6624F08
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2011 11:00:31 +0200 (CEST)
Received: from smtp.retaggio.net ([127.0.0.1])
	by localhost (smtp.retaggio.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TpTYprcJiGu4 for <linux-lvm@redhat.com>;
	Thu, 13 Oct 2011 11:00:20 +0200 (CEST)
Received: from [192.168.1.18] (gateway.cemindustries.it [109.168.4.162])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.retaggio.net (Postfix) with ESMTPSA id 8A7D562806F
	for <linux-lvm@redhat.com>; Thu, 13 Oct 2011 11:00:20 +0200 (CEST)
Message-ID: <4E96A8A3.1040405@retaggio.net>
Date: Thu, 13 Oct 2011 11:00:19 +0200
From: Daniele Palumbo <daniele@retaggio.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] sharing attr on clustered volume -- cannot see open
	attribute
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
To: LVM general discussion and development <linux-lvm@redhat.com>

hi,

first of all, sorry for the long subject...
i do not know how to explain myself, so any faq/manual will be of course 
appreciated.

now,
i have a test cluster, gentoo based.
cluster 3.1.7, corosync 1.4.2, lvm2 2.02.88.
clvm is built with following flags:
./configure --prefix=/usr --build=x86_64-pc-linux-gnu 
--host=x86_64-pc-linux-gnu --mandir=/usr/share/man 
--infodir=/usr/share/info --datadir=/usr/share --sysconfdir=/etc 
--localstatedir=/var/lib --enable-readline --disable-selinux 
--enable-pkgconfig --with-confdir=/etc --sbindir=/sbin 
--with-staticdir=/sbin --libdir=/lib64 --with-usrlibdir=/usr/lib64 
--enable-udev_rules --enable-udev_sync --with-udevdir=/lib/udev/rules.d/ 
--enable-dmeventd --enable-cmdlib --enable-applib --enable-fsadm 
--enable-static_link --with-mirrors=internal --with-snapshots=internal 
--with-lvm1=internal --with-cluster=internal --enable-cmirrord 
--with-clvmd=cman --with-pool=internal 
--with-dmeventd-path=/sbin/dmeventd CLDFLAGS=-Wl,-O1 -Wl,--as-needed

cluster.conf:
<cluster name="CEMCluster" config_version="2">
         <clusternodes>
                 <clusternode name="pvsrv01" nodeid="1">
                 </clusternode>
                 <clusternode name="pvsrv07" nodeid="2">
                 </clusternode>
                 <clusternode name="pvsrv08" nodeid="3">
                 </clusternode>
         </clusternodes>
</cluster>


now, i have the cluster working, i can see and create volumes and so on.

but when i mount a volume on node pvsrv07, i cannot see it as open in 
pvsrv08.
also, clvmd (running in debug mode) does not show me anything when i 
mount or unmount volumes.

any hints?

thanks
Daniele
