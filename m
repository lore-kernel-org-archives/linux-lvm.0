Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9680860BEC
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2018 17:57:20 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@redhat.com>) id 1gNLtH-0002BH-02
	for linux-lvm@redhat.com; Thu, 15 Nov 2018 17:57:19 +0000
Date: Thu, 15 Nov 2018 17:57:18 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20181115175718.GE5291@agk-dp.fab.redhat.com>
References: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
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

On Thu, Nov 15, 2018 at 05:39:56PM +0100, Christoph Pleger wrote:
> I am calling lvcreate from a setuid-binary, which internally calls  

Let's stop there.  The fact you're asking a question about setuid 
suggests you don't understand enough to be able to use it safely.

Seriously, never use setuid for anything until you have a thorough
understanding of its internals (userspace and kernel) and ld-linux,
capabilities, process contexts, acls, selinux etc.  It's just too easy
to make your system insecure because of something you didn't even
realise you had to consider!  (I could tell you some funny stories...)

Go back to the beginning and describe the original problem you are 
trying to solve and the constraints you have and ask for advice about
ways to achieve it.

Alasdair
