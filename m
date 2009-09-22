Message-ID: <4AB8C5A9.3080104@gmail.com>
Date: Tue, 22 Sep 2009 14:40:09 +0200
From: John Taylor <pi00100100@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems at cross-compiling LVM2-2.02.52
References: <c9048c0a0909220516o23075a6h88111b4f42df3039@mail.gmail.com>
	<20090922123303.GL1210@agk-dp.fab.redhat.com>
In-Reply-To: <20090922123303.GL1210@agk-dp.fab.redhat.com>
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
> On Tue, Sep 22, 2009 at 02:16:16PM +0200, John Taylor wrote:
>> Installing example.conf as /mnt/clfs/etc/lvm/lvm.conf
>> /usr/bin/install: cannot change ownership of
>> `/mnt/clfs/etc/lvm/lvm.conf': Operation not permitted
>> make[1]: *** [install_lvm2] Error 1
>> make[1]: Leaving directory `/mnt/clfs/sources/LVM2-2.02.52/doc'
>> make: *** [doc.install] Error 2
>  
> configure --with-user= --with-group=   ?

Didn't notice these options, they work. Thanks!
