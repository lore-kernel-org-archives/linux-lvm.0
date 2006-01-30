Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0ULjS123690
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 16:45:28 -0500
Received: from aragorn.bbn.com (aragorn.bbn.com [128.33.0.62])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0ULjOqC009007
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 16:45:25 -0500
Received: from [128.89.72.74] (mgillen2.dsl.bbn.com [128.89.72.74])
	by aragorn.bbn.com (8.12.7/8.12.7) with ESMTP id k0ULjJIB025507
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 16:45:19 -0500 (EST)
Message-ID: <43DE88EF.2090904@mattgillen.net>
Date: Mon, 30 Jan 2006 16:45:19 -0500
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Confusion
References: <6a83e6620601301326l4c4db027oa748dcff72e368c6@mail.gmail.com>
In-Reply-To: <6a83e6620601301326l4c4db027oa748dcff72e368c6@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

tufkal wrote:
> tufkal@tux :/home$ sudo lvm vgscan
>   Reading all physical volumes.  This may take a while...
>   Found volume group "lvmhome" using metadata type lvm2
> tufkal@tux:/home$
> 
> According to those, everything looks great!  I should have 325GB of space!
> 
> tufkal@tux:~$ df -h
> Filesystem                              Size  Used Avail Use% Mounted on
> /dev/hdb1                                4.4G  3.0G  1.2G  72% /
> tmpfs                                     253M     0  253M   0% /dev/shm
> tmpfs                                     253M   13M  240M   5%
> /lib/modules/2.6.12-10-386/volatile
> /dev/mapper/lvmhome-home     218G  197G   22G  91% /home
> /dev/md0                                 39G   29G  7.7G  80% /home/tufkal
> 
> BWAH?  Why do I only have 220GB of space?  
Did you grow your filesystem?
http://www.tldp.org/HOWTO/LVM-HOWTO/extendlv.html

--Matt
