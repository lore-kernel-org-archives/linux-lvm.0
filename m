References: <97CEEE909D5FE84999281EA4585EB0ED0165DE36@DGGEMA505-MBS.china.huawei.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <62d9bc5f-01c7-6109-eff5-8d5cc0ddfed0@redhat.com>
Date: Thu, 26 Oct 2017 10:39:19 +0200
MIME-Version: 1.0
In-Reply-To: <97CEEE909D5FE84999281EA4585EB0ED0165DE36@DGGEMA505-MBS.china.huawei.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [dm-devel] dmsetup hangs forever
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "Zhangyanfei (YF)" <yanfei.zhang@huawei.com>, "agk@redhat.com" <agk@redhat.com>, "christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>, Fengtiantian <fengtiantian@huawei.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>, guijianfeng <guijianfeng@huawei.com>

Dne 26.10.2017 v 10:07 Zhangyanfei (YF) napsal(a):
> Hello
> 
> I find an issue when use �dmsetup in the situation udev event timeout.
> 
> Dmsetup use the dm_udev_wait function sync with udev event.When use the 
> dmsetup generate a new dm-disk, if the raw disk is abnormal(for example ,a 
> ipsan disk hung IO request), the udevd daemon handle the dm-disk udev event 
> maybe timeout, and will not notify the dmsetup �by semaphore. And because the 
>  �dm_udev_wait use the semop to sync with udevd, if udevd event timeout, the 
> dmsetup will hung forever even when the raw disk be recovery.
> 
> I wonder if we could use the semtimedop instead semop to add the timeout in 
> function �dm_udev_wait. If the udevd daemon timeout when handle the dm event, 
> the dm_udev_wait could timeout too, and the dmsetup could return error.
> 
> This is my patch base lvm2-2.02.115-3:


Hi


Unfortunately the same argument why this can't really work still applies.

If the  dm will start to timeout on it's own - without coordination with udev,
your system's logic will end-up with one big mess.

So if the dm would handle timeout - you would also need to provide mechanism 
to correct associated services around it.

The main case here is - it's mandatory it's udev finalizing any timeouts so 
it's in sync with db content.

Moreover if you start to timeout - you typically mask some system failure. In 
majority of cases I've ever seen - it's been always a bug from this category 
(buggy udev rule, or service). So it's always better to fix the bug then keep 
it masked.

AFAIK I'd like to see the semaphore to go away - but it needs wider cooperation.


Regards

Zdenek
