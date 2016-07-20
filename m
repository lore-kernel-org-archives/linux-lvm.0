Received: from [10.34.131.200] (dhcp131-200.brq.redhat.com [10.34.131.200])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6KDokSg011797
	for <linux-lvm@redhat.com>; Wed, 20 Jul 2016 09:50:47 -0400
References: <CAOXD2Kufsndmiian5NwV5Cmg+CAZeiKRyzDRQdazbkOzs0LL9Q@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <8a3946b8-3d25-4dc0-39d9-5fe9e4548d7a@redhat.com>
Date: Wed, 20 Jul 2016 15:50:46 +0200
MIME-Version: 1.0
In-Reply-To: <CAOXD2Kufsndmiian5NwV5Cmg+CAZeiKRyzDRQdazbkOzs0LL9Q@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots & data security
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

Dne 19.7.2016 v 17:28 Scott Sullivan napsal(a):
> Hello,
>
> Could someone please clarify if there is a legitimate reason to worry about
> data security of a old (removed) LVM snapshot?
>
> For example, when you lvremove a LVM snapshot, is it possible for data to be
> recovered if you create another LVM and it happens to go into the same area as
> the old snapshot we lvremoved?
>
> If this helps clarify, do we have to worry about security scrubbing a LVM
> snapshot for data security ?


lvm2 is 'volume manage'  - not a security tool to obfuscate data on your disk 
- this is 'admins' task.

So if you do care about 'data' content you give to your user in LV - it's
then 'admins' jobs to 'clear-up' all space before LV is given to user.

i.e.   'lvcreate  &&  dd if=/dev/zero....'

lvm2 does not care about 'data' content - it's metadata management tool.

Now if you are paranoid and you care purely about 'erasing' data from your 
snapshot - you can use  'lvconvert --splitsnapshot' and then erase again with 
'dd'  your COW volume you get from split.

Saying all this - you can try to use 'thin-provisioning' instead,
which has built-in option of zeroing  provisioned blocks - so whenever your 
provisioned LV gets a 'new block' - it's unwritten part are always zeroed - so 
there is no 'data-leak'.

And finally - if you are using modern filesystem like ext4 or XFS - they are 
tracking written area - so  'fs' user cannot actually read 'unwritten' data.

And 2nd. finally  - for paronid admin consider 'data' encryption....

Regards

Zdenek
