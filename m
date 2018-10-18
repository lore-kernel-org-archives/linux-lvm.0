Date: Thu, 18 Oct 2018 12:59:23 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20181018175923.GC28661@redhat.com>
References: <5BBB301F020000F90003854E@prv1-mh.provo.novell.com>
	<20181008150016.GB21471@redhat.com>
	<5BC42808020000F90003A3E5@prv1-mh.provo.novell.com>
	<20181015152648.GB29274@redhat.com>
	<5BC6C5AC020000F90003ACAD@prv1-mh.provo.novell.com>
	<20181017141025.GA9941@redhat.com>
	<20181017184204.GC14214@redhat.com>
	<5BC84979020000F90003B507@prv1-mh.provo.novell.com>
	<20181018160159.GA28661@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181018160159.GA28661@redhat.com>
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
Cc: Sven Eschenberg <sven@eschenberg.eu>, linux-lvm@redhat.com

On Thu, Oct 18, 2018 at 11:01:59AM -0500, David Teigland wrote:
> On Thu, Oct 18, 2018 at 02:51:05AM -0600, Gang He wrote:
> > If I include this patch in lvm2 v2.02.180,
> > LVM2 can activate LVs on the top of RAID1 automatically? or we still have to set "allow_changes_with_duplicate_pvs=1" in lvm.conf?
> 
> I didn't need any config changes when testing this myself, but there may
> be other variables I've not encountered.

See these three commits:
d1b652143abc tests: add new test for lvm on md devices
e7bb50880901 scan: enable full md filter when md 1.0 devices are present
de2863739f2e scan: use full md filter when md 1.0 devices are present

at https://sourceware.org/git/?p=lvm2.git;a=shortlog;h=refs/heads/2018-06-01-stable

(I was wrong earlier; allow_changes_with_duplicate_pvs is not correct in
this case.)
