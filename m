Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3CFdtO11820
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 11:39:55 -0400
Received: from servidor.isea-ing.com (171.Red-217-127-207.pooles.rima-tde.net
	[217.127.207.171])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3CFdmdW007498
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 11:39:49 -0400
Received: from 73.red-83-45-99.pooles.rima-tde.net ([83.45.99.73]
	helo=servidor1.pk25.com)
	by servidor.isea-ing.com with asmtp (Exim 3.35 #1 (Debian))
	id 1DLNUF-0003NC-00
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 17:39:36 +0200
Received: from servidor1.pk25.com ([192.168.0.3] helo=pk25.com)
	by servidor1.pk25.com with esmtp (sendmail 9.99 #1 (Solaris))
	id 1DLNU0-0006pM-00
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 17:39:20 +0200
From: "Diaz Rodriguez, Eduardo" <ediaz@pk25.com>
Subject: Re: [linux-lvm] invalid physical volume
Date: Tue, 12 Apr 2005 17:39:19 +0200
Message-Id: <20050412153719.M45202@pk25.com>
In-Reply-To: <425BE8C5.4030502@cjs226.com>
References: <425B37D8.7060801@cjs226.com>
	<20050412082844.M43465@pk25.com>	<425BE068.6050106@cjs226.com>
	<20050412151937.M53113@pk25.com> <425BE8C5.4030502@cjs226.com>
MIME-Version: 1.0
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
Content-Transfer-Encoding: 8bit
To: LVM general discussion and development <linux-lvm@redhat.com>

try this:

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=124647

are you the last comment?.

regards!

On Tue, 12 Apr 2005 10:27:01 -0500, Clif Smith wrote
> I receive the same for all commands you requested, for example:
> # pvcreate /dev/emcpowera1
> pvcreate -- invalid physical volume "/dev/emcpowera1"
> 
> Diaz Rodriguez, Eduardo wrote:
> 
> >try pvcreate /dev/emcpowera1 is for the partition not for the disk...
> >
> >please summarize
> >
> >regards!
> >
> >On Tue, 12 Apr 2005 09:51:20 -0500, Clif Smith wrote
> >  
> >
> >>Responses in line.
> >>
> >>Thanks, Clif
> >>
> >>Diaz Rodriguez, Eduardo wrote:
> >>
> >>    
> >>
> >>>Clif try to make a partition type linux lvm.. (8e) and after try pvcreate
> >>>      
> >>>
> >over it
> >  
> >
> >>> 
> >>>
> >>>      
> >>>
> >># fdisk -l /dev/emcpowera
> >>Disk /dev/emcpowera: 10.7 GB, 10737418240 bytes
> >>255 heads, 63 sectors/track, 1305 cylinders
> >>Units = cylinders of 16065 * 512 = 8225280 bytes
> >>         Device Boot    Start       End    Blocks   Id  System
> >>/dev/emcpowera1             1      1305  10482381   8e  Linux LVM
> >>
> >># pvcreate /dev/emcpowera
> >>pvcreate -- invalid physical volume "/dev/emcpowera"
> >>
> >>    
> >>
> >>>send a output of pvcreate -v /dev/emcpowera
> >>> 
> >>>
> >>>      
> >>>
> >># pvcreate -v /dev/emcpowera
> >>pvcreate -- locking logical volume manager
> >>pvcreate -- checking physical volume name "/dev/emcpowera"
> >>pvcreate -- getting physical volume size
> >>pvcreate -- checking maximum physical volume size
> >>pvcreate -- checking partition type
> >>pvcreate -- invalid physical volume "/dev/emcpowera"
> >>
> >>    
> >>
> >>>if you complile with debug use pvcreate -dv /dev/emcpowera
> >>>
> >>> 
> >>>
> >>>      
> >>>
> >># pvcreate -dv /dev/emcpowera
> >><1> lvm_get_iop_version -- CALLED
> >><22> lvm_check_special -- CALLED
> >><22> lvm_check_special -- LEAVING
> >><1> lvm_get_iop_version -- AFTER ioctl ret: 0
> >><1> lvm_get_iop_version -- LEAVING with ret: 10
> >>pvcreate -- locking logical volume manager
> >><1> lvm_lock -- CALLED
> >><22> lvm_check_special -- CALLED
> >><22> lvm_check_special -- LEAVING
> >><1> lvm_lock -- LEAVING with ret: 0
> >>pvcreate -- checking physical volume name "/dev/emcpowera"
> >><1> pv_check_name -- CALLED with "/dev/emcpowera"
> >><22> lvm_check_chars -- CALLED with name: "/dev/emcpowera"
> >><22> lvm_check_chars -- LEAVING with ret: 0
> >><1> pv_check_name -- LEAVING with ret: 0
> >>pvcreate -- getting physical volume size
> >><1> _pv_get_dev_size -- CALLED with /dev/emcpowera and 0xbfffa650
> >><1> _pv_get_dev_size -- LEAVING with ret: 20971520
> >>pvcreate -- checking maximum physical volume size
> >><1> pv_create_kdev_t -- CALLED with "/dev/emcpowera"
> >><22> pv_check_name -- CALLED with "/dev/emcpowera"
> >><333> lvm_check_chars -- CALLED with name: "/dev/emcpowera"
> >><333> lvm_check_chars -- LEAVING with ret: 0
> >><22> pv_check_name -- LEAVING with ret: 0
> >><1> pv_create_kdev_t -- LEAVING with ret: E800
> >><1> lvm_check_partitioned_dev -- CALLED
> >><22> lvm_get_device_type called
> >><22> lvm_get_device_type leaving with -1
> >><1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
> >>pvcreate -- checking partition type
> >><1> pv_read -- CALLED with /dev/emcpowera
> >><22> pv_check_name -- CALLED with "/dev/emcpowera"
> >><333> lvm_check_chars -- CALLED with name: "/dev/emcpowera"
> >><333> lvm_check_chars -- LEAVING with ret: 0
> >><22> pv_check_name -- LEAVING with ret: 0
> >><1> pv_read -- going to read /dev/emcpowera
> >><22> lvm_check_dev -- CALLED
> >><333> lvm_check_partitioned_dev -- CALLED
> >><4444> lvm_get_device_type called
> >><4444> lvm_get_device_type leaving with -1
> >><333> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
> >><22> lvm_check_dev -- LEAVING with ret: 0
> >><1> pv_read -- LEAVING with ret: -270
> >>pvcreate -- invalid physical volume "/dev/emcpowera"
> >>
> >><1> lvm_unlock -- CALLED
> >><1> lvm_unlock -- LEAVING with ret: 0
> >>
> >>    
> >>
> >>>send the error leve returns echo $?
> >>>
> >>>regards!
> >>>
> >>>
> >>>
> >>>On Mon, 11 Apr 2005 21:52:08 -0500, Clif Smith wrote
> >>> 
> >>>
> >>>      
> >>>
> >>>>I'm running lvm-1.0.8-9 on RHES3 and am receiving the following when 
> >>>>I try to utilize a volume from an EMC array:
> >>>># pvcreate /dev/emcpowera
> >>>>pvcreate -- invalid physical volume "/dev/emcpowera"
> >>>>
> >>>>The OS sees the volume fine:
> >>>># fdisk -l /dev/emcpowera
> >>>>Disk /dev/emcpowera: 10.7 GB, 10737418240 bytes
> >>>>255 heads, 63 sectors/track, 1305 cylinders
> >>>>Units = cylinders of 16065 * 512 = 8225280 bytes
> >>>>
> >>>>I can create a partition and then a filesystem without issue, but I 
> >>>>really need to use it within LVM.
> >>>>
> >>>>Any ideas?
> >>>>
> >>>>_______________________________________________
> >>>>linux-lvm mailing list
> >>>>linux-lvm@redhat.com
> >>>>https://www.redhat.com/mailman/listinfo/linux-lvm
> >>>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >>>>   
> >>>>
> >>>>        
> >>>>
> >>>      
> >>>
>
>>=======================================================================================
> >>    
> >>
> >>>La teta que la mano no cubre, no es teta sino ubre.
> >>>		-- An�nim. 
> >>>      
> >>>
>
>>=======================================================================================
> >>    
> >>
> >>>_______________________________________________
> >>>linux-lvm mailing list
> >>>linux-lvm@redhat.com
> >>>https://www.redhat.com/mailman/listinfo/linux-lvm
> >>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >>> 
> >>>
> >>>      
> >>>
> >>_______________________________________________
> >>linux-lvm mailing list
> >>linux-lvm@redhat.com
> >>https://www.redhat.com/mailman/listinfo/linux-lvm
> >>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >>    
> >>
> >
> >
>
>=======================================================================================
> >La teta que la mano no cubre, no es teta sino ubre.
> >		-- An�nim. 
>
>=======================================================================================
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@redhat.com
> >https://www.redhat.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >  
> >
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


=======================================================================================
La teta que la mano no cubre, no es teta sino ubre.
		-- An�nim. 
=======================================================================================
