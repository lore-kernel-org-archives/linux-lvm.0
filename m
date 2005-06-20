Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5KGLAu00603
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 12:21:10 -0400
Received: from quantik.adsis.local (asi-87.asi256ip.easynet.fr [212.180.39.87])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5KGKx8Y004952
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 12:21:05 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by quantik.adsis.local (Postfix) with ESMTP id A6C67514D72
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 18:20:40 +0200 (CEST)
Received: from quantik.adsis.local ([127.0.0.1])
	by localhost (quantik [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 28515-06 for <linux-lvm@redhat.com>;
	Mon, 20 Jun 2005 18:20:35 +0200 (CEST)
Received: from [192.168.0.101] (pc101.s000.adsis.local [192.168.0.101])
	by quantik.adsis.local (Postfix) with ESMTP id 3F5C124C06
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 18:20:35 +0200 (CEST)
Message-ID: <42B6ECDB.8050100@adsis.fr>
Date: Mon, 20 Jun 2005 18:20:43 +0200
From: =?ISO-8859-1?Q?Gr=E9gory_Duchatelet?= <greg@adsis.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM is low
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi list,

I install a server with LVM partitions with ReiserFS, server runs 
OpenLDAP, Tomcat5, Apache2, Samba, etc....

Comparing with native ReiserFS, LVM is really low .... how to tune it 
for best performance ?

Thanks

-- 
Gr�gory Duchatelet <gregory@adsis.fr>
Ing�nieur syst�mes & r�seaux
ADSiS - Technologies Open-Source
http://www.adsis.fr/ - <contact@adsis.fr>
