Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o05JUIIv003741
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 14:30:18 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o05JU2TZ022724
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 14:30:03 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o05JU19g024096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 14:30:01 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o05JU1m4010032
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 14:30:01 -0500
Date: Tue, 5 Jan 2010 14:30:01 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4B438ECC.5000805@alteeve.com>
Message-ID: <Pine.LNX.4.64.1001051418140.9847@bmsred.bmsi.com>
References: <4B438ECC.5000805@alteeve.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] What is holding back clustered snapshotting?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 5 Jan 2010, Madison Kelly wrote:

>   I know that, currently, this isn't supported. Would someone be able to
> explain or point me at a place to read up on what is holding this feature
> back? What are the difficulties? Is it just a question of time, or are there
> certain technical hurdles in the way?

Setting up the shapshot is just a matter of locking and coordination.  
However, writes to the origin or snapshot (may) require allocating a cluster,
copying the origin data, then writing the origin.  All of this coordinated
with all the machines using the VG.  Apart from some cleven invention, this
requires global locking on many writes.  This is just too inefficient.

However, you can obtain the same effect using a SAN.  Have one machine
run LVM (and raid, etc), and export LVs via AoE or iSCSI.  Of course,
that LVM machine now becomes a single point of failure...

Here's an idea (someone probably already thought of this, but..), 
have one machine in a cluster elected "master" for a VG, and have all
reads/writes from other machines go through the master via AoE or iSCSI.
When failure of the "master" is detected, elect another machine to take over
as master.  Sort of a rotating SAN server.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
