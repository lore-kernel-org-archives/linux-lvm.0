Date: Sat, 17 Nov 2018 00:24:05 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20181117002405.GF5291@agk-dp.fab.redhat.com>
References: <e5147fd46fc8d3acf7eebac26a50852f@cs.uni-dortmund.de>
	<20181115175718.GE5291@agk-dp.fab.redhat.com>
	<2a7f4f1fc1a54fd6eca7d7bc9a6249ae@cs.uni-dortmund.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a7f4f1fc1a54fd6eca7d7bc9a6249ae@cs.uni-dortmund.de>
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
To: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Nov 16, 2018 at 02:43:10PM +0100, Christoph Pleger wrote:
> I get security by checking the real user id at the beginning of the  
> program and aborting the program if that uid does not belong to the only  
> user who is allowed to run the program. 

Sounds familiar.  Shall I tell you one of those stories?

I used a system where the sysadmin was worried that letting people run
the setuid 'su' binary was too dangerous, so he wrote a wrapper around
it to "improve" security.  The wrapper checked you were in the admin
group before letting you run the real 'su'.  Of course anyone who
understood how setuid works better than he did could now use the
wrapper in numerous different ways to become root directly without a
password.  

If you care about security find another solution that doesn't involve
writing your own privileged code to be run under the control of an
unprivileged user.

Alasdair
