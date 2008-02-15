Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1FC1mEf017785
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 07:01:48 -0500
Received: from emailgate2.cpvie.co.at (mail.cpvie.co.at [195.234.151.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1FC1I3N030181
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 07:01:19 -0500
Message-ID: <47B57F48.6090009@cargo-partner.com>
Date: Fri, 15 Feb 2008 13:02:16 +0100
From: =?ISO-8859-1?Q?Michael_Eisenk=F6lbl?=
	<michael.eisenkoelbl@cargo-partner.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mirrored LV + cmirror problem
References: <76EAFFE5-C713-42D4-B6DC-9F63F56C071C@ulx.hu>
In-Reply-To: <76EAFFE5-C713-42D4-B6DC-9F63F56C071C@ulx.hu>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

how big are the LUNs?

michael

Lajk� Attila schrieb:
> Hello,
>
>
> I have a problem with clvmd an cmirror:
>
> We have a two nodes cluster (RHEL4.6). I created a mirrored LV on a 
> clustered volume group on 2 iscsi LUNS (VTrak M200i).
> When i disconnect one of the LUNs - simulating a storage problem -  
> the mirrored LV doesn't go to linear mode, the LVM commands (lvs, 
> lvconvert, etc.) get stuck and the GFS file system is not accessible 
> (on both nodes).
>
> What is see in /var/log/messages:
>
> Feb 15 12:29:26 el42 kernel: dm-cmirror: server_complete_resync_work - 
> Setting recovery_halted = 1
> Feb 15 12:29:26 el42 kernel: dm-cmirror: Log flush failure: -5 -EIO
> Feb 15 12:29:26 el42 last message repeated 4 times
> Feb 15 12:29:26 el42 kernel: dm-cmirror: Log flush failure: -5 -EIO
> Feb 15 12:29:26 el42 kernel: dm-cmirror: Recovery halted due to error 
> on ItlWCmkP
> Feb 15 12:29:26 el42 lvm[4929]: WARNING: dev_open(/dev/mapper/mirrp3) 
> called while suspended
> Feb 15 12:29:26 el42 kernel: dm-cmirror: LOG INFO:
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   uuid: 
> LVM-zEHPYfjtLCL7yqQhsG2kcPzthyLbyBPd7xlok1gd7NHgXR3l2XaVQWEVItlWCmkP
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   uuid_ref    : 1
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   log type    : disk
> Feb 15 12:29:26 el42 kernel: dm-cmirror:  ?region_count: 320
> Feb 15 12:29:26 el42 kernel: dm-cmirror:  ?sync_count  : 320
> Feb 15 12:29:26 el42 kernel: dm-cmirror:  ?sync_search : 320
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   in_sync     : YES
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   suspended   : NO
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   recovery_halted : YES
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   server_id   : 2
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   server_valid: YES
> Feb 15 12:29:26 el42 kernel: dm-cmirror: cluster_presuspend: recovery 
> halted on ItlWCmkP(1)
> Feb 15 12:29:26 el42 kernel: dm-cmirror: cluster_postsuspend
> Feb 15 12:29:26 el42 kernel: dm-cmirror: Telling everyone I'm 
> suspending (ItlWCmkP)
> Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_MASTER_LEAVING(13): 
> (ItlWCmkP)
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   co-ordinator: 0
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   node_count  : 0
> Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_MASTER_LEAVING(13): 
> (ItlWCmkP)
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   co-ordinator: 0
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   node_count  : 2
> Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_ELECTION(10): (ItlWCmkP)
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   co-ordinator: 57005
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   node_count  : 0
> Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_ELECTION(10): (ItlWCmkP)
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
> Feb 15 12:29:26 el42 lvm[4929]: WARNING: dev_open(/etc/lvm/lvm.conf) 
> called while suspended
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   co-ordinator: 1
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   node_count  : 2
> Feb 15 12:29:26 el42 kernel: dm-cmirror: LRT_SELECTION(11): (ItlWCmkP)
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   starter     : 2
> Feb 15 12:29:27 el42 kernel: dm-cmirror:   co-ordinator: 1
> Feb 15 12:29:27 el42 kernel: dm-cmirror:   node_count  : 2
> Feb 15 12:29:27 el42 kernel: dm-cmirror: LRT_MASTER_ASSIGN(12): 
> (ItlWCmkP)
> Feb 15 12:29:27 el42 kernel: dm-cmirror:   starter     : 2
> Feb 15 12:29:27 el42 kernel: dm-cmirror:   co-ordinator: 1
> Feb 15 12:29:27 el42 lvm[4929]: Failed to remove faulty devices in 
> vgtest-lvtest
> Feb 15 12:29:27 el42 kernel: dm-cmirror:   node_count  : 1
> Feb 15 12:29:27 el42 kernel: dm-cmirror: Suspending now (ItlWCmkP)
> Feb 15 12:29:28 el42 lvm[4929]: No longer monitoring mirror device 
> vgtest-lvtest for events
>
> Regards,
> Attila Lajk�
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
