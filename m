Received: from [192.168.1.101] (vpn-248-146.boston.redhat.com [10.13.248.146])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1FFfiLi024083
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 10:41:44 -0500
Message-Id: <2D7245F3-4FBF-4569-BBA9-22E37E22C58A@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <76EAFFE5-C713-42D4-B6DC-9F63F56C071C@ulx.hu>
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: Re: [linux-lvm] mirrored LV + cmirror problem
Date: Fri, 15 Feb 2008 09:41:43 -0600
References: <76EAFFE5-C713-42D4-B6DC-9F63F56C071C@ulx.hu>
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

Are all the packages rhel4.6 as well, or have you compiled pkgs  
yourself?

What was the load you had on the system?

The messages I see from dm-cmirror suggest that it is properly  
shutting down in the face of the failure... However, before it has  
finished, we can see "Failed to remove faulty devices in vgtest- 
lvtest".  This suggests to me that clvmd is not waiting long enough  
for the shutdown to complete, but I only see 3 seconds of the log.   
When was the device failure initiated?

  brassow


On Feb 15, 2008, at 5:36 AM, Lajk� Attila wrote:

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
> Feb 15 12:29:26 el42 kernel: dm-cmirror: server_complete_resync_work  
> - Setting recovery_halted = 1
> Feb 15 12:29:26 el42 kernel: dm-cmirror: Log flush failure: -5 -EIO
> Feb 15 12:29:26 el42 last message repeated 4 times
> Feb 15 12:29:26 el42 kernel: dm-cmirror: Log flush failure: -5 -EIO
> Feb 15 12:29:26 el42 kernel: dm-cmirror: Recovery halted due to  
> error on ItlWCmkP
> Feb 15 12:29:26 el42 lvm[4929]: WARNING: dev_open(/dev/mapper/ 
> mirrp3) called while suspended
> Feb 15 12:29:26 el42 kernel: dm-cmirror: LOG INFO:
> Feb 15 12:29:26 el42 kernel: dm-cmirror:   uuid: LVM- 
> zEHPYfjtLCL7yqQhsG2kcPzthyLbyBPd7xlok1gd7NHgXR3l2XaVQWEVItlWCmkP
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
> Feb 15 12:29:26 el42 kernel: dm-cmirror: cluster_presuspend:  
> recovery halted on ItlWCmkP(1)
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
