Date: Wed, 30 Sep 2020 09:15:14 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200930141514.GA26002@redhat.com>
References: <HE1PR0402MB3514DC4297C272DF86ECB70FCF320@HE1PR0402MB3514.eurprd04.prod.outlook.com>
	<20200929140230.GA19493@redhat.com>
	<bb9b3f06-b5cc-bca1-404e-22a7296b5be0@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb9b3f06-b5cc-bca1-404e-22a7296b5be0@suse.com>
Subject: Re: [linux-lvm] lvresize cannot refresh LV size on on other hosts
 when extending LV with a shared lock
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
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On Wed, Sep 30, 2020 at 06:08:53PM +0800, Gang He wrote:
> Hi David,
> 
> Thank for your helps.
> 
> On 9/29/2020 10:02 PM, David Teigland wrote:
> > On Tue, Sep 29, 2020 at 08:46:25AM +0000, Gang He wrote:
> > > ghe-tw-nd1# lvresize -L+1024M vg1/lv1
> > >    WARNING: extending LV with a shared lock, other hosts may require LV refresh.
> > >    Size of logical volume vg1/lv1 changed from 13.00 GiB (3328 extents) to 14.00 GiB (3584 extents).
> > >    Logical volume vg1/lv1 successfully resized.
> > >    Refreshing LV /dev//vg1/lv1 on other hosts...
> > 
> > Triggering remote lvchange refresh for lvresize has been implemented using
> > dlm_controld.  See configure --enable-lvmlockd-dlmcontrol which enables
> > lvmlockd to use the libdlmcontrol api dlmc_run_start/dlm_run_check.
> > Dave
> That means LV size will be refreshed automatically if this configure option
> is enabled, right?

right

> If we do not enable this configure option, we can use "lvchange --refresh
> vg/lv" on the other nodes to synchronize LV size, right?

right

> This command will affect the upper cluster file system if it is running?

I'm not sure I underststand, but extending the lv shouldn't effect the fs.
Extending the fs (e.g. gfs2_grow) will make the fs use the new space.

Dave
