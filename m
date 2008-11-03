Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA3GwKfA015158
	for <linux-lvm@redhat.com>; Mon, 3 Nov 2008 11:58:20 -0500
Received: from om.cz.net (om.cz.net [193.85.2.13])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA3GuABY009836
	for <linux-lvm@redhat.com>; Mon, 3 Nov 2008 11:56:11 -0500
Received: from 192.168.60.224 ([193.179.76.212])
	by om.cz.net (8.13.8/8.13.8/om) with SMTP id mA3Gu9Ms053684
	for <linux-lvm@redhat.com>; Mon, 3 Nov 2008 17:56:09 +0100 (CET)
Received: from [192.168.58.13] (skadlec.es.gk-software.com [192.168.58.13])
	by hermes.es.gk-software.com (Postfix) with ESMTP id 633738F755
	for <linux-lvm@redhat.com>; Mon,  3 Nov 2008 17:56:09 +0100 (CET)
Message-ID: <490F2D32.5080205@gk-software.com>
Date: Mon, 03 Nov 2008 17:56:18 +0100
From: Stepan Kadlec <skadlec@gk-software.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd locking disabled
References: <490678BE.1070700@hidden.domain.name>	<08781647-26E4-46F3-B148-A64933B84363@redhat.com>	<4907AF21.4030808@hidden.domain.name>	<49083B9E.4090308@gk-software.com>	<49083EBC.5080301@gk-software.com>	<490849C2.2040900@redhat.com>	<490AF885.3060504@gk-software.com>
	<490AFD59.8070809@redhat.com>
In-Reply-To: <490AFD59.8070809@redhat.com>
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

Milan Broz wrote:
> Stepan Kadlec wrote:
>> ok, I have recompiled it with --with-cluster=internal, but still seeing:
>>
>> WARNING: Locking disabled. Be careful! This could corrupt your metadata.
> 
> Is it during clvmd initialization only?
> 

yes. where else could it occur?

> clvmd tries to initialize locks for possible already activated volumes
> (mostly safety/force restart check, clvmd must start before clustered LVs
> are activated anyway)
> 
> It simply run lvs command (forcing nolocking for this command)
> to check which volumes are activated.
> The log message is misleading here...
> 

the LVs are imho not activated but CLVMd still complains about disabled 
locking:

xen01:/etc/init.d # lvscan
File descriptor 3 (/dev/tty) leaked on lvscan invocation. Parent PID 
2637: bash
File descriptor 5 (/dev/pts/5) leaked on lvscan invocation. Parent PID 
2637: bash
File descriptor 7 (pipe:[721181]) leaked on lvscan invocation. Parent 
PID 2637: bash
   inactive          '/dev/xen/test' [3,00 GB] inherit
   inactive          '/dev/xen/test2' [3,00 GB] inherit
xen01:/etc/init.d # lvs
File descriptor 3 (/dev/tty) leaked on lvs invocation. Parent PID 2637: bash
File descriptor 5 (/dev/pts/5) leaked on lvs invocation. Parent PID 
2637: bash
File descriptor 7 (pipe:[721181]) leaked on lvs invocation. Parent PID 
2637: bash
   LV    VG   Attr   LSize Origin Snap%  Move Log Copy%  Convert
   test  xen  -wi--- 3,00G
   test2 xen  -wi--- 3,00G

this is the CLVMd log written during those command invocation:

xen01:/usr/local/src/LVM2.2.02.41 # clvmd -d 2
CLVMD[c7bbc6d0]: Nov  3 19:49:56 CLVMD started
CLVMD[c7bbc6d0]: Nov  3 19:49:56 Connected to CMAN
CLVMD[c7bbc6d0]: Nov  3 19:49:56 CMAN initialisation complete
CLVMD[c7bbc6d0]: Nov  3 19:49:57 DLM initialisation complete
CLVMD[c7bbc6d0]: Nov  3 19:49:57 Cluster ready, doing some more 
initialisation
CLVMD[c7bbc6d0]: Nov  3 19:49:57 starting LVM thread
CLVMD[426e3940]: Nov  3 19:49:57 LVM thread function started
CLVMD[c7bbc6d0]: Nov  3 19:49:57 clvmd ready for work
CLVMD[c7bbc6d0]: Nov  3 19:49:57 Using timeout of 60 seconds
File descriptor 3 (/dev/tty) leaked on lvm invocation. Parent PID 13833: 
clvmd
File descriptor 5 (/dev/pts/3) leaked on lvm invocation. Parent PID 
13833: clvmd
File descriptor 7 (pipe:[712876]) leaked on lvm invocation. Parent PID 
13833: clvmd
File descriptor 8 (/dev/zero) leaked on lvm invocation. Parent PID 
13833: clvmd
   WARNING: Locking disabled. Be careful! This could corrupt your metadata.
