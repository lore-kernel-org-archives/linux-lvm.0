Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k27FmVSF011818
	for <linux-lvm@redhat.com>; Tue, 7 Mar 2006 15:48:31 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FGeQJ-0001pa-E7
	for linux-lvm@redhat.com; Tue, 07 Mar 2006 15:48:31 +0000
Date: Tue, 7 Mar 2006 15:48:31 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] cleaning archive directory
Message-ID: <20060307154831.GG25317@agk.surrey.redhat.com>
References: <4406CDB1.1050000@carmen.se>
	<20060306174353.GD25317@agk.surrey.redhat.com>
	<440DA536.9030706@carmen.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <440DA536.9030706@carmen.se>
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

On Tue, Mar 07, 2006 at 04:22:30PM +0100, Olle Liljenzin wrote:
> Then I think the clean up is broken in RHEL4.
 
Yep: A fix to a related problem several months ago introduced this
new problem.

I've put a fix into CVS; it's still not perfect because it still 
uses the modification time in the filesystem rather than opening
each file and checking the creation time within the archive.

Alasdair
-- 
agk@redhat.com
