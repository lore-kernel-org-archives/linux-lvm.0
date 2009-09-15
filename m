Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8FBndcj030810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2009 07:49:40 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1MnWXT-0001E2-FY
	for linux-lvm@redhat.com; Tue, 15 Sep 2009 12:49:39 +0100
Date: Tue, 15 Sep 2009 12:49:39 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] I've tried to get some support on this list about lvm
Message-ID: <20090915114939.GA2715@agk-dp.fab.redhat.com>
References: <200909152137.44474.whobedobe@dodo.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200909152137.44474.whobedobe@dodo.com.au>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Sep 15, 2009 at 09:37:44PM +1000, Hugh wrote:
> Sep 10 20:55:46 fc11-64 kernel: device-mapper: table: device 8:18 
> too small for target

There's your answer: You're trying to make it bigger than the underlying
device.

Use pvs -v to check device sizes for discrepancies.
(--units s if necessary).

Alasdair
