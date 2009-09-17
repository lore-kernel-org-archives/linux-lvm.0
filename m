Date: Thu, 17 Sep 2009 10:32:28 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20090917143227.GA9750@redhat.com>
References: <515267.47209.qm@web51301.mail.re2.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <515267.47209.qm@web51301.mail.re2.yahoo.com>
Subject: [linux-lvm] Re: Snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon@eHardcastle.com, LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Sep 17 2009 at 10:24am -0400,
Jon Hardcastle <jd_hardcastle@yahoo.com> wrote:

> Hi,
> 
> Do I need some free extents to create a READ ONLY snapshot? I dont
> have free extents but require a read-only snapshot before doing an
> upgrade.

Yes, even though you intend to only read from the snapshot the upgrade
will cause data to be copied out from the origin to the snapshot.  So
you definitely need some free extents.

Mike
