Message-ID: <4AB8CB49.2050409@gmail.com>
Date: Tue, 22 Sep 2009 15:04:09 +0200
From: John Taylor <pi00100100@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems at cross-compiling LVM2-2.02.52
References: <c9048c0a0909220516o23075a6h88111b4f42df3039@mail.gmail.com>
	<20090922124714.GM1210@agk-dp.fab.redhat.com>
In-Reply-To: <20090922124714.GM1210@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-lvm@redhat.com

Alasdair G Kergon wrote:
> 'make' is designed only to be run from the top directory of the tree,
> not subdirectories.

I'm not running 'make' from a subdirectory of the sources directory, but 
from a directory at its same level. That is, the sources directory is 
/mnt/clfs/sources/LVM2-2.02.52, while the desired build directory is 
/mnt/clfs/sources/lvm2-build. That's the way I usually build packages.
