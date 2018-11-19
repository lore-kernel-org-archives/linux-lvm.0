Date: Mon, 19 Nov 2018 13:19:40 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20181119131940.GA13390@localhost.localdomain>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alasdair G Kergon <agk@redhat.com>

On Fri, Nov 16, 2018 at 02:43:10PM +0100, Christoph Pleger wrote:
> The beginning is that I want to create a user-specific logical volume when a
> user logs in to a service that authenticates its users through pam and that
> does not run as root.

Couldn't you use a pam_scripts ses_open/ses_close hook to do this?

That way you can get rid of any suid binary and rely on the well
tested PAM stack to carry out the set up (and optionally clean up)
for the users at login/out time.

Regards,
Bryn.
