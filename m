From: "B. J. Zolp" <bjzolp@wisc.edu>
Subject: [Fwd: [linux-lvm] vgck seg faulting]
Message-id: <3FFCF4B4.6000004@wisc.edu>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_nrQP9b1aNb83iV9hIzhG3w)"
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Jan  8 10:41:03 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

--Boundary_(ID_nrQP9b1aNb83iV9hIzhG3w)
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT

Does anyone beleive that running a tool such as gpart or rescuept would 
help recover the missing superblock and allow me to mount the logical 
volume?

Since the actual device /dev/vg0/logical0 actually gets created is it 
safe to assume that all LVM metadata is intact and correct and my 
problem is with the filesystem, not the lower level LVM?


Thanks,

Bernard Zolp



--Boundary_(ID_nrQP9b1aNb83iV9hIzhG3w)
Content-type: message/rfc822; name="[linux-lvm] vgck seg faulting"

Return-path: <linux-lvm-admin@sistina.com>
Received: from smtp2.wiscmail.wisc.edu (donnerpvt [144.92.197.219])
 by mailst1.doit.wisc.edu
 (iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
 with ESMTP id <0HR100M8Y8TS65@mailst1.doit.wisc.edu> for bjzolp@wisc.edu; Mon,
 05 Jan 2004 13:58:43 -0600 (CST)
Received: from spam-1.services.wisc.edu (mustang.doit.wisc.edu [128.104.1.225])
 by smtp2.doit.wisc.edu
 (iPlanet Messaging Server 5.2 HotFix 1.20 (built Aug 27 2003))
 with ESMTP id <0HR100KMI8TTDW@smtp2.doit.wisc.edu> for bjzolp@wisc.edu
 (ORCPT bjzolp@wisc.edu); Mon, 05 Jan 2004 13:58:41 -0600 (CST)
Received: from smtp3.doit.wisc.edu (blitzen.doit.wisc.edu [144.92.197.183])
	by spam-1.services.wisc.edu (8.12.9/8.12.9) with ESMTP id i05Jb584015174	for
 <@mailst1.doit.wisc.edu:bjzolp@wisc.edu>; Mon, 05 Jan 2004 13:58:24 -0600
Received: from conversion_ext-daemon.smtp3.doit.wisc.edu by smtp3.doit.wisc.edu
 (iPlanet Messaging Server 5.2 HotFix 1.20 (built Aug 27 2003))
 id <0HR100B018HQWI@smtp3.doit.wisc.edu> for bjzolp@wisc.edu
 (ORCPT bjzolp@wisc.edu); Mon, 05 Jan 2004 13:56:06 -0600 (CST)
Received: from hermes.sistina.com (hermes.sistina.com [208.210.149.36])
 by smtp3.doit.wisc.edu
 (iPlanet Messaging Server 5.2 HotFix 1.20 (built Aug 27 2003))
 with ESMTP id <0HR100MYP8PGGC@smtp3.doit.wisc.edu> for bjzolp@wisc.edu
 (ORCPT bjzolp@wisc.edu); Mon, 05 Jan 2004 13:56:04 -0600 (CST)
Received: from localhost ([127.0.0.1] helo=hermes.sistina.com)
	by hermes.sistina.com with esmtp (Exim 3.34 #1)	id 1AdapW-0006JE-00; Mon,
 05 Jan 2004 13:56:02 -0600
Received: from daemon by hermes.sistina.com with spam-scanned (Exim 3.34 #1)
	id 1Adaod-0006HS-00; Mon, 05 Jan 2004 13:55:07 -0600
Received: from heimdall.doit.wisc.edu
 ([144.92.197.159] helo=smtp5.wiscmail.wisc.edu)	by hermes.sistina.com with
 esmtp (Exim 3.34 #1)	id 1Adand-0006Fz-00	for linux-lvm@sistina.com; Mon,
 05 Jan 2004 13:54:05 -0600
Received: from conversion-daemon.smtp5.doit.wisc.edu by smtp5.doit.wisc.edu
 (iPlanet Messaging Server 5.2 HotFix 1.20 (built Aug 27 2003))
 id <0HR100F018CF49@smtp5.doit.wisc.edu> for linux-lvm@sistina.com; Mon,
 05 Jan 2004 13:53:59 -0600 (CST)
Received: from wisc.edu
 (adsl-64-109-132-21.dsl.mdsnwi.ameritech.net [64.109.132.21])
 by smtp5.doit.wisc.edu
 (iPlanet Messaging Server 5.2 HotFix 1.20 (built Aug 27 2003))
 with ESMTPSA id <0HR1006DJ8LYJ4@smtp5.doit.wisc.edu> for
 linux-lvm@sistina.com; Mon, 05 Jan 2004 13:53:59 -0600 (CST)
Date: Mon, 05 Jan 2004 13:57:05 -0600
From: "B. J. Zolp" <bjzolp@wisc.edu>
Subject: [linux-lvm] vgck seg faulting
Sender: linux-lvm-admin@sistina.com
To: linux-lvm@sistina.com
Errors-to: linux-lvm-admin@sistina.com
Reply-to: linux-lvm@sistina.com
Message-id: <3FF9C191.5090006@wisc.edu>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7BIT
X-Accept-Language: en-us, en
Precedence: bulk
X-BeenThere: linux-lvm@sistina.com
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.3.1)
 Gecko/20030425
X-Spam-Status: No, hits=0.0 required=7.0 tests= version=2.20
X-Spam-Level: 
X-Original-Date: Mon, 05 Jan 2004 13:57:05 -0600
X-Spam-Score: 
X-Spam-Report: Probability=8%, Hits=X_ACCEPT_LANG 0, USER_AGENT 0.000
X-Mailman-Version: 2.0.11
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Id: linux-lvm general discussion <linux-lvm.sistina.com>
Original-recipient: rfc822;bjzolp@wisc.edu

I recently replaced a failing drive in my lvm1 volume group by doing a 
dd from the bad drive to a new drive.  However after a few days I can no 
longer mount the logical volume.  When I try to the mount the volume I 
get this output:

mount: wrong fs type, bad option, bad superblock on /dev/vg0/logical0,
       or too many mounted file systems

I have a feeling that the superblock is corrupt. 

I tried running vgck, but it seg faults after a point:

vgck -v
vgck -- locking logical volume manager
vgck -- finding all volume group(s)
vgck -- checking volume group name "vg0"
vgck -- checking existence of volume group "vg0"
vgck -- reading volume group data for "vg0" from lvmtab
vgck -- checking volume group consistency  of "vg0" in lvmtab
vgck -- VGDA of "vg0" in lvmtab is consistent
vgck -- reading volume group data for "vg0" from physical volume(s)
Segmentation fault (core dumped)


Can anyone help me get this mounted again?

thanks,

Bernard Zolp


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--Boundary_(ID_nrQP9b1aNb83iV9hIzhG3w)--
