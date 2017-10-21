Date: Fri, 20 Oct 2017 23:05:57 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20171021030557.GE31049@redhat.com>
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<23016.63588.505141.142275@quad.stoffel.home>
	<beac3436-06a8-9365-4934-9db1a1f9ed34@member.fsf.org>
	<23018.20452.919839.109594@quad.stoffel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23018.20452.919839.109594@quad.stoffel.home>
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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
To: John Stoffel <john@stoffel.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Oct 20 2017 at  3:35pm -0400,
John Stoffel <john@stoffel.org> wrote:

> >>>>> "Oleg" == Oleg Cherkasov <o1e9@member.fsf.org> writes:
> 
> I think you're running into a RedHat bug at this point.  I'd probably
> move to Debian and run my own kernel with the latest patches for MD, etc.

There is no reason to think this is a "RedHat bug".. verdict is very much
still out (but yes the kernel core is very different in RHEL7 than
upstream Linux.. though we have no details to suggest _where_ the issue
lies.. if it is a pathologicl dm-cache code issue then RHEL7.4 and
upstream Linux should both see the problem).

Moving distros is a waste of time given that RHEL7.4 and Centos7.4 have
the latest dm-cache code.  The issue is likely DM-cache specific (not
RHEL7.4 specific).

In general: RHEL7 or Centos7 will provide the best support of DM-cache.
All developers invested in DM-cache work for Red Hat.

Mike
