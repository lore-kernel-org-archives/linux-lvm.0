Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j65KiMV30876
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 16:44:22 -0400
Received: from cs.columbia.edu (cs.columbia.edu [128.59.16.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j65KiKZ8017821
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 16:44:20 -0400
Received: from algiers.clic.cs.columbia.edu
	(IDENT:9ckzCxhb/IUuEQurXVn8bFRMq/CmZtku@algiers.clic.cs.columbia.edu
	[128.59.15.63])
	by cs.columbia.edu (8.12.10/8.12.10) with ESMTP id j65KiISa006565
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 16:44:19 -0400 (EDT)
Received: from algiers.clic.cs.columbia.edu
	(IDENT:n7tM5mgx+QFXGoEAcW1mgjXguHZVXNgc@localhost [127.0.0.1])
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10) with ESMTP id
	j65KiIMl021643
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 16:44:18 -0400
Received: from localhost (phung@localhost)
	by algiers.clic.cs.columbia.edu (8.12.10/8.12.10/Submit) with ESMTP id
	j65KiIUH021639
	for <linux-lvm@redhat.com>; Tue, 5 Jul 2005 16:44:18 -0400
Date: Tue, 5 Jul 2005 16:44:18 -0400 (EDT)
From: "Dan B. Phung" <phung@cs.columbia.edu>
Subject: Re: [linux-lvm] Segfault in lvcreate?
In-Reply-To: <20050705203425.GC12337@agk.surrey.redhat.com>
Message-ID: <Pine.LNX.4.44.0507051644020.21204-100000@algiers.clic.cs.columbia.edu>
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

oooh, ah, that worked, cvs updated, and things are good now, thanks!

On 5, Jul, 2005, Alasdair G Kergon declared:

> On Tue, Jul 05, 2005 at 04:27:45PM -0400, Dan B. Phung wrote:
> > I used an old version from a build I cvs updated from
> > earlier this year:
>  
> If you're using CVS, you're always taking a chance as to whether or
> not it'll work.  Update to the current CVS and try again.
> 
> If it still fails, post a backup of your metadata here.
> Add -vvvv to the cmd to get diagnostic output, and post the last few 
> lines of it here.
> 
> Alasdair
> 

-- 
email:  phung@cs.columbia.edu
www:    http://www.cs.columbia.edu/~phung
phone:  646-775-6090
office: CS Dept. 520, 1214 Amsterdam Ave., MC 0401, New York, NY 10027
