Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1JHn5i14519
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 12:49:05 -0500
Received: from demonserver.de (p15093797.pureserver.info [217.160.109.186])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1JHn4b23672
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 12:49:04 -0500
Received: from demonlord.de (iD4CC9052.versanet.de [212.204.9.82])
	(authenticated bits=0)
	by demonserver.de (8.12.8/8.12.8) with ESMTP id i1JHn2K8032391
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 18:49:03 +0100
Message-ID: <4034F710.7050106@demonlord.de>
From: Christian Reiss <email@demonlord.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM reducing.
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 19 12:48:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Greetings,

I am running the LVM2 version now, as LVM1 corrupted the VG.
So i converted it to LVM2 (figured it would re-do the 
master-data-thingy), and it works.

Now, (presumably Heinz :) how can I safely reduce the size under LVM2? 
LVM1 had this e2fsadm jiggamagic-thingy-thing - anything LVM2 offers to 
safely reduce the data?

-Christian.
-- 
Christian Reiss <email@demonlord.de>
demonserver.de

Key fingerprint = 2999 B7CD A218 06DF D658  5BE3 18B6 B232 02FF 71B2
Public Key can be obtained here: http://www.demonlord.de/pgp.txt
