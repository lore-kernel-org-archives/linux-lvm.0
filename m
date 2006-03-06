Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k26Hhrf2025532
	for <linux-lvm@redhat.com>; Mon, 6 Mar 2006 17:43:53 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FGJkP-0000iw-72
	for linux-lvm@redhat.com; Mon, 06 Mar 2006 17:43:53 +0000
Date: Mon, 6 Mar 2006 17:43:53 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] cleaning archive directory
Message-ID: <20060306174353.GD25317@agk.surrey.redhat.com>
References: <4406CDB1.1050000@carmen.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4406CDB1.1050000@carmen.se>
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

On Thu, Mar 02, 2006 at 11:49:21AM +0100, Olle Liljenzin wrote:
> Is the directory /etc/lvm/archive supposed to be cleaned up manually or 
> should it be done by some tool?
 
> I find parameters like 'retain_min' and 'retain_days' in the file 
> /etc/lvm.conf, which I thought was indicating some kind of automatic 
> cleaning tool or process. 

They should normally get cleaned up automatically.

The parameters apply to each VG separately, and the checks are made
whenever a new archive file is written for that VG.
(So backups of old VGs won't be deleted.)

Default keeps backups for at least 30 days and won't delete any unless 
that leaves at least 10 backups of that VG.

Alasdair
-- 
agk@redhat.com
