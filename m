Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p67DZF6f032148
	for <linux-lvm@redhat.com>; Thu, 7 Jul 2011 09:35:15 -0400
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p67DZDSi010014
	for <linux-lvm@redhat.com>; Thu, 7 Jul 2011 09:35:13 -0400
Message-ID: <4E15B60C.7040007@alteeve.com>
Date: Thu, 07 Jul 2011 09:35:08 -0400
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
References: <883D98939E388E429EE8D771168A6560027EBABF58@USCMIMAIL1.corp.amdocs.com>
In-Reply-To: <883D98939E388E429EE8D771168A6560027EBABF58@USCMIMAIL1.corp.amdocs.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Jewsco Pius Jacquez <JewscoPius.Jacquez@Amdocs.com>

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
