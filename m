Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n2CEv3XY026000
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 10:57:03 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1LhmLG-0007SW-B9
	for linux-lvm@redhat.com; Thu, 12 Mar 2009 14:57:02 +0000
Date: Thu, 12 Mar 2009 14:57:02 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvcreate and partition alignment
Message-ID: <20090312145702.GH7445@agk.fab.redhat.com>
References: <f4f537b50903120752s73e40288wbdfaaae814acbdd9@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4f537b50903120752s73e40288wbdfaaae814acbdd9@mail.gmail.com>
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

On Thu, Mar 12, 2009 at 09:52:32AM -0500, Eugene Vilensky wrote:
> Is there another "allocation" setting that we need to select for LVM
> specifically, to ensure alignment to this 4k NetApp boundary?
 
The default alignment should (64k) work fine if you've no other
layers like partitions in between.

Alasdair
-- 
agk@redhat.com
