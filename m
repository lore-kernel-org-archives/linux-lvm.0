Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJH5Rr15420
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 12:05:27 -0500
Received: from email.careercast.com (email.careercast.com [216.39.101.233])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id iAJH5LB8004643
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 12:05:21 -0500
Subject: Re: [linux-lvm] relocate on write for snapshot
From: Clint Byrum <cbyrum@spamaps.org>
In-Reply-To: <1100882347.2984.32.camel@localhost.localdomain>
References: <1100882347.2984.32.camel@localhost.localdomain>
Date: Fri, 19 Nov 2004 09:05:20 -0800
Message-Id: <1100883920.16306.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: mingz@ele.uri.edu, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2004-11-19 at 11:39 -0500, Ming Zhang wrote:
> Hi, I wonder if there are any thought about a relocate on write policy
> for snapshot instead of copy on write policy used now?
> 
> instead of copy old one to snapshot, overwrite old one with new one, 2
> writes and 1 reads. it is possible that write new data to a usused
> location directly.
> 
> i know later remove a snaphot will be a little trouble, but there must
> be some way to get around it.
> 
> just a rough thought, any comment?
> 

I thought the way it worked now was for snapshot LV to be marked as the
"active destination" for all new writes to the logical volume. On write,
the data isn't copied, just the metadata is changed to reflect which
physical extent the block is now located on, and the old one is then
reallocated as part of the snapshot.

Am I wrong?

-- 
Clint Byrum <cbyrum@spamaps.org>
