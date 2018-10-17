Date: Wed, 17 Oct 2018 13:42:04 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20181017184204.GC14214@redhat.com>
References: <5BBB301F020000F90003854E@prv1-mh.provo.novell.com>
	<20181008150016.GB21471@redhat.com>
	<5BC42808020000F90003A3E5@prv1-mh.provo.novell.com>
	<20181015152648.GB29274@redhat.com>
	<5BC6C5AC020000F90003ACAD@prv1-mh.provo.novell.com>
	<20181017141025.GA9941@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181017141025.GA9941@redhat.com>
Subject: Re: [linux-lvm] Fails to create LVM volume on the top of RAID1
 after upgrade lvm2 to v2.02.180
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
To: Gang He <ghe@suse.com>, Sven Eschenberg <sven@eschenberg.eu>
Cc: linux-lvm@redhat.com

On Wed, Oct 17, 2018 at 09:10:25AM -0500, David Teigland wrote:
> Check if the version you are using has this commit:
> https://sourceware.org/git/?p=lvm2.git;a=commit;h=09fcc8eaa8eb7fa4fcd7c6611bfbfb83f726ae38

I see that this commit is missing from the stable branch:
https://sourceware.org/git/?p=lvm2.git;a=commit;h=3fd75d1bcd714b02fb2b843d1928b2a875402f37

I'll backport that one.

Dave
