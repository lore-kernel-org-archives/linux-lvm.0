Message-ID: <5204BD23.8040203@redhat.com>
Date: Fri, 09 Aug 2013 11:57:55 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CALuwh1VtEnazECmysDmeOE9TfuE7p0pkFStU+LNuZsWWOjkqsQ@mail.gmail.com>
In-Reply-To: <CALuwh1VtEnazECmysDmeOE9TfuE7p0pkFStU+LNuZsWWOjkqsQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM extend and shrink at Run time supported file
	systems
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: selva <selvait90@gmail.com>

Dne 8.8.2013 23:35, selva napsal(a):
> Hi All,
>
> I extended the Linear LVM without Unmounting the Logical Volume. But Most of
> the docs suggest to unmount the LVM in shrink process.

I believe not MOST but EVERY docs suggest this ;)

> 1. Is it possible to shrink the LVM at Runtime (with out Unmount). If yes,
> What is correct way to do it.
>

You can shrink any lvm2 device online - as long as you don't care about data 
on this volume - but somehow I don't think it's matching your case...
In typical case you want to shrink filesystem first.
lvreduce support option '-r'  but for obvious reasons requires umount....


> Also I found in some places that only few file system supports Runtime Extend
> and Shrink of LVM.
>
> 2. What are file systems supports LVM extend and shrink without Unmount

Well - btrfs is known to be capable of online shrink - but in that case you 
don't need lvm2 ;)

None of the filesystems like 'extX', 'xfs', 'reiserfs' could be reduced online.

Zdenek
