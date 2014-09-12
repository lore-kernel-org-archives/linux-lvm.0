Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8CFmd8S020848
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2014 11:48:39 -0400
Received: from nm5-vm5.access.bullet.mail.bf1.yahoo.com
	(nm5-vm5.access.bullet.mail.bf1.yahoo.com [216.109.114.132])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8CFmbY8008408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2014 11:48:38 -0400
Message-ID: <1410536916.19207.YahooMailBasic@web181504.mail.ne1.yahoo.com>
Date: Fri, 12 Sep 2014 08:48:36 -0700
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <5412DF0B.40706@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and I/O block size (max_sectors_kb)
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

my understanding was that this is an OLD problem (as designed?) Conceivably LVM could be written to be smart enough to query all of the underlying PV and arrive at the lowest common value <= PhysicalExtent-Size. But it was probably more expedient to just hard code it to the native BIO value.
