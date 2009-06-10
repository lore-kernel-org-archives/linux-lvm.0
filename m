Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5AMV6fG008056
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 18:31:06 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5AMUrH4005961
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 18:30:53 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n5AMUqG3014244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 18:30:53 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n5AMUqUw030896
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 18:30:52 -0400
Date: Wed, 10 Jun 2009 18:30:52 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Data deduplication in LVM?
In-Reply-To: <4855BFEA-C772-4B98-A18E-C406FD5737DD@karlsbakk.net>
Message-ID: <Pine.LNX.4.64.0906101822350.30724@bmsred.bmsi.com>
References: <4855BFEA-C772-4B98-A18E-C406FD5737DD@karlsbakk.net>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 10 Jun 2009, Roy Sigurd Karlsbakk wrote:

> Is this nonsense, or might it be an idea?

It's an idea.  With loosely coupled distributed computing, deduplication on
the nodes is not all that helpful, since each node needs its own copy anyway.
However, it is very helpful for backup.  One OSS backup product that does
deduplication is BackupPC (written in Perl).  In the backup server, every file
gets hard linked to a name in a special directory that is its md5 checksum
(plus some fiddly logic to handle metadata).  Handling the metadata separately
also lets the backup repository run as an ordinary user, yet reuse the
OS filesystem to store the files.

Another product that implements its own datastore is Box Backup (written in C).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
