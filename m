Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBIJgu9A014024
	for <linux-lvm@redhat.com>; Sat, 18 Dec 2004 19:42:56 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CfkTg-0001XQ-Re
	for linux-lvm@redhat.com; Sat, 18 Dec 2004 19:42:56 +0000
Date: Sat, 18 Dec 2004 19:42:56 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [PATCH] cannot create PV on empty drive
Message-ID: <20041218194256.GH26670@agk.surrey.redhat.com>
References: <41C1C572.15958.1B62373@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41C1C572.15958.1B62373@localhost>
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

Do you have verbose output from the failing pvcreate with '-vvvv'?
(or debug-log-to-file output)

On Thu, Dec 16, 2004 at 05:27:14PM +0100, Jerome Borsboom wrote:
> Some debugging showed that the culprit was the recent change to 
> the dev_open_flags code. 

The patch was produced under severe time pressure before I went away 
and I know it doesn't deal with one case properly - maybe the case 
you hit.  It addresses a symptom not the cause: the code is not meant 
to be trying to write to read-only file descriptors in the first place,
and this happens here because of a shortcoming in way it does its locking. 
I'll deal with this maybe later this week or else in the New Year.

Alasdair
-- 
agk@redhat.com
