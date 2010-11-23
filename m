Received: from [10.11.10.250] (vpn-10-250.rdu.redhat.com [10.11.10.250])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id oAN42BKF031951
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2010 23:02:11 -0500
From: Dave Wysochanski <dwysocha@redhat.com>
In-Reply-To: <201011212101.14895.benscott@nwlink.com>
References: <201011212101.14895.benscott@nwlink.com>
Date: Mon, 22 Nov 2010 23:03:15 -0500
Message-ID: <1290484995.31336.1.camel@f12-work>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Bug in error code for  lvm_vg_open()
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 2010-11-21 at 21:01 -0800, ben wrote:
> If a volume group is clustered and the cluster is not running, lvm_vg_open() 
> fails and prints a message about skipping the group. However, lvm_errno() and 
> lvm_errmsg() are not updated. It would be really useful (to me) if the error 
> number was set to something specific to the clustering issue rather than a 
> generic error. 
> 

Thanks for reporting.  I see the code in question and will work on
updating the error codes and messages.

> Also, where are the errors defined or are only the standard system ones being 
> used?
> 

We are using errno codes and trying not to define LVM-specific codes.
The idea was to divide up lvm operations into small enough pieces and
re-use errno codes.


> Thank you and keep up the good work.
> 
> 

thank you for the feedback.
