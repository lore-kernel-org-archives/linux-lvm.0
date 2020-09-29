Date: Tue, 29 Sep 2020 09:02:30 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200929140230.GA19493@redhat.com>
References: <HE1PR0402MB3514DC4297C272DF86ECB70FCF320@HE1PR0402MB3514.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <HE1PR0402MB3514DC4297C272DF86ECB70FCF320@HE1PR0402MB3514.eurprd04.prod.outlook.com>
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
To: Gang He <GHe@suse.com>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On Tue, Sep 29, 2020 at 08:46:25AM +0000, Gang He wrote:
> ghe-tw-nd1# lvresize -L+1024M vg1/lv1
>   WARNING: extending LV with a shared lock, other hosts may require LV refresh.
>   Size of logical volume vg1/lv1 changed from 13.00 GiB (3328 extents) to 14.00 GiB (3584 extents).
>   Logical volume vg1/lv1 successfully resized.
>   Refreshing LV /dev//vg1/lv1 on other hosts...

Triggering remote lvchange refresh for lvresize has been implemented using
dlm_controld.  See configure --enable-lvmlockd-dlmcontrol which enables
lvmlockd to use the libdlmcontrol api dlmc_run_start/dlm_run_check.
Dave
