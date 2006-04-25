Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3PMDfjN003149
	for <linux-lvm@redhat.com>; Tue, 25 Apr 2006 18:13:41 -0400
Received: from mail.cnr.colostate.edu (clavin1.cnr.colostate.edu
	[129.82.112.67])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3PMDeen028812
	for <linux-lvm@redhat.com>; Tue, 25 Apr 2006 18:13:40 -0400
Received: from newman.nrel.colostate.edu (newman [129.82.112.30])
	by mail.cnr.colostate.edu (8.12.11/8.12.11) with ESMTP id
	k3PMDYn1021615
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 25 Apr 2006 16:13:34 -0600 (MDT)
Received: from [129.82.104.126] (donbot [129.82.104.126])
	by newman.nrel.colostate.edu (8.12.11/8.12.11) with ESMTP id
	k3PMDYhv021605
	for <linux-lvm@redhat.com>; Tue, 25 Apr 2006 16:13:34 -0600 (MDT)
Message-ID: <444E9F0E.1010303@nrel.colostate.edu>
Date: Tue, 25 Apr 2006 16:13:34 -0600
From: "Ty! Boyack" <ty@nrel.colostate.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 *TEMPORARY* PV failure - what happens?
References: <444E73C3.7040305@nrel.colostate.edu>	<1145995049.26842.103.camel@localhost.localdomain>	<f9361e496ca792ff924de60979c1bbb9@redhat.com>
	<1145997578.26842.119.camel@localhost.localdomain>
In-Reply-To: <1145997578.26842.119.camel@localhost.localdomain>
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

The first scenario you give is most likey the one to occur.  I'm 
thinking the server is active, has active volumes which use the iSCSI 
array as PVs, and may or may not have applications accessing it at the 
time of the failure.  I'm glad to hear that the other volumes should be 
accessable (assuming we don't stripe across the devices).  It also makes 
sense that the user will get a r/w error or i/o error. 

I'm still wondering if the disk comes back if the LV will be available 
again, or if LVM will mark it as failed, and assume that all blocks on 
it are invalid now and forevermore.  Or is this a function of the 
filesystem?  I'll be building a test case and will certainly have fun 
breaking it like this.  I'm glad to know of the ability to test it as 
Jonathan pointed out that will be a simpler test bed.

Good info - thanks folks!

-Ty!

Ming Zhang wrote:

>assume 2 scenarios
>
>1) this PV is under use when it is disconnected temporarily. then
>eventually will return r/w errors to applications. but other LVs are
>still accessible.
>
>2) system is off and boot up again. for this system will complain PV
>with UUID ... is not found. so the only way is to partially activate VG.
>
>am i correct here?
>
>ming
>
>
>
>On Tue, 2006-04-25 at 15:21 -0500, Jonathan E Brassow wrote:
>  
>
>>It is simple to play with this type of scenario by doing:
>>
>>echo offline > /sys/block/<sd dev>/device/state
>>
>>and later
>>
>>echo running > /sys/block/<sd dev>/device/state
>>
>>I know this doesn't answer your question directly.
>>
>>  brassow
>>
>>
>>On Apr 25, 2006, at 2:57 PM, Ming Zhang wrote:
>>
>>    
>>
>>>my 2c. fix me if i am wrong
>>>
>>>either activate the VG partially, and then all LVs on other PVs are
>>>still accessible. I remember these LVs will only have RO access. Though
>>>I have no idea why.
>>>
>>>use dm-zero to generate a fake PVs and add to VG, then allow VG to
>>>activate and access those LV. But i do not know if you access a LV that
>>>is partially or fully on this PV, what will happen.
>>>
>>>Ming
>>>
>>>
>>>On Tue, 2006-04-25 at 13:08 -0600, Ty! Boyack wrote:
>>>      
>>>
>>>>I've been intrigued by the discussion of what happens when a PV fails,
>>>>and have begun to wonder what would happen in the case of a transient
>>>>failure of a PV.
>>>>
>>>>The design I'm thinking of is a SAN environment with several
>>>>multi-terabyte iSCSI arrays as PVs, being grouped together into a 
>>>>single
>>>>VG, and then carving LVs out of that.  We plan on using the CLVM tools
>>>>to fit into a clustered environment.
>>>>
>>>>The arrays themselves are robust (RAID 5/6, redundant power supplies,
>>>>etc.) and I grant that if we lose the actual array (for example, if
>>>>multiple disks fail), then we are in the situation of a true and
>>>>possibly total failure of the PV and loss of it's data blocks.
>>>>
>>>>But there is always the possiblity that we could lose the CPU, memory,
>>>>bus, etc. in the iSCSI controller portion of the array, which will 
>>>>cause
>>>>downtime, but no true loss of data.  Or someone may hit the wrong 
>>>>power
>>>>switch and just reboot the thing, taking it offline for a short time.
>>>>Yes, that someone would probably be me.  Shame on me.
>>>>
>>>>The key point is that the iSCSI disk will come back in a few
>>>>minutes/hours/days depending on the failure type, and all blocks will 
>>>>be
>>>>intact when it comes back up.  I suppose the analagous situation would
>>>>be using LVM on a group of hot swap drives and pulling one of the 
>>>>disks,
>>>>waiting a while, and then re-inserting it.
>>>>
>>>>Can someone please walk me through the resulting steps that would 
>>>>happen
>>>>within LVM2 (or a GFS filesystem on top of that LV) in this situation?
>>>>
>>>>Thanks,
>>>>
>>>>-Ty!
>>>>
>>>>        
>>>>
>>>_______________________________________________
>>>linux-lvm mailing list
>>>linux-lvm@redhat.com
>>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>>      
>>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>    
>>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  
>


-- 
-===========================-
  Ty! Boyack
  NREL Unix Network Manager
  ty@nrel.colostate.edu
  (970) 491-1186
-===========================-
