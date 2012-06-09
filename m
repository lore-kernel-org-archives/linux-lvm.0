Message-ID: <4FD30CF2.8060505@redhat.com>
Date: Sat, 09 Jun 2012 10:44:34 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <20120609002308.GD15806@agk-dp.fab.redhat.com>
In-Reply-To: <20120609002308.GD15806@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM release 2.02.96 / git / veritysetup
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com, lvm-devel@redhat.com, dm-devel@redhat.com

On 06/09/2012 02:23 AM, Alasdair G Kergon wrote:
> veritysetup
> -----------
> Although this release contains a userspace tool for dm-verity,
>   configure --with-verity-setup=<cryptlib>
> we think the cryptsetup package would provide a better home for this
> so watch out for an updated version in an upcoming cryptsetup release.

Please do not use this version except for experiments and do not package
it in distributions yet.

Superblock format will perhaps change a little bit and also veritysetup utility
from cryptsetup source will use different command syntax (similar to dmsetup
and cryptsetup) and get full library support through libcryptsetup.

The code is maintained in separate veritysetup branch in cryptsetup git
for now, once it get back all features it will be merged to main branch (next week).
http://code.google.com/p/cryptsetup/source/browse/?name=veritysetup

Milan
