Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3EEkSj31049
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2004 10:46:28 -0400
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i3EEkR87017134
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2004 10:46:28 -0400
Subject: Re: [linux-lvm] lvmcreate_initrd missing in lvm2?
From: Jeff Layton <jtlayton@poochiereds.net>
In-Reply-To: <407C0C40.2040905@irisinfo.net>
References: <407C0C40.2040905@irisinfo.net>
Message-Id: <1081954010.2323.32.camel@localhost>
Mime-Version: 1.0
Date: Wed, 14 Apr 2004 10:46:50 -0400
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: martin@irisinfo.net, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2004-04-13 at 17:50 +0200, Martin Leslie wrote:

> Hi all.
> 
> I have just downloaded the lvm2 debian package and I cant find the 
> lvmcreate_initrd command.
> 
> Has it been replaced with another command or does it live in aonther 
> package?
> 
> Regards
> 
> Martin
> 

It's still under development, but there is current script that works at:

http://poochiereds.net/svn/lvm2create_initrd

> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Jeff Layton <jtlayton@poochiereds.net>
