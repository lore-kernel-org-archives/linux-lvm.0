References: <BAY178-W67E32E6735DBEBEEBD19B94760@phx.gbl>
	<20160516111416.GA26132@agk-dp.fab.redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5739B5E2.2010704@redhat.com>
Date: Mon, 16 May 2016 13:58:26 +0200
MIME-Version: 1.0
In-Reply-To: <20160516111416.GA26132@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM Merge
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
To: Tom Jay <tom_jay@hotmail.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On 16.5.2016 13:14, Alasdair G Kergon wrote:
> On Sun, May 15, 2016 at 04:35:44AM +0000, Tom Jay wrote:
>> I've posted a question to the debian-user mailing list, but am yet to receive a response.
>> I am running Debian 7.9 64-bit with kernel version 3.2.0 and would like to use the 'lvconvert --merge' feature, but do not have 'snapshot-merge' support in the kernel. Does anyone have any idea how to enable this?
>> The original post is here: https://lists.debian.org/debian-user/2016/05/msg00496.html.
>
> So you don't have any snapshot support in your running kernel.
> But your kernel is modular, and if you attempt a snapshot operation,
> lvm2 will try to load the snapshot module if it is available.
>
> To try this manually, do 'modprobe dm-snapshot' (see 'man modprobe')
> then retry 'dmsetup targets'.


Please always attach version of lvm2  and kernel in use.

Debian version has some local patches for 'modprobe' usage - so maybe check
it 'auto' modprobe works properly in your case ?
(rmmod dm-snapshot  -  and check if lvcreate -s  still works)

Are you build your own kernel - or do you use  'distro' debian kernel ?


Regards

Zdenek
