Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p67GZUFD001814
	for <linux-lvm@redhat.com>; Thu, 7 Jul 2011 12:35:31 -0400
Received: from stlint4.amdocs.com (stlint4.amdocs.com [69.150.27.50])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p67GZT5M010368
	for <linux-lvm@redhat.com>; Thu, 7 Jul 2011 12:35:29 -0400
From: Jewsco Pius Jacquez <JewscoPius.Jacquez@Amdocs.com>
Date: Thu, 7 Jul 2011 11:35:21 -0500
Message-ID: <883D98939E388E429EE8D771168A6560027EBAC09E@USCMIMAIL1.corp.amdocs.com>
References: <883D98939E388E429EE8D771168A6560027EBABF58@USCMIMAIL1.corp.amdocs.com>
	<4E15B60C.7040007@alteeve.com>
In-Reply-To: <4E15B60C.7040007@alteeve.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] rhel5.6 lvm2 clvmd
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Digimer <linux@alteeve.com>, LVM general discussion and development <linux-lvm@redhat.com>

Digimer, thanks!

Let me mentioned all.

I have SAN DiskA belongs to VG1 presented to node1 and node2. Node1 & Node2 is under the same cluster.
I created a snapshot of DiskA in Emc storage as BCV copy and called it DiskA-copy and presented it to Node3(not a cluster member).

I importclone the DiskA-copy to a new VG1_clone with lockingtype of 1 but it wont allow me saying skipping clustered volume. I think it is designed this way.

So what I did is use the LVM_SYSTEM_DIR to point to lockingtype of 0 and I was able to import it. 
Is this the way or there are other preferred way to do it.


Thanks,
Jewsco


-----Original Message-----
From: Digimer [mailto:linux@alteeve.com] 
Sent: Thursday, July 07, 2011 8:35 AM
To: LVM general discussion and development
Cc: Jewsco Pius Jacquez
Subject: Re: [linux-lvm] rhel5.6 lvm2 clvmd

On 07/06/2011 04:13 PM, Jewsco Pius Jacquez wrote:
> Hello,
>
> Can a disks be imported from a clustered node(rhel5.6 lvm2/clvmd/cman)
> to a non-cluster node(rhel5.6 lvm2)?
>
> Thanks,
> Jewsco
>
> This message and the information contained herein is proprietary and confidential and subject to the Amdocs policy statement,
> you may review at http://www.amdocs.com/email_disclaimer.asp

If the node was removed from the cluster, then 'lvmconf 
--disable-cluster' will make the appropriate changes to the lvm.conf 
file (locking_type = 1). After that, turn off clvmd and you should be 
able to use the LVM as a normal stand-alone setup.

-- 
Digimer
E-Mail:              digimer@alteeve.com
Freenode handle:     digimer
Papers and Projects: http://alteeve.com
Node Assassin:       http://nodeassassin.org
"I feel confined, only free to expand myself within boundaries."
