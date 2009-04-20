Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3K6EJ50022301
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 02:14:19 -0400
Received: from n6-vm1.bullet.mail.in.yahoo.com
	(n6-vm1.bullet.mail.in.yahoo.com [202.86.4.133])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id n3K6E1TT029358
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 02:14:02 -0400
Message-ID: <820122.10254.qm@web94816.mail.in2.yahoo.com>
Date: Mon, 20 Apr 2009 11:37:20 +0530 (IST)
From: yogeen honnavar <yogeen@yahoo.com>
Subject: Re: [linux-lvm] Simulating LVM Mirror Failure and recovery
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


hi all,

Thanks for all the replies. as pointed out by Eric brunson i was referring to the following document

http://www.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/5/html/Cluster_Logical_Volume_Manager/mirrorrecover.html 

i used the below command to simulate failed sda and then wrote some data to the mounted file system to trigger LVM conversion to linear mode.

# echo offline > /sys/block/sda/device/state 

thanks to all.
regards
-yogeen

--- On Thu, 16/4/09, Takahiro Yasui <tyasui@redhat.com> wrote:

> From: Takahiro Yasui <tyasui@redhat.com>
> Subject: Re: [linux-lvm] Simulating LVM Mirror Failure and recovery
> To: "LVM general discussion and development" <linux-lvm@redhat.com>
> Date: Thursday, 16 April, 2009, 9:32 PM
> malahal@us.ibm.com
> wrote:
> > I usually run "echo 1 >
> /sys/block/sda/device/delete" to make /dev/sda
> > disappear and fail for LVM tests. You can fail the
> disk in a lot of ways
> > depending on your hardware, but this trick works with
> almost every
> > device!
> 
> # echo offline > /sys/block/sda/device/state
> 
> might work as well. In this case, you can recover the
> failure by
> 
> # echo running > /sys/block/sda/device/state
> 
> Thanks,
> Taka
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


      Add more friends to your messenger and enjoy! Go to http://messenger.yahoo.com/invite/
