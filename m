Message-ID: <5242BA53.7030905@redhat.com>
Date: Wed, 25 Sep 2013 11:26:27 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <CAHuLeSnj8SrvF=Q5jq2WE5S1CjJwisX+3oTb5760uR94rkVfnw@mail.gmail.com>
In-Reply-To: <CAHuLeSnj8SrvF=Q5jq2WE5S1CjJwisX+3oTb5760uR94rkVfnw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Failed to login LVM CVS
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Justin Lee <justinlee5455@gmail.com>

On 09/25/2013 11:11 AM, Justin Lee wrote:
> I wanted to get the source code of LVM 2.02.86(2) (2011-07-08) and I
> saw the instructions on web page
> http://www.tldp.org/HOWTO/html_single/LVM-HOWTO/#checkoutsource to
> check out the source from CVS. So I gave it a try and I got an error
> like this:

The primary version control system was moved from CVS to git in June of
last year:

https://sourceware.org/lvm2/

You can clone the repo with the following command:

  $ git clone git://git.fedorahosted.org/git/lvm2.git
  [...]

Then checkout the v2_02_86 tag:

  $ git checkout v2_02_86
  Note: checking out 'v2_02_86'.

  You are in 'detached HEAD' state. You can look around, make
  experimental changes and commit them, and you can discard any commits
  you make in this state without impacting any branches by performing
  another checkout.

  If you want to create a new branch to retain commits you create, you
  may do so (now or later) by using -b with the checkout command again.
  Example:

  git checkout -b new_branch_name

  HEAD is now at 4c67e55... remove unnecessary lvconvert.h

Following this your lvm2 directory will contain the sources as they were
at the time that tag was created.

Regards,
Bryn.
