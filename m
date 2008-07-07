Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m67990cT026690
	for <linux-lvm@redhat.com>; Mon, 7 Jul 2008 05:09:00 -0400
Received: from n24.bullet.mail.mud.yahoo.com (n24.bullet.mail.mud.yahoo.com
	[68.142.206.163])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m6798i66003816
	for <linux-lvm@redhat.com>; Mon, 7 Jul 2008 05:08:44 -0400
From: "Theophanis Kontogiannis" <theophanis_kontogiannis@yahoo.gr>
References: <01cb01c8deb6$44921e60$cdb65b20$@gr> <4871C48E.3030004@redhat.com>
In-Reply-To: <4871C48E.3030004@redhat.com>
Date: Mon, 7 Jul 2008 12:05:23 +0300
Message-ID: <020d01c8e010$98e74110$cab5c330$@gr>
MIME-Version: 1.0
Content-Language: el
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] RE: [Linux-cluster] Issue with clvmd - Is it really
	bug??
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
Content-Type: text/plain; charset="utf-8"
To: 'linux clustering' <linux-cluster@redhat.com>
Cc: linux-lvm@redhat.com

Hello Christine and All,

This was exactly the problem. The sequence of services startup. In the past I had fixed this. However and because the problems started after the update I did to the system, it never occurred to me that the problem might be the sequence of services startup. In fact I never looked in the /etc/rc3.d to take a look at it.

So because I never thought about this possibility, and because the problems started after the system update were lvm2 / clvm was also updated, it stuck in my mind that the problem was due to the new version of the clvmd and lvm2.

Thank you all for your time,

Sincerely,

Theophanis Kontogiannis


-----Original Message-----
From: linux-cluster-bounces@redhat.com [mailto:linux-cluster-bounces@redhat.com] On Behalf Of Christine Caulfield
Sent: Monday, July 07, 2008 10:24 AM
To: linux clustering
Subject: Re: [Linux-cluster] Issue with clvmd - Is it really bug??

Theophanis Kontogiannis wrote:
> Hello,
> 
>  
> 
> I have a 2 node cluster at home with CentOS 5 running on 64bit AMDx2 
> with DRBD
> 
>  
> 
> 2.6.18-92.1.6.el5.centos.plus
> 
> drbd82-8.2.6-1.el5.centos
> 
> lvm2-2.02.32-4.el5
> 
> lvm2-cluster-2.02.32-4.el5
> 
> system-config-lvm-1.1.3-2.0.el5
> 
>  
> 
> I do not know if my problem is directly related to 
> http://kbase.redhat.com/faq/FAQ_51_10471.shtm and 
> https://bugzilla.redhat.com/show_bug.cgi?id=138396
> 
>  
> 
> I do:
> 
>  
> 
> pvcreate --metadatacopies 2 /dev/drbd0 /dev/drbd1
> 
> vgcreate -v vg0 -c y /dev/drbd0 /dev/drbd1
> 
> lvcreate -v -L 348G -n data0 vg0
> 
>  
> 
> Then I reboot.
> 
> The LV never becomes available.
> 
>  
> 
> If I try
> 
>  
> 
> vgchange -a y
> 
>  
> 
> I get
> 
>  
> 
>   Error locking on node tweety-1: Volume group for uuid not found: 
> 7Z9ra5zee3ZK7pNpfsblvtMOWXhgkZVEiJrzRQshaaiN5JKtJtkPDkQWfFXYKVVa
> 
>   0 logical volume(s) in volume group "vg0" now active
> 
>  
> 
> If I do
> 
>  
> 
> clvmd –R
> 
>  
> 
> Then with
> 
>  
> 
> vgchange –a y vg0.
> 
>  
> 
> the LV becomes available.
> 
>  
> 
> Is this really related to the above mentioned bug?
> 
>  
> 
> How can I make the LV become available during boot up without any 
> intervention?
> 
>  
> 
> Thank you all for your time,

As you're using drbd for the PV, I think it might be to do startup 
ordering. If drbd is started AFTER clvmd then it won't see the devices, 
and you'll get exactly the symptoms you describe.

if you can, move drbd to before clvmd, or clvmd after drbd. Or, failing 
that, put the extra commands you used above into their own startup script.
-- 

Chrissie

--
Linux-cluster mailing list
Linux-cluster@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cluster
