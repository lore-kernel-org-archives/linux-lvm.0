Subject: Re: [linux-lvm] Root on LV
Message-ID: <OFB98B66D9.BF1F5CB9-ON85256ACC.0066E63E@raleigh.ibm.com>
From: "Steve Pratt" <slpratt@us.ibm.com>
Date: Wed, 19 Sep 2001 13:54:23 -0500
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>.Q:  Why bother to put 64MB on an LVM?

>The root volume doesn't grow much (make it 128MB and it'll never need to
>grow).

Sure, you could always do this.

>If you ever have a problem with LVM you'll end up with an unbootable
>system...

Right, which is why volume managers need to be really stable and robust.
Bottom line is that if this is the confidence level you have in your volume
manager (whether it is LVM or EVMS), I would question putting any data on
it.

Steve

EVMS Development - http://www.sf.net/projects/evms
Linux Technology Center - IBM Corporation
(512) 838-9763  EMAIL: SLPratt@US.IBM.COM
