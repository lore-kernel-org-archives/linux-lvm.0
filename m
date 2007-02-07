Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l17FsAVL027793
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 10:54:10 -0500
Received: from smtp01-wwo.pocketinet.com (smtp01-wwo.pocketinet.com
	[206.126.23.37])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l17Fs65x015786
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 10:54:07 -0500
Message-ID: <45C9F5FC.8060200@cuttedge.com>
Date: Wed, 07 Feb 2007 07:53:32 -0800
From: Scott Smyth <scotts@cuttedge.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Doubts about LVM2 real limits
References: <200702071509.l17F9TiU012582@mx2.redhat.com>
In-Reply-To: <200702071509.l17F9TiU012582@mx2.redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

We have done >100 TB without a problem in a VG and in
a single LV.  The problem is with file system selection if you
are using this large a LV as a file system.  You are limited to
XFS or JFS w/o venturing into ext4 and reiserfs4 which
some people view as experimental still.

We can only speak for XFS on a 100 TB file system.  We have
yet to try ext4 or reiserfs4 as a commercial file system.

3 Xyratex FC RAID controllers w/ expansion chassis attached.
4 Gb/s QLogic controllers.

linux-2.6.17.14
device-mapper-1.02.13
LVM2-2.02.16

Sincerely,
Scott

Cesar O. Pablo wrote:
> Hi,
>
>
>  We have plans to build a 30TB aprox. data storage using a set of SAN boxes configured as 
> RAID 5, our understanding is that using LVM2 with Red Hat 4 and our 64 bit AMD opteron 
> processors shall allow us to do that. Our concern is to know in advance if our approach is 
> wrong or even better if somebody else has been successfully taking the same road before.
>
>  Documentation tells us that the limit is in the order of the 8 Exabytes (8TB for IA-32) 
> but this is not enough as this is a go / no go decision.
>
>   Thanks for any help or pointer to a similar rig.
>
>  Cesar O. Pablo
>  
>
>
>
>
> Cesar
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>   
