Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAIGtP2o029580
	for <linux-lvm@redhat.com>; Tue, 18 Nov 2014 11:55:25 -0500
Received: from nm22-vm2.access.bullet.mail.gq1.yahoo.com
	(nm22-vm2.access.bullet.mail.gq1.yahoo.com [216.39.63.50])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAIGtMY8014707
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 18 Nov 2014 11:55:23 -0500
Message-ID: <1416329721.17053.YahooMailBasic@web181504.mail.ne1.yahoo.com>
Date: Tue, 18 Nov 2014 08:55:21 -0800
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <546B7395.3020305@mglug.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mixed ssd/disk szenario question: moving lv from
	ssd	->disk?
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I think 'lvconvert --replace /dev/<ssd> VG/LV /dev/<slow disk>'
will do what you want.
