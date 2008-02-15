Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1FDR4BP032562
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 08:27:04 -0500
Received: from ulx.hu (ulx.tvnet.hu [195.38.96.124])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1FDQSO9011093
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 08:26:29 -0500
Received: from lucy.ulx.hu (lucy [172.16.0.2])
	by ulx.hu (Postfix) with ESMTP id 762AE6AC37
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 14:26:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lucy.ulx.hu (Postfix) with ESMTP id 4032E6405D
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 14:26:23 +0100 (CET)
Received: from lucy.ulx.hu ([127.0.0.1])
	by localhost (lucy.ulx.hu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QcQ76jIvgCcs for <linux-lvm@redhat.com>;
	Fri, 15 Feb 2008 14:26:16 +0100 (CET)
Received: from [172.16.1.240] (unknown [172.16.1.240])
	by lucy.ulx.hu (Postfix) with ESMTP id D66616405C
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 14:26:16 +0100 (CET)
Message-Id: <7295141C-E890-4789-A7FB-110709A2EFA4@ulx.hu>
From: =?ISO-8859-1?Q?Lajk=F3_Attila?= <Lajko.Attila@ulx.hu>
In-Reply-To: <47B57F48.6090009@cargo-partner.com>
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: Re: [linux-lvm] mirrored LV + cmirror problem
Date: Fri, 15 Feb 2008 14:26:16 +0100
References: <76EAFFE5-C713-42D4-B6DC-9F63F56C071C@ulx.hu>
	<47B57F48.6090009@cargo-partner.com>
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


The VTrak LUNs are 1 and 5GB. The PVs are on a 240 MB partition on  
each luns , the LV size is 160 MB. It's just a test.

Attila.

On Feb 15, 2008, at 1:02 PM, Michael Eisenk�lbl wrote:

> how big are the LUNs?
>
> michael
>
> Lajk� Attila schrieb:
>> Hello,
>>
>>
>> I have a problem with clvmd an cmirror:
>>
>> We have a two nodes cluster (RHEL4.6). I created a mirrored LV on a  
>> clustered volume group on 2 iscsi LUNS (VTrak M200i).
>> When i disconnect one of the LUNs - simulating a storage problem -   
>> the mirrored LV doesn't go to linear mode, the LVM commands (lvs,  
>> lvconvert, etc.) get stuck and the GFS file system is not  
>> accessible (on both nodes).
>>
>> What is see in /var/log/messages:
>>
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:  
>> server_complete_resync_work - Setting recovery_halted = 1
>> Feb 15 12:29:26 el42 kernel: dm-cmirror: Log flush failure: -5 -EIO
>> Feb 15 12:29:26 el42 last message repeated 4 times
>> Feb 15 12:29:26 el42 kernel: dm-cmirror: Log flush failure: -5 -EIO
>> Feb 15 12:29:26 el42 kernel: dm-cmirror: Recovery halted due to  
>> error on ItlWCmkP
>> Feb 15 12:29:26 el42 lvm[4929]: WARNING: dev_open(/dev/mapper/ 
>> mirrp3) called while suspended
>> Feb 15 12:29:26 el42 kernel: dm-cmirror: LOG INFO:
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   uuid: LVM- 
>> zEHPYfjtLCL7yqQhsG2kcPzthyLbyBPd7xlok1gd7NHgXR3l2XaVQWEVItlWCmkP
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   uuid_ref    : 1
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   log type    : disk
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:  ?region_count: 320
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:  ?sync_count  : 320
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:  ?sync_search : 320
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   in_sync     : YES
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   suspended   : NO
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   recovery_halted : YES
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   server_id   : 2
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   server_valid: YES
>> Feb 15 12:29:26 el42 kernel: dm-cmirror: cluster_presuspend:  
>> recovery halted on ItlWCmkP(1)
>> Feb 15 12:29:26 el42 kernel: dm-cmirror: cluster_postsuspend
>> Feb 15 12:29:26 el42 kernel: dm-cmirror: Telling everyone I'm  
>> suspending (ItlWCmkP)
>> Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_MASTER_LEAVING(13):  
>> (ItlWCmkP)
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   co-ordinator: 0
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   node_count  : 0
>> Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_MASTER_LEAVING(13):  
>> (ItlWCmkP)
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   co-ordinator: 0
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   node_count  : 2
>> Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_ELECTION(10): (ItlWCmkP)
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   co-ordinator: 57005
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   node_count  : 0
>> Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_ELECTION(10): (ItlWCmkP)
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
>> Feb 15 12:29:26 el42 lvm[4929]: WARNING: dev_open(/etc/lvm/ 
>> lvm.conf) called while suspended
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   co-ordinator: 1
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   node_count  : 2
>> Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_SELECTION(11):  
>> (ItlWCmkP)
>> Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
>> Feb 15 12:29:27 el42 kernel: dm-cmirror:   co-ordinator: 1
>> Feb 15 12:29:27 el42 kernel: dm-cmirror:   node_count  : 2
>> Feb 15 12:29:27 el42 kernel: dm-cmirror: LRT_MASTER_ASSIGN(12):  
>> (ItlWCmkP)
>> Feb 15 12:29:27 el42 kernel: dm-cmirror:   starter     : 2
>> Feb 15 12:29:27 el42 kernel: dm-cmirror:   co-ordinator: 1
>> Feb 15 12:29:27 el42 lvm[4929]: Failed to remove faulty devices in  
>> vgtest-lvtest
>> Feb 15 12:29:27 el42 kernel: dm-cmirror:   node_count  : 1
>> Feb 15 12:29:27 el42 kernel: dm-cmirror: Suspending now (ItlWCmkP)
>> Feb 15 12:29:28 el42 lvm[4929]: No longer monitoring mirror device  
>> vgtest-lvtest for events
>>
>> Regards,
>> Attila Lajk�
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
