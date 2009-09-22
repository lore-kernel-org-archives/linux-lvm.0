Message-ID: <4AB8CFB6.5090000@gmail.com>
Date: Tue, 22 Sep 2009 15:23:02 +0200
From: John Taylor <pi00100100@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems at cross-compiling LVM2-2.02.52
References: <c9048c0a0909220516o23075a6h88111b4f42df3039@mail.gmail.com>
	<20090922124714.GM1210@agk-dp.fab.redhat.com>
	<4AB8CB49.2050409@gmail.com>
	<20090922131100.GN1210@agk-dp.fab.redhat.com>
In-Reply-To: <20090922131100.GN1210@agk-dp.fab.redhat.com>
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
> So can you describe the problem more precisely e.g. quoting the
> actual command lines/settings that aren't working and you think 
> ought to do?

I'm building packages for my own GNU/Linux system via some bash scripts. 
The one that builds lvm2 is this:

cd ${clfs_sources}
tar --extract --verbose --file=${tarball[lvm2]}
cd ${sources[lvm2]}
./configure --prefix=/usr --build=${clfs_host} --host=${clfs_target} 
--target=${clfs_target} --disable-nls ac_cv_func_malloc_0_nonnull=yes
make
make install DESTDIR=${clfs}
cd ${clfs_sources}
rm --recursive --force --verbose ${sources[lvm2]}

Here the value of the variables:

clfs_sources=/mnt/clfs/sources
tarball[lvm2]=LVM2-2.02.52.tar.xz
sources[lvm2]=LVM2-2.02.52
clfs_host=i486-unknown-linux-gnu
clfs_target=x86_64-unknown-linux-gnu
clfs=/mnt/clfs

I hope it is clear now.
