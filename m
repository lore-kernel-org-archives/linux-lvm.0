Date: Tue, 22 Sep 2009 14:23:30 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] grow lv bug
Message-ID: <20090922132330.GO1210@agk-dp.fab.redhat.com>
References: <200909220808.16458.whobedobe@dodo.com.au>
	<20090921223257.GB22590@us.ibm.com>
	<20090921224718.GH1210@agk-dp.fab.redhat.com>
	<200909222316.02416.whobedobe@dodo.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200909222316.02416.whobedobe@dodo.com.au>
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
To: Hugh <whobedobe@dodo.com.au>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Sep 22, 2009 at 11:16:02PM +1000, Hugh wrote:
> pvresize - success

Do you recall what command line you used?
Did you just do pvresize <device>
or did you use the --setphysicalvolumesize argument?

Alasdair
