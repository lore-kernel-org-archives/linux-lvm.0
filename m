Received: from [192.168.1.101] (vpn-248-56.boston.redhat.com [10.13.248.56])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1JFhaGn008172
	for <linux-lvm@redhat.com>; Tue, 19 Feb 2008 10:43:37 -0500
Message-Id: <EA71F719-6F12-47FF-8A0B-6B0C4AC89A55@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <64930681-3E2C-43C0-90CD-C90D438F8908@ulx.hu>
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: Re: [linux-lvm] mirrored LV + cmirror problem
Date: Tue, 19 Feb 2008 09:43:35 -0600
References: <76EAFFE5-C713-42D4-B6DC-9F63F56C071C@ulx.hu>
	<2D7245F3-4FBF-4569-BBA9-22E37E22C58A@redhat.com>
	<F66CC8D7-624C-4090-B0D8-1A0406B384A4@ulx.hu>
	<1D5E8B4E-A142-4276-8D12-5EB64E2AC2E3@redhat.com>
	<31248093.1203252552606.OPEN-XCHANGE.WebMail.ox@lucy.ulx.hu>
	<CB529B09-D602-4B23-AD87-6702B24B2086@redhat.com>
	<9EB92745-951F-4C64-8E66-3EA0999A3A14@ulx.hu>
	<A97F9A76-A330-4BEF-8D1F-4A96E91D37CE@redhat.com>
	<64930681-3E2C-43C0-90CD-C90D438F8908@ulx.hu>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

I've heard of people trying to create GNBD SANs in the past...  Some  
have gone so far as to have many nodes and pool the mirrors together...

It can be tricky.  IIRC, one of the trickiest parts was bringing the  
node back, reinserting the GNBD disk into the volume group, and  
converting back to mirror.

Also, I think the remote node uses the GNBD interface, while the local  
node simply uses the local interface.  You may be able to use iSCSI  
too, but I'm not sure.

  brassow

On Feb 19, 2008, at 7:51 AM, Lajk� Attila wrote:

> I disconnected the lun from both nodes and it worked, the LV went to  
> linear. Thanks for the help!
>
> One more question, what do you think about this testing scenario:  
> Two-nodes cluster, each node has a local disk which is exported via  
> GNBD to itself and to the other one. I build a cluster-mirrored LV  
> on the GNBD devices, then I kill one of the nodes. In this case, the  
> cmirror should work well? The LV will go to linear mode?
>
> Attila
>
> On Feb 18, 2008, at 7:30 PM, Jonathan Brassow wrote:
>
>> That's the problem.  (C)LVM does not currently have a way to handle  
>> the disappearance of a device from just one machine... it expects a  
>> similar view of devices from all machines in a cluster.  "Locking"  
>> on the second node fails because it doesn't know what to do with  
>> the disk that it sees (that has been removed from the node  
>> suffering the failure).
>>
>> There is someone working handling orphaned/removed devices that  
>> reappear (which would be similar to this case), but I'm not sure if  
>> they've taken this scenario into account.  I'll let him know about  
>> this.
>>
>> brassow
>>
>> On Feb 18, 2008, at 10:48 AM, Lajk� Attila wrote:
>>
>>> Yes, I disconnected the lun via the Vtrak GUI from one of the  
>>> nodes (el4).
>>>
>>> Attila
>>>
>>> On Feb 18, 2008, at 5:08 PM, Jonathan Brassow wrote:
>>>
>>>> How are you performing the failures?  It looks like just one  
>>>> machine is loosing its connection to the device, while the other  
>>>> machines links remain in place.
>>>>
>>>> brassow
>>>>
>>>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
