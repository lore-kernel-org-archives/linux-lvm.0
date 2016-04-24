Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3OLZrrn003432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 24 Apr 2016 17:35:54 -0400
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B241E64069
	for <linux-lvm@redhat.com>; Sun, 24 Apr 2016 21:35:52 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id os9so68755284lbb.2
	for <linux-lvm@redhat.com>; Sun, 24 Apr 2016 14:35:52 -0700 (PDT)
Received: from m-ipv6.cust.tele2.se ([2a00:801:211:b67::1])
	by smtp.gmail.com with ESMTPSA id k6sm3797039lby.49.2016.04.24.14.35.50
	for <linux-lvm@redhat.com> (version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Apr 2016 14:35:50 -0700 (PDT)
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----3XWNWTV56WSP9BY1WEWOTUCLNTN0IZ"
Content-Transfer-Encoding: 8bit
From: Tomas Dalebjork <tomas.dalebjork@repostor.com>
Date: Sun, 24 Apr 2016 23:36:30 +0200
Message-ID: <B6589C63-B7F2-4E7C-A725-7499F0FDBB97@repostor.com>
Subject: [linux-lvm] lvremove does not remove /dev/mapper/...-cow... and
	...-real...
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------3XWNWTV56WSP9BY1WEWOTUCLNTN0IZ
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"

Hi.

I have noticed that if a thick snapshot device is created
# /sbin/lvcreate --size size --snapshot --name snap /dev/system/lvname
And later removed
# /sbin/lvremove system/lvname 

Than the symbolic link files under /dev/mapper/ is not removed

This is applicable on RHEL7 and sometimes on RHEL6.

Is this a known bug?
Or why is the links still there?

Regards Tomas 
Tomas Dalebjörk | CIO
+46 (0)31 322 4359
REPOSTOR AB
Första Långgatan 19, 41327 Göteborg, Sweden

Follow us at
Twitter | http://twitter.com/#repostor-ab
------3XWNWTV56WSP9BY1WEWOTUCLNTN0IZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi.<br>
<br>
I have noticed that if a thick snapshot device is created<br>
# /sbin/lvcreate --size size --snapshot --name snap /dev/system/lvname<br>
And later removed<br>
# /sbin/lvremove system/lvname <br>
<br>
Than the symbolic link files under /dev/mapper/ is not removed<br>
<br>
This is applicable on RHEL7 and sometimes on RHEL6.<br>
<br>
Is this a known bug?<br>
Or why is the links still there?<br>
<br>
Regards Tomas <br>
Tomas Dalebjörk | CIO<br>
+46 (0)31 322 4359<br>
REPOSTOR AB<br>
Första Långgatan 19, 41327 Göteborg, Sweden<br>
<br>
Follow us at<br>
Twitter | <a href="http://twitter.com/#repostor-ab">http://twitter.com/#repostor-ab</a>
------3XWNWTV56WSP9BY1WEWOTUCLNTN0IZ--
