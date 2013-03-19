Date: Tue, 19 Mar 2013 13:16:09 -0400
From: David Teigland <teigland@redhat.com>
Message-ID: <20130319171608.GE986@redhat.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<1363699970-10002-11-git-send-email-bubble@hoster-ok.com>
	<20130319153215.GB986@redhat.com> <5148874A.2060106@hoster-ok.com>
	<20130319155456.GC986@redhat.com> <514897BE.90609@hoster-ok.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <514897BE.90609@hoster-ok.com>
Subject: Re: [linux-lvm] [PATCH 10/10] man: document --node option to
	lvchange
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
To: Vladislav Bogdanov <bubble@hoster-ok.com>
Cc: linux-lvm@redhat.com

On Tue, Mar 19, 2013 at 07:52:14PM +0300, Vladislav Bogdanov wrote:
> And, do you have any estimations, how long may it take to have you ideas
> ready for production use?

It'll be quite a while (and the new locking scheme I'm working on will not
include remote command execution.)

> Also, as you're not satisfied with this implementation, what alternative
> way do you see? (calling ssh from libvirt or LVM API is not a good idea
> at all I think)

Apart from using ovirt/rhev, I'd try one of the following behind the
libvirt locking api: sanlock, dlm, file locks on nfs, file locks on gfs2.
There may also be ways to run remote commands other than ssh that would
work better from libvirt, although I don't have any specific suggestion.
