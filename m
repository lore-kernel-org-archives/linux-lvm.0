Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i28Hxd800647
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 12:59:39 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i28HxcT28794
	for linux-lvm@redhat.com; Mon, 8 Mar 2004 11:59:38 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Problems compiling device-mapper 1.00.08 on RedHat 7.2 with linux-2.4.22
Message-ID: <20040308115938.O30713@homer.msp.redhat.com>
References: <20040308104349.6347c531.donald.murray@pason.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040308104349.6347c531.donald.murray@pason.com>; from donald.murray@pason.com on Mon, Mar 08, 2004 at 10:43:49AM -0700
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
Date: Mon Mar  8 12:57:20 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Mar 08, 2004 at 10:43:49AM -0700, Donald Murray P.Eng. wrote:
> Following the instructions in the device-mapper 1.00.08 INSTALL, I've
> successfully completed the following steps:
>     ./configure --with-kernel-dir=/home/dmurray/kernel/linux-2.4.22

The workaround is to run ./configure again *without* the kernel-dir option.
Then make install the userspace tools/library.

You *don't* need to repatch/rebuild the kernel.

Alasdair
-- 
agk@redhat.com
