Date: Tue, 3 Sep 2019 10:17:05 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20190903151705.GA30692@redhat.com>
References: <c88b7c49-1046-ae78-4352-fa51e1ef7873@suse.com>
	<20190829143759.GA22659@redhat.com>
	<9280276f-8601-cfbc-db46-1dcb28f92229@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9280276f-8601-cfbc-db46-1dcb28f92229@suse.com>
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
Cc: Martin Wilck <mwilck@suse.de>, linux-lvm@redhat.com

On Tue, Sep 03, 2019 at 05:02:25AM +0000, Heming Zhao wrote:
> Test result URL:
> https://gist.github.com/zhaohem/f9951bb016962cdd07bf7c9d3d7fd525

At least part of the problem is caused by lvm waiting on udev, e.g.
WARNING: Device /dev/vdf76 not initialized in udev database even after waiting 10000000 microseconds.

I recently wrote this patch to stop that:
https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=0534cd9cd4066c88a7dd815f2f3206a177169334

With this older patch, obtain_device_list_from_udev=0 can also help avoid it:
https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=3ebce8dbd2d9afc031e0737f8feed796ec7a8df9

Also, I just pushed out this commit that makes the pvscan activations
faster when there are many PVs:
https://sourceware.org/git/?p=lvm2.git;a=commit;h=25b58310e3d606a85abc9bd50991ccb7ddcbfe25

Dave
