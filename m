Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i28Fcu819082
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 10:38:56 -0500
Received: from hotmail.com (bay1-f88.bay1.hotmail.com [65.54.245.88])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i28FcsST002881
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 10:38:54 -0500
From: "Carl Philip" <broix@hotmail.com>
Mime-Version: 1.0
Message-ID: <BAY1-F889Rs55lKf2fF00008d53@hotmail.com>
Subject: [linux-lvm] Extend a lvm from 1.9TB to 2.4TB
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Mar  8 16:26:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I'm running lvm1 on a 1.9TB lvm and i really need to extend it to 2.4-2.5TB.
when i created it, it said "maximum size is 2TB" but if i "upgrade" from 
2.4.24 to 2.6.3 and enable the large block size in the kernel and convert 
the lvm from lvm1 to lvm2, is it possible to extend it over 2TB?
Or do i have to erase everything and start over again in order to make it 
 >2TB ?

I'm just about to compile a new 2.6.3 kernel just to try that, but i'd like 
to know if there are any catches i should know about :)

Regards
/Carl Philip

_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail
