Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i28Iva818477
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 13:57:36 -0500
Received: from exch-calgary.int.pason.com (hemlock.pason.com [208.38.1.1])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i28IvaST007325
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 13:57:36 -0500
From: "Donald Murray P.Eng." <donald.murray@pason.com>
Subject: Re: [linux-lvm] Problems compiling device-mapper 1.00.08 on RedHat
 7.2 with linux-2.4.22
Message-Id: <20040308115730.694c8917.donald.murray@pason.com>
In-Reply-To: <20040308115938.O30713@homer.msp.redhat.com>
References: <20040308104349.6347c531.donald.murray@pason.com>
	<20040308115938.O30713@homer.msp.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Mar  8 13:55:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Thanks for your quick reply, Alasdair. That allowed me to build device-mapper.

Now I'm having problems building LVM2. It's breaking on BLKBSZGET:
device/dev-io.c: In function `_get_block_size':
device/dev-io.c:112: `BLKBSZGET' undeclared (first use in this function)
device/dev-io.c:112: (Each undeclared identifier is reported only once
device/dev-io.c:112: for each function it appears in.)
device/dev-io.c: In function `dev_get_size':
device/dev-io.c:219: `BLKGETSIZE64' undeclared (first use in this function)
make[1]: *** [device/dev-io.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/home/dmurray/kernel/LVM2.2.00.08/lib'
make: *** [lib] Error 2
dmurray@dmdev:/home/dmurray/kernel/LVM2.2.00.08> 

Any suggestions for this one?


On Mon, 8 Mar 2004 11:59:38 -0600
Alasdair G Kergon <agk@redhat.com> wrote:

> On Mon, Mar 08, 2004 at 10:43:49AM -0700, Donald Murray P.Eng. wrote:
> > Following the instructions in the device-mapper 1.00.08 INSTALL, I've
> > successfully completed the following steps:
> >     ./configure --with-kernel-dir=/home/dmurray/kernel/linux-2.4.22
> 
> The workaround is to run ./configure again *without* the kernel-dir option.
> Then make install the userspace tools/library.
> 
> You *don't* need to repatch/rebuild the kernel.
> 
> Alasdair
> -- 
> agk@redhat.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


 ------------------------------------------ 
 Donald Murray, P.Eng.
 Senior Software Engineer
 Pason Systems Corp.
 Direct: (403) 301-3473
