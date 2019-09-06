Date: Fri, 6 Sep 2019 09:26:46 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20190906142646.GD652@redhat.com>
References: <20190829143759.GA22659@redhat.com>
	<9280276f-8601-cfbc-db46-1dcb28f92229@suse.com>
	<20190903151705.GA30692@redhat.com>
	<ff7a48ee-221d-d5a3-14ad-074806abf5b8@suse.com>
	<370ba3fa-53df-7213-8876-d37ef1a3b57e@suse.com>
	<20190905165519.GB30473@redhat.com>
	<faa66217-fc52-5785-1ca9-d73b13727c12@suse.com>
	<b3790725-7a60-6fd7-ab64-8dfd75ce6628@suse.com>
	<8b432efdabc3de82146ea6cb87b27c89556bf72e.camel@suse.de>
	<4552ae36-09fc-9145-d768-80b4ef572bca@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4552ae36-09fc-9145-d768-80b4ef572bca@suse.com>
Subject: Re: [linux-lvm] system boot time regression when using lvm2-2.03.05
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
To: Heming Zhao <heming.zhao@suse.com>
Cc: Martin Wilck <mwilck@suse.de>, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Sep 06, 2019 at 08:46:52AM +0000, Heming Zhao wrote:
> the _online_pvscan_one cost too much time when booting.

The pvscan debug output has timestamps and should show any steps that are
slow or delayed somehow.
