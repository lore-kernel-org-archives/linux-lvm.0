MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 16 Nov 2018 14:43:10 +0100
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
In-Reply-To: <20181115175718.GE5291@agk-dp.fab.redhat.com>
References: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
	<20181115175718.GE5291@agk-dp.fab.redhat.com>
Message-ID: <2a7f4f1fc1a54fd6eca7d7bc9a6249ae@cs.uni-dortmund.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alasdair G Kergon <agk@redhat.com>

Hello,

> Let's stop there.  The fact you're asking a question about setuid
> suggests you don't understand enough to be able to use it safely.

I get security by checking the real user id at the beginning of the 
program and aborting the program if that uid does not belong to the only 
user who is allowed to run the program. That user is me and I guess that 
it is much more insecure to run the whole service that wants to 
authenticate users through PAM as root.

> Go back to the beginning and describe the original problem you are
> trying to solve and the constraints you have and ask for advice about
> ways to achieve it.

The beginning is that I want to create a user-specific logical volume 
when a user logs in to a service that authenticates its users through 
pam and that does not run as root.

Regards
   Christoph
