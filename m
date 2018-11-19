Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 778F5BA92
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2018 13:01:51 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@redhat.com>) id 1gOjBW-0000jq-9D
	for linux-lvm@redhat.com; Mon, 19 Nov 2018 13:01:50 +0000
Date: Mon, 19 Nov 2018 13:01:50 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20181119130150.GA487@agk-dp.fab.redhat.com>
References: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
	<20181115175718.GE5291@agk-dp.fab.redhat.com>
	<2a7f4f1fc1a54fd6eca7d7bc9a6249ae@cs.uni-dortmund.de>
	<20181117002405.GF5291@agk-dp.fab.redhat.com>
	<25b87d17a683075e57f45422ee3ef7f6@cs.uni-dortmund.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25b87d17a683075e57f45422ee3ef7f6@cs.uni-dortmund.de>
Subject: Re: [linux-lvm] lvcreate from a setuid-root binary
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

On Mon, Nov 19, 2018 at 09:55:07AM +0100, Christoph Pleger wrote:
> My program calls getpwuid() with the real user id of the calling user  
> and then compares this user's name with the name of the one and only  
> user who is allowed to continue program execution. Do you think that  
> this can be circumvented?

I'll just repeat - don't write your own setuid programs if you care
about security.  Here's an old paper that lists some (and certainly not
all!) of the things people who do write them have to understand:

  http://man7.org/conf/lca2010/writing_secure_privileged_programs.pdf

It only takes one mistake or one thing you didn't know about or
understand properly to make your system insecure.

Alasdair
