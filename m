Message-ID: <002001c31d4d$eebf5630$6c7745cb@codevel>
From: "armani" <armani@codevel.com>
References: <001501c31d2a$0ea25f20$6c7745cb@codevel> <3EC788E9.9020701@adelphia.net>
Subject: Re: [linux-lvm] Newbie to snapshot
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sun May 18 09:58:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thanks for toby's explainations!
==
Eventually I create a new snapshot of my LV partition.
But I have another problem with the snapshot of LV.
That is how much snapshot I could create for my LV partition ?
As I know some commercial software could create 254 snapshots for one LV
such as IBM.

So I try to create another snapshot for LV by issuing the following command:

This is my first snapshot for /dev/Vol1/LV1

[root@met root]# lvcreate --size 100M -s -nsnapshot /dev/Vol1/LV1
lvcreate -- WARNING: the snapshot will be automatically disabled once it
gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for
"/dev/Vol1/snapshot"
lvcreate -- doing automatic backup of "Vol1"
lvcreate -- logical volume "/dev/Vol1/snapshot" successfully created

I tried to create another snapshot for /dev/Vol1/LV1

[root@met root]# lvcreate --size 100M -s -nsnapshot1 /dev/Vol1/LV1
lvcreate -- WARNING: the snapshot will be automatically disabled once it
gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for
"/dev/Vol1/snapshot1"
lvcreate -- doing automatic backup of "Vol1"
lvcreate -- logical volume "/dev/Vol1/snapshot1" successfully created

And how can I estimate the sizes and counts for them ?
Is there any rules or principles to formalize the procedures ?


> A snapshot will only capture what you have in the fs at the moment you
-- snip --
> -toby

-- Armani Liao
