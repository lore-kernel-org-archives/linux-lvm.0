References: <45cd0f1b-b86a-b0dd-e8c8-d743ea4bd3ab@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c9020a11-12ff-3900-6e5f-8fad09e9d91b@redhat.com>
Date: Mon, 5 Jun 2017 10:44:49 +0200
MIME-Version: 1.0
In-Reply-To: <45cd0f1b-b86a-b0dd-e8c8-d743ea4bd3ab@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM send/receive support?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 5.6.2017 v 10:11 Gionatan Danti napsal(a):
> Hi all,
> I wonder if using LVM snapshots (even better: lvmthin snapshots, which are way 
> faster) we can wire something like zfs or btrfs send/receive support.
> 
> In short: take a snapshot, do a full sync, take another snapshot and sync only 
> the changed blocks.
> 
> I know that exists an utility called lvmsync[1], but it seem not maintained 
> anymore. Any suggestion on how to do something similar?


Hi

Unfortunately there is not yet direct lvm2 support - but you can do it 
manually via  thin-pool and it support tools.

Look at the tool  'thin_delta'  which you can use exactly for the purpose you 
describe.

Regards

Zdenek
