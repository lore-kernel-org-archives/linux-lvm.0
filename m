Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n37DMg9U016257
	for <linux-lvm@redhat.com>; Tue, 7 Apr 2009 09:22:42 -0400
Received: from inmx1.eib.org (inmx1.eib.org [194.154.219.100])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n37DMNOp017559
	for <linux-lvm@redhat.com>; Tue, 7 Apr 2009 09:22:24 -0400
Received: from dc1-v490-a.lux.eib.org ([192.168.111.5])
	by mta1-srv.lux.eib.org (Sun Java System Messaging Server 6.2-9.01
	(built Apr
	3 2007)) with ESMTP id <0KHQ005TYFTAKR80@mta1-srv.lux.eib.org> for
	linux-lvm@redhat.com; Tue, 07 Apr 2009 15:22:22 +0200 (MEST)
Received: from CZC72148GM.lux.eib.org ([10.18.24.222])
	by comexp1-srv.lux.eib.org
	(Sun Java System Messaging Server 6.2-9.01 (built Apr  3 2007))
	with ESMTPA id <0KHQ00HDWFTAD910@comexp1-srv.lux.eib.org> for
	linux-lvm@redhat.com; Tue, 07 Apr 2009 15:22:22 +0200 (MEST)
Content-return: prohibited
Date: Tue, 07 Apr 2009 15:22:21 +0200
From: AZZOPARDI Konrad <azzopardi@eib.org>
In-reply-to: <20090406225259.B168561905E@hormel.redhat.com>
Sender: azzopardi@eib.org
Message-id: <0KHQ00HDXFTAD910@comexp1-srv.lux.eib.org>
MIME-version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] RE: using lvm mirroring in clusters
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: linux-lvm@redhat.com

 Hi list,

I am quite new to RedHAt clustering and I am experimenting with RedHat 5.3. I read that LVM mirrors are now supported in cluster mode. At our work place we have two datacentres and each DC has an HDS SAN. The idea is that I put two cluster nodes in each DC and each node will be presented with two multipathed block devices say /dev/dm-5 and /dev/dm-6. How can I create 2 mirrored LVs out of a volume group {comprising the two devices} and assuring that the mirrors are spread between the two devices {to give me the assurance that if one DC is down, data is available in the other device}

Thanks
konrad

--------------------------------------------------------------------

Les informations contenues dans ce message et/ou ses annexes sont 
reservees a l'attention et a l'utilisation de leur destinataire et peuvent etre 
confidentielles. Si vous n'etes pas destinataire de ce message, vous etes 
informes que vous l'avez recu par erreur et que toute utilisation en est 
interdite. Dans ce cas, vous etes pries de le detruire et d'en informer la 
Banque Europeenne d'Investissement.

The information in this message and/or attachments is intended solely for 
the attention and use of the named addressee and may be confidential. If 
you are not the intended recipient, you are hereby notified that you have 
received this transmittal in error and that any use of it is prohibited. In 
such a case please delete this message and kindly notify the European 
Investment Bank accordingly.
--------------------------------------------------------------------
 
