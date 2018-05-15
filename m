References: <1973783.dFIIZJkBNM@monk> <2496144.kxeQXG1iRO@monk>
	<2230803.usHgyXdh9J@monk>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <deebd997-6278-e2a3-7b9f-3c3c58a56a51@redhat.com>
Date: Tue, 15 May 2018 13:15:55 +0200
MIME-Version: 1.0
In-Reply-To: <2230803.usHgyXdh9J@monk>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Check of pool ernie/cache failed (status:1). Manual
 repair required!
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Dennis Schridde <devurandom@gmx.net>

Dne 15.5.2018 v 10:11 Dennis Schridde napsal(a):
> Hello!
> 
> In case the question comes up: Fedora 28 (the live system I am trying to use
> for recovery) is using Linux 4.16.3-301.fc28 and `lvm version`:
> LVM version 2.02.177(2)
> Library version 1.02.146
> Driver version 4.37.0
> 
> The system I was originally using to break the cache was using Linux 4.16.7-
> gentoo, and `LD_LIBRARY_PATH=$PWD/lib64 ./bin/lvm version` from its initrd
> reports (running on the Fedora 28 live system):
> LVM version: 2.02.173(2)
> Library version: 1.02.142
> Driver version: 4.37.0
> 
> Could someone please give me a hint what is actually broken here?  Is it just
> the metadata?  If so, how can that break -- shouldn't that metadata never be
> modified after creating the LV?  And could it not be recovered from /etc/lvm/
> archive?  What does "manual repair" mean in detail?  Is there some way to
> recover the cache?  Or is it at least possible to uncache the LV forcibly, to
> hopefully recover the data on the origin LV?  What is your recommendation to
> minimise data loss?


Hi


To get direct access to metadata - you could use your latest lvm2 2.02.177 
build (or even 'git master'). In these recent versions there is added support 
to activate directly these 'subLVs'.  So with latest lvm2 you can:

lvchange -ay  vg/lv_cmeta

and then you can capture content of this LV via 'dd' into file
and compress and attach 'xz' compressed to BZ.

(dd if=/dev/vg/lv_cmeta of=/tmp/file)

----

With older lvm2 you would need to 'swap-in'  temporary LV as metadata, which 
has been also documented several in the list and man pages for thin-pool.
But since you already have 2.02.177 - you should be able to activate _cmeta LV 
directly.

Regards


Zdenek
