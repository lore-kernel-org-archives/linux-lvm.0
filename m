From: Heming Zhao <heming.zhao@suse.com>
Date: Wed, 4 Sep 2019 08:13:50 +0000
Message-ID: <ff7a48ee-221d-d5a3-14ad-074806abf5b8@suse.com>
References: <c88b7c49-1046-ae78-4352-fa51e1ef7873@suse.com>
	<20190829143759.GA22659@redhat.com>
	<9280276f-8601-cfbc-db46-1dcb28f92229@suse.com>
	<20190903151705.GA30692@redhat.com>
In-Reply-To: <20190903151705.GA30692@redhat.com>
Content-Language: en-US
Content-ID: <B1B2549A0C9AFF4B89E49E44E456D7C8@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: David Teigland <teigland@redhat.com>
Cc: Martin Wilck <mwilck@suse.de>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Thanks for you reply.

I found the latest lvm2 git source code contains your 3 commits. So I 
built lvm2 with today's git code. But there is no big change as before.

ENV: fedora30 server edition, 896 PVs.

All below results from today's work.

[with patch]
event_activation = 1 && obtain_device_list_from_udev = 1
boot time: 1min 44.295s

event_activation = 0 && obtain_device_list_from_udev = 0
boot time: 59.759s

[without patch]
event_activation = 1 && obtain_device_list_from_udev = 1
boot time: 1min 56.040s

event_activation = 0 && obtain_device_list_from_udev = 0
boot time: 1min 6.715s

Thanks.

On 9/3/19 11:17 PM, David Teigland wrote:
> On Tue, Sep 03, 2019 at 05:02:25AM +0000, Heming Zhao wrote:
>> Test result URL:
>> https://gist.github.com/zhaohem/f9951bb016962cdd07bf7c9d3d7fd525
> 
> At least part of the problem is caused by lvm waiting on udev, e.g.
> WARNING: Device /dev/vdf76 not initialized in udev database even after waiting 10000000 microseconds.
> 
> I recently wrote this patch to stop that:
> https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=0534cd9cd4066c88a7dd815f2f3206a177169334
> 
> With this older patch, obtain_device_list_from_udev=0 can also help avoid it:
> https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=3ebce8dbd2d9afc031e0737f8feed796ec7a8df9
> 
> Also, I just pushed out this commit that makes the pvscan activations
> faster when there are many PVs:
> https://sourceware.org/git/?p=lvm2.git;a=commit;h=25b58310e3d606a85abc9bd50991ccb7ddcbfe25
> 
> Dave
> 
