From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] LVM  &  S/390 Question
Message-ID: <204850000.1038519434@[192.168.100.3]>
In-Reply-To: <OF2D2C72C3.FF752A0C-ON85256C7E.006C3E7E@wk.dcx.com>
References: <OF2D2C72C3.FF752A0C-ON85256C7E.006C3E7E@wk.dcx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Nov 28 15:42:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com, lg34@dcx.com


-- lg34@daimlerchrysler.com

> We are in the process of installing LVM 1.0.6  on Linux S/390.
>
> We installed the patches and are in the process of rebuilding the Kernel.
> We were on our last step (make modules_install) and we came across the
> following error condition.
>
> Please see below. Any assistance would be greatly appreciate.
> Respond to lg34@dcx.com.
> _____________________________________
>
> cp ctc.o netiucv.o lcs.o
> /lib/modules/2.4.9-38custom/kernel/drivers/s390/net/
               ~~~~~
The current release is 2.4.19; the version you are running
is badly out of date. Any reason you have stuck with the
older kernel version (e.g., custom modules)?

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
