References: <CAJFSNy5QMgETceG4OvETSPWz_ZWHays36K=L5gYhKm5_qxKuPA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5641D529.4030604@redhat.com>
Date: Tue, 10 Nov 2015 12:29:45 +0100
MIME-Version: 1.0
In-Reply-To: <CAJFSNy5QMgETceG4OvETSPWz_ZWHays36K=L5gYhKm5_qxKuPA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM thin volume cannot be deleted.
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
Cc: SiteGround Operations <operations@siteground.com>

Dne 9.11.2015 v 13:28 Nikolay Borisov napsal(a):
> Hello,
>
> I've emailed before with the same issue :
> https://www.redhat.com/archives/dm-devel/2015-October/msg00171.html
>
> Basically an lvm thin volume cannot be deleted/deactivated since it is
> falsely being detected as active:
>
> [root@eusharedlxc4 ~]# lvremove coregroup/c13417
> Logical volume coregroup/c13417 contains a filesystem in use.


Please create regular Bugzilla - it's match better to resolve bugs via this 
process instead of mailing list.

Your post is missing lots of data - e.g. kernel log,
info about what has preceded,  kernel version, lvm2 version,
distro and many others.

We don't have crystal balls to guess all the needed info.

So please open BZ - add the info you have - we will ask for more.

Regards

Zdenek