CLVMD[426e3940]: Nov  3 19:49:57 LVM thread waiting for work
CLVMD[c7bbc6d0]: Nov  3 19:50:09 Got new connection on fd 12
CLVMD[c7bbc6d0]: Nov  3 19:50:09 Read on local socket 12, len = 26
CLVMD[c7bbc6d0]: Nov  3 19:50:09 creating pipe, [13, 14]
CLVMD[c7bbc6d0]: Nov  3 19:50:09 Creating pre&post thread
CLVMD[40f3e940]: Nov  3 19:50:09 in sub thread: client = 0x592d60
CLVMD[40f3e940]: Nov  3 19:50:09 Sub thread ready for work.
CLVMD[40f3e940]: Nov  3 19:50:09 doing PRE command LOCK_VG 'V_xen' at 1 
(client=0x592d60)
CLVMD[40f3e940]: Nov  3 19:50:09 sync_lock: 'V_xen' mode:3 flags=0
CLVMD[40f3e940]: Nov  3 19:50:09 sync_lock: returning lkid 5d0001
CLVMD[40f3e940]: Nov  3 19:50:09 Writing status 0 down pipe 14
CLVMD[40f3e940]: Nov  3 19:50:09 Waiting to do post command - state = 0
CLVMD[c7bbc6d0]: Nov  3 19:50:09 Created pre&post thread, state = 0
CLVMD[c7bbc6d0]: Nov  3 19:50:09 read on PIPE 13: 4 bytes: status: 0
CLVMD[c7bbc6d0]: Nov  3 19:50:09 background routine status was 0, 
sock_client=0x592d60
CLVMD[c7bbc6d0]: Nov  3 19:50:09 distribute command: XID = 0
CLVMD[c7bbc6d0]: Nov  3 19:50:09 add_to_lvmqueue: cmd=0x593200. 
client=0x592d60, msg=0x592ee0, len=26, csid=(nil), xid=0
CLVMD[426e3940]: Nov  3 19:50:09 process_work_item: local
CLVMD[426e3940]: Nov  3 19:50:09 process_local_command: LOCK_VG (0x33) 
msg=0x593240, msglen =26, client=0x592d60
CLVMD[426e3940]: Nov  3 19:50:09 Dropping metadata for VG xen
CLVMD[426e3940]: Nov  3 19:50:09 Reply from node 
xen01.es.gk-software.com: 0 bytes
CLVMD[426e3940]: Nov  3 19:50:09 Got 1 replies, expecting: 1
CLVMD[426e3940]: Nov  3 19:50:09 LVM thread waiting for work
CLVMD[40f3e940]: Nov  3 19:50:09 Got post command condition...
CLVMD[40f3e940]: Nov  3 19:50:09 Waiting for next pre command
CLVMD[c7bbc6d0]: Nov  3 19:50:09 read on PIPE 13: 4 bytes: status: 0
CLVMD[c7bbc6d0]: Nov  3 19:50:09 background routine status was 0, 
sock_client=0x592d60
CLVMD[c7bbc6d0]: Nov  3 19:50:09 Send local reply
CLVMD[c7bbc6d0]: Nov  3 19:50:09 Read on local socket 12, len = 26
CLVMD[40f3e940]: Nov  3 19:50:09 Got pre command condition...
CLVMD[40f3e940]: Nov  3 19:50:09 doing PRE command LOCK_VG 'V_xen' at 6 
(client=0x592d60)
CLVMD[40f3e940]: Nov  3 19:50:09 sync_unlock: 'V_xen' lkid:5d0001
CLVMD[40f3e940]: Nov  3 19:50:09 Writing status 0 down pipe 14
CLVMD[40f3e940]: Nov  3 19:50:09 Waiting to do post command - state = 0
CLVMD[c7bbc6d0]: Nov  3 19:50:09 read on PIPE 13: 4 bytes: status: 0
CLVMD[c7bbc6d0]: Nov  3 19:50:09 background routine status was 0, 
sock_client=0x592d60
CLVMD[c7bbc6d0]: Nov  3 19:50:09 distribute command: XID = 1
CLVMD[c7bbc6d0]: Nov  3 19:50:09 add_to_lvmqueue: cmd=0x593200. 
client=0x592d60, msg=0x592ee0, len=26, csid=(nil), xid=1
CLVMD[426e3940]: Nov  3 19:50:09 process_work_item: local
CLVMD[426e3940]: Nov  3 19:50:09 process_local_command: LOCK_VG (0x33) 
msg=0x5931d0, msglen =26, client=0x592d60
CLVMD[426e3940]: Nov  3 19:50:09 Dropping metadata for VG xen
CLVMD[426e3940]: Nov  3 19:50:09 Reply from node 
xen01.es.gk-software.com: 0 bytes
CLVMD[426e3940]: Nov  3 19:50:09 Got 1 replies, expecting: 1
CLVMD[426e3940]: Nov  3 19:50:09 LVM thread waiting for work
CLVMD[40f3e940]: Nov  3 19:50:09 Got post command condition...
CLVMD[40f3e940]: Nov  3 19:50:09 Waiting for next pre command
CLVMD[c7bbc6d0]: Nov  3 19:50:09 read on PIPE 13: 4 bytes: status: 0
CLVMD[c7bbc6d0]: Nov  3 19:50:09 background routine status was 0, 
sock_client=0x592d60
CLVMD[c7bbc6d0]: Nov  3 19:50:09 Send local reply
CLVMD[c7bbc6d0]: Nov  3 19:50:09 Read on local socket 12, len = 0
CLVMD[c7bbc6d0]: Nov  3 19:50:09 EOF on local socket: inprogress=0
CLVMD[c7bbc6d0]: Nov  3 19:50:09 Waiting for child thread
CLVMD[40f3e940]: Nov  3 19:50:09 Got pre command condition...
CLVMD[40f3e940]: Nov  3 19:50:09 Subthread finished
CLVMD[c7bbc6d0]: Nov  3 19:50:09 Joined child thread
CLVMD[c7bbc6d0]: Nov  3 19:50:09 ret == 0, errno = 2. removing client
CLVMD[c7bbc6d0]: Nov  3 19:50:09 add_to_lvmqueue: cmd=0x592f10. 
client=0x592d60, msg=(nil), len=0, csid=(nil), xid=1
CLVMD[426e3940]: Nov  3 19:50:09 process_work_item: free fd 12
CLVMD[426e3940]: Nov  3 19:50:09 LVM thread waiting for work
CLVMD[c7bbc6d0]: Nov  3 19:50:12 Got new connection on fd 12
CLVMD[c7bbc6d0]: Nov  3 19:50:12 Read on local socket 12, len = 26
CLVMD[c7bbc6d0]: Nov  3 19:50:12 creating pipe, [13, 14]
CLVMD[c7bbc6d0]: Nov  3 19:50:12 Creating pre&post thread
CLVMD[40f3e940]: Nov  3 19:50:12 in sub thread: client = 0x592d60
CLVMD[40f3e940]: Nov  3 19:50:12 Sub thread ready for work.
CLVMD[40f3e940]: Nov  3 19:50:12 doing PRE command LOCK_VG 'V_xen' at 1 
(client=0x592d60)
CLVMD[40f3e940]: Nov  3 19:50:12 sync_lock: 'V_xen' mode:3 flags=0
CLVMD[40f3e940]: Nov  3 19:50:12 sync_lock: returning lkid 38f0001
CLVMD[40f3e940]: Nov  3 19:50:12 Writing status 0 down pipe 14
CLVMD[40f3e940]: Nov  3 19:50:12 Waiting to do post command - state = 0
CLVMD[c7bbc6d0]: Nov  3 19:50:12 Created pre&post thread, state = 0
CLVMD[c7bbc6d0]: Nov  3 19:50:12 read on PIPE 13: 4 bytes: status: 0
CLVMD[c7bbc6d0]: Nov  3 19:50:12 background routine status was 0, 
sock_client=0x592d60
CLVMD[c7bbc6d0]: Nov  3 19:50:12 distribute command: XID = 2
CLVMD[c7bbc6d0]: Nov  3 19:50:12 add_to_lvmqueue: cmd=0x592f10. 
client=0x592d60, msg=0x592ee0, len=26, csid=(nil), xid=2
CLVMD[426e3940]: Nov  3 19:50:12 process_work_item: local
CLVMD[426e3940]: Nov  3 19:50:12 process_local_command: LOCK_VG (0x33) 
msg=0x592f80, msglen =26, client=0x592d60
CLVMD[426e3940]: Nov  3 19:50:12 Dropping metadata for VG xen
CLVMD[426e3940]: Nov  3 19:50:12 Reply from node 
xen01.es.gk-software.com: 0 bytes
CLVMD[426e3940]: Nov  3 19:50:12 Got 1 replies, expecting: 1
CLVMD[426e3940]: Nov  3 19:50:12 LVM thread waiting for work
CLVMD[40f3e940]: Nov  3 19:50:12 Got post command condition...
CLVMD[40f3e940]: Nov  3 19:50:12 Waiting for next pre command
CLVMD[c7bbc6d0]: Nov  3 19:50:12 read on PIPE 13: 4 bytes: status: 0
CLVMD[c7bbc6d0]: Nov  3 19:50:12 background routine status was 0, 
sock_client=0x592d60
CLVMD[c7bbc6d0]: Nov  3 19:50:12 Send local reply
CLVMD[c7bbc6d0]: Nov  3 19:50:12 Read on local socket 12, len = 26
CLVMD[40f3e940]: Nov  3 19:50:12 Got pre command condition...
CLVMD[40f3e940]: Nov  3 19:50:12 doing PRE command LOCK_VG 'V_xen' at 6 
(client=0x592d60)
CLVMD[40f3e940]: Nov  3 19:50:12 sync_unlock: 'V_xen' lkid:38f0001
CLVMD[40f3e940]: Nov  3 19:50:12 Writing status 0 down pipe 14
CLVMD[40f3e940]: Nov  3 19:50:12 Waiting to do post command - state = 0
CLVMD[c7bbc6d0]: Nov  3 19:50:12 read on PIPE 13: 4 bytes: status: 0
CLVMD[c7bbc6d0]: Nov  3 19:50:12 background routine status was 0, 
sock_client=0x592d60
CLVMD[c7bbc6d0]: Nov  3 19:50:12 distribute command: XID = 3
CLVMD[c7bbc6d0]: Nov  3 19:50:12 add_to_lvmqueue: cmd=0x592f10. 
client=0x592d60, msg=0x592ee0, len=26, csid=(nil), xid=3
CLVMD[426e3940]: Nov  3 19:50:12 process_work_item: local
CLVMD[426e3940]: Nov  3 19:50:12 process_local_command: LOCK_VG (0x33) 
msg=0x592f50, msglen =26, client=0x592d60
CLVMD[426e3940]: Nov  3 19:50:12 Dropping metadata for VG xen
CLVMD[426e3940]: Nov  3 19:50:12 Reply from node 
xen01.es.gk-software.com: 0 bytes
CLVMD[426e3940]: Nov  3 19:50:12 Got 1 replies, expecting: 1
CLVMD[426e3940]: Nov  3 19:50:12 LVM thread waiting for work
CLVMD[40f3e940]: Nov  3 19:50:12 Got post command condition...
CLVMD[40f3e940]: Nov  3 19:50:12 Waiting for next pre command
CLVMD[c7bbc6d0]: Nov  3 19:50:12 read on PIPE 13: 4 bytes: status: 0
CLVMD[c7bbc6d0]: Nov  3 19:50:12 background routine status was 0, 
sock_client=0x592d60
CLVMD[c7bbc6d0]: Nov  3 19:50:12 Send local reply
CLVMD[c7bbc6d0]: Nov  3 19:50:12 Read on local socket 12, len = 0
CLVMD[c7bbc6d0]: Nov  3 19:50:12 EOF on local socket: inprogress=0
CLVMD[c7bbc6d0]: Nov  3 19:50:12 Waiting for child thread
CLVMD[40f3e940]: Nov  3 19:50:12 Got pre command condition...
CLVMD[40f3e940]: Nov  3 19:50:12 Subthread finished
CLVMD[c7bbc6d0]: Nov  3 19:50:12 Joined child thread
CLVMD[c7bbc6d0]: Nov  3 19:50:12 ret == 0, errno = 9. removing client
CLVMD[c7bbc6d0]: Nov  3 19:50:12 add_to_lvmqueue: cmd=0x592f10. 
client=0x592d60, msg=(nil), len=0, csid=(nil), xid=3
CLVMD[426e3940]: Nov  3 19:50:12 process_work_item: free fd 12
CLVMD[426e3940]: Nov  3 19:50:12 LVM thread waiting for work


bye stepan

> After clvmd initialization, it should work as expected.
> 
> Milan
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

-- 
Eurosoftware s.r.o.
skadlec@gk-software.com
+420 379 307 379
+420 724 554 104
