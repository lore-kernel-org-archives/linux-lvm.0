Date: Tue, 19 Mar 2013 12:03:20 -0400
From: David Teigland <teigland@redhat.com>
Message-ID: <20130319160319.GD986@redhat.com>
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<1363699970-10002-2-git-send-email-bubble@hoster-ok.com>
	<20130319152347.GA986@redhat.com> <51488550.5070201@hoster-ok.com>
	<514887FA.4000104@hoster-ok.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <514887FA.4000104@hoster-ok.com>
Subject: Re: [linux-lvm] [PATCH 01/10] lvchange: Allow cluster lock
	conversion
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

On Tue, Mar 19, 2013 at 06:44:58PM +0300, Vladislav Bogdanov wrote:
> >> I'm trying to figure out why the code doesn't already use CONVERT when
> >> possible; I would have expected it to. 
> > 
> >> What happens now without this force/CONVERT
> >> patch? a new lock created/requested?
> >>

> After new lock creation is requested ;)

Yeah, it doesn't make much sense for clvmd-corosync.c to do that.
I'm hoping that we can make clvmd-corosync.c aware that it already
holds that lock and attempt to convert it.
