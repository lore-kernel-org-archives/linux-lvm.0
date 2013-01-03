Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r03I3A72016369
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 3 Jan 2013 13:03:11 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1Tqp82-0005a2-Fv
	for linux-lvm@redhat.com; Thu, 03 Jan 2013 18:02:54 +0000
Date: Thu, 3 Jan 2013 18:02:54 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130103180254.GC19165@agk-dp.fab.redhat.com>
References: <50DB10B4.1000505@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50DB10B4.1000505@gmail.com>
Subject: Re: [linux-lvm] label sector and non 512 byte sectors
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

On Wed, Dec 26, 2012 at 09:59:00AM -0500, Phillip Susi wrote:
> The man page for pvcreate states that the label goes in the second
> sector.  That means it SHOULD be at an offset of 4096 bytes when using
> 4096 byte sectors, but apparently it is still at an offset of 512 bytes.
>  Bug?
 
We define a sector at 512 bytes. Always.

Some documentation could be improved to make that clearer.

Alasdair
