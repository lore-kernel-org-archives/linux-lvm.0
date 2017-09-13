References: <C28D2468-1843-4019-A503-E566A305977D@mac.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <d23b94a7-b5c5-4ee2-51c7-7dfa06cca3d2@redhat.com>
Date: Wed, 13 Sep 2017 22:19:21 +0200
MIME-Version: 1.0
In-Reply-To: <C28D2468-1843-4019-A503-E566A305977D@mac.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Performance penalty for 4k requests on thin
	provisioned volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Dale Stephenson <dalestephenson@mac.com>

Dne 13.9.2017 v 17:33 Dale Stephenson napsal(a):
> Distribution: centos-release-7-3.1611.el7.centos.x86_64
> Kernel: Linux 3.10.0-514.26.2.el7.x86_64
> LVM: 2.02.166(2)-RHEL7 (2016-11-16)
> 
> Volume group consisted of an 8-drive SSD (500G drives) array, plus an additional SSD of the same size.  The array had 64 k stripes.
> Thin pool had -Zn option and 512k chunksize (full stripe), size 3T with metadata volume 16G.  data was entirely on the 8-drive raid, metadata was entirely on the 9th drive.
> Virtual volume “thin” was 300 GB.  I also filled it with dd so that it would be fully provisioned before the test.
> Volume “thick” was also 300GB, just an ordinary volume also entirely on the 8-drive array.
> 
> Four tests were run directlyagainst each volume using fio-2.2.8, random read, random write, sequential read, sequential write.  Single thread, 4k blocksize, 90s run time.

Hi

Can you please provide output of:

lvs -a -o+stripes,stripesize,seg_pe_ranges

so we can see how is your stripe placed on devices ?

SSD typically do needs ideally write 512K chunks.
(something like  'lvcreate -LXXX -i8 -I512k vgname' )

Wouldn't be 'faster' to just concatenate 8 disks together instead of striping 
- or stripe only across 2 disk - and then you concatenate 4 such striped areas...

64k stripes do not seem to look like ideal match in this case of 3 disk with 
512K blocks

Regards

Zdenek
