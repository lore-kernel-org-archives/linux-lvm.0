Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n55Dk64J005936
	for <linux-lvm@redhat.com>; Fri, 5 Jun 2009 09:46:06 -0400
Subject: Re: [linux-lvm] Exposing the same VG from two different disks
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <24264124.2266451244207938283.JavaMail.servlet@kundenserver>
References: <24264124.2266451244207938283.JavaMail.servlet@kundenserver>
Date: Fri, 05 Jun 2009 14:50:21 +0100
Message-Id: <1244209821.18101.142.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
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

On Fri, 2009-06-05 at 15:18 +0200, liam@landv.org.uk wrote:
> Hi,
> 
> I'm not sure if what I'm trying to do is possible or not but hopefully
>  someone out there can help!!
> 
> I have a volume group which consists of a LUN (/dev/emcpowerv1) in an
>  EMC cabinet. To backup up the disk I use EMC technology to synchronise
>  a second LUN (/dev/emcpoweraf1) with the first, when the
>  synchronisation is complete I then break the connection. At this point
>  I have two identical volume groups exposed to the same host. What I
>  would like to do is rename the second volume group and mount its
>  logical volumes. However I can't because (understandably) LVM doesn't
>  like having two identical volume groups so when I issue pvchange -u I
>  get...
> 
> 
> # pvchange -u /dev/emcpoweraf1
>   Found duplicate PV dXiYI6nVqu8UpXO2mlaWiKKPKSBPrRbn: using /dev/emcpowerv1 not /dev/emcpoweraf1
>   get_pv_from_vg_by_id: vg_read failed to read VG !
>   /dev/emcpowerv1: write failed after 0 of 4096 at 4096: Operation not permitted
>   pv_write with new uuid failed for /dev/emcpowerv1.
>   0 physical volumes changed / 1 physical volume not changed
> 
> Notice I issue the command against /dev/emcpoweraf1 but it complains about writing to /dev/emcpowerv1.

Take a look at the vgimportclone script posted to the lvm-devel list
last month:

http://www.redhat.com/archives/lvm-devel/2009-May/msg00130.html

Regards,
Bryn.
