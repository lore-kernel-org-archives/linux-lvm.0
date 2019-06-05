References: <3cc84c6a-62d0-96c2-cf6e-9181577f9802@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <662c133e-cebe-1882-a086-edb2219af7f0@redhat.com>
Date: Wed, 5 Jun 2019 12:20:50 +0200
MIME-Version: 1.0
In-Reply-To: <3cc84c6a-62d0-96c2-cf6e-9181577f9802@suse.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] confused with lvm2 filter rules
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Heming Zhao <heming.zhao@suse.com>

Dne 03. 06. 19 v 15:03 Heming Zhao napsal(a):
> Hello,
> 
> I met below filter action when executed 'vgextend'.
> why the filter take no effect on executing pvcreate or vgcreate?

> # rpm -qa | grep lvm2
> lvm2-clvm-2.02.180-8.16.x86_64
> lvm2-cmirrord-2.02.180-8.16.x86_64
> lvm2-2.02.180-8.16.x86_64
> 
> the filter rules:  (you can see all the disk in /dev/disk/by-id/ are
> rejected)
> # grep filter /etc/lvm/lvm.conf | grep -v "#"
>       filter = [ "r|/dev/.*/by-path/.*|", "r|/dev/.*/by-id/.*|",
> "r|/dev/fd.*|", "r|/dev/cdrom|", "a/.*/" ]


Hi

Filter with 'a|.*|' at the end will almost always never work.
As devices do have several names so if you reject it by one name,
you will likely accept it with another name.


So I'd highly recommend only these 2 variants that are 'easy to follow'.


1. White-list devices you want to see and add r|.*|  as the last rule.
^^^^^^^^^^^^^^^ most recommended.

2. Pure list of reject rules (do not add any 'a' rule).

Regards

Zdenek
