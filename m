Date: Wed, 17 Oct 2018 09:10:25 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20181017141025.GA9941@redhat.com>
References: <5BBB301F020000F90003854E@prv1-mh.provo.novell.com>
	<20181008150016.GB21471@redhat.com>
	<5BC42808020000F90003A3E5@prv1-mh.provo.novell.com>
	<20181015152648.GB29274@redhat.com>
	<5BC6C5AC020000F90003ACAD@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5BC6C5AC020000F90003ACAD@prv1-mh.provo.novell.com>
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
To: Gang He <ghe@suse.com>
Cc: linux-lvm@redhat.com

On Tue, Oct 16, 2018 at 11:16:28PM -0600, Gang He wrote:
> > - allow_changes_with_duplicate_pvs=1
> > - external_device_info_source="udev"
> > - reject sda2, sdb2 in lvm filter

> 1) why did the solution 1 not work? since the method looks more close to
> fix this problem. 

Check if the version you are using has this commit:
https://sourceware.org/git/?p=lvm2.git;a=commit;h=09fcc8eaa8eb7fa4fcd7c6611bfbfb83f726ae38

If so, then I'd be interested to see the -vvvv output from that pvs command.

> 2) Could we back-port some code from v2.02.177 source files to keep the
> compatibility? to avoid modifying some items manually.  or, we have to
> accept this problem from v2.02.180 (maybe 178?) due to by-design? 

It's not clear to me exactly which code you're looking at backporting to
where.
