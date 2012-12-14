Date: Fri, 14 Dec 2012 08:10:40 +0100
From: Jacek Konieczny <jajcus@jajcus.net>
Message-ID: <20121214071040.GA10390@jajo.eggsoft>
References: <50C90FC1.4060803@yahoo.co.uk>
 <50C9A838.3080709@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50C9A838.3080709@redhat.com>
Subject: Re: [linux-lvm] clvmd on cman waits forever holding the P_#global
 lock on node re-join
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: linux-lvm@redhat.com

On Thu, Dec 13, 2012 at 11:04:40AM +0100, Zdenek Kabelac wrote:
> Hmmm this rather looks like a logical problem either in
> the if() expression in (select_status == 0) branch,

No fix in the (select_status == 0) branch would solve anything, as the
branch is never executed. This is the major problem here.

Select has timeout set to 60 seconds, a few fd events come each minute
-> the select never times out, select_status is always != 0.

Shortening the cmd_timeout setting would work, but that would be only a
workaround and would work until the fd events come even more often.

Greets,
        Jacek
