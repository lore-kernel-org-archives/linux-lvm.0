Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1JHqqi16045
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 12:52:52 -0500
Received: from demonserver.de (p15093797.pureserver.info [217.160.109.186])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1JHqpb25331
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 12:52:51 -0500
Received: from demonlord.de (iD4CC9052.versanet.de [212.204.9.82])
	(authenticated bits=0)
	by demonserver.de (8.12.8/8.12.8) with ESMTP id i1JHqoK8032509
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 18:52:50 +0100
Message-ID: <4034F7F3.2040006@demonlord.de>
From: Christian Reiss <email@demonlord.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Lost free PV  -> error reading VG
References: <15173.1077120428@www19.gmx.net> <20040219121317.GB32407@redhat.com>
In-Reply-To: <20040219121317.GB32407@redhat.com>
Content-Transfer-Encoding: 7bit
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
Date: Thu Feb 19 12:51:32 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Heinz Mauelshagen wrote:

> 
> /me wonders how often we mentioned to take backups of /etc/lvmconf/* yet :->
> 

 From a Users point of view:
If you run vgscan, and it even mentions something about

a) REBuilding /etc/lvmwhatever
and
b) it fails for *any* reason,

people, me included, delete /etc/lvm* to start "clean",
and give vgscan the opportunity to start fresh, without
any "corrupted" data.

I dont know how often I nuked the backups, even after i
knew that deleting /etc/lvm* is not a good idea. Its like
a reflex.

-Christian




-- 
Christian Reiss <email@demonlord.de>
demonserver.de

Key fingerprint = 2999 B7CD A218 06DF D658  5BE3 18B6 B232 02FF 71B2
Public Key can be obtained here: http://www.demonlord.de/pgp.txt
